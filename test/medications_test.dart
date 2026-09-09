// Verifies the medications schedule engine (lib/domain/medications.dart):
// next-dose computation within a phase, multi-dose-per-day reminder
// behavior (the reminder should only advance to the next day once every
// dose scheduled for today has actually been logged), dose-based vs.
// time-based phase completion, titration handing off from one phase to the
// next, and that deleting/stopping a medication cleans up its linked
// reminder rather than leaving it orphaned.

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petsalud/data/database.dart';
import 'package:petsalud/data/repositories/medications_repository.dart';
import 'package:petsalud/data/repositories/reminders_repository.dart';
import 'package:petsalud/domain/medications.dart';
import 'package:petsalud/domain/validation.dart';
import 'package:uuid/uuid.dart';

void main() {
  late AppDatabase db;
  late MedicationsRepository medsRepo;
  late RemindersRepository remindersRepo;
  late MedicationActions actions;
  const uuid = Uuid();

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    medsRepo = MedicationsRepository(db);
    remindersRepo = RemindersRepository(db);
    actions = MedicationActions(medsRepo, remindersRepo);
  });

  tearDown(() async => db.close());

  String nowIso() => DateTime.now().toUtc().toIso8601String();
  String isoDateToday() => isoDate(DateTime.now());
  String isoDateTomorrow() => isoDate(DateTime.now().add(const Duration(days: 1)));

  Future<String> insertPet(String name) async {
    final id = uuid.v4();
    await db.into(db.pets).insert(PetsCompanion.insert(
          id: id,
          name: name,
          species: 'dog',
          createdAt: nowIso(),
          lastEditedAt: nowIso(),
        ));
    return id;
  }

  test('single time-based phase: next dose advances through both slots before rolling to tomorrow', () async {
    final petId = await insertPet('Fido');
    final (medId, warnings) = await actions.createMedication(
      {'pet_id': petId, 'name': 'Amoxicillin', 'medication_type': 'pill', 'start_date': isoDateToday()},
      [
        {
          'dose_amount': '1 tablet',
          'times_per_day': 2,
          'dose_times': '08:00,20:00',
          'duration_type': 'time_based',
          'duration_days': 5,
        },
      ],
    );
    expect(warnings, isEmpty);

    var medication = (await medsRepo.get(medId))!;
    var phases = await medsRepo.phasesFor(medId);
    var doses = await medsRepo.dosesFor(medId);
    var schedule = computeSchedule(medication, phases, doses);
    expect(schedule.isComplete, isFalse);
    expect(schedule.nextDoseAt!.hour, 8);

    // A reminder was auto-created and starts due today (the first slot).
    var linked = await remindersRepo.findAllBySource('medication', medId);
    expect(linked, hasLength(1));
    expect(linked.first.dueDate, isoDateToday());

    // Log the 8am dose — the 8pm dose is still due today, so the reminder
    // should NOT advance to tomorrow yet.
    await actions.logDose(medId);
    doses = await medsRepo.dosesFor(medId);
    schedule = computeSchedule(medication, phases, doses);
    expect(schedule.nextDoseAt!.hour, 20);
    linked = await remindersRepo.findAllBySource('medication', medId);
    expect(linked.first.dueDate, isoDateToday());

    // Log the 8pm dose too — now the next slot is tomorrow 8am, so the
    // reminder should roll forward.
    await actions.logDose(medId);
    doses = await medsRepo.dosesFor(medId);
    schedule = computeSchedule(medication, phases, doses);
    expect(schedule.nextDoseAt!.hour, 8);
    expect(isoDate(schedule.nextDoseAt!), isoDateTomorrow());
    linked = await remindersRepo.findAllBySource('medication', medId);
    expect(linked.first.dueDate, isoDateTomorrow());
  });

  test('dose-based duration completes after N doses regardless of elapsed days', () async {
    final petId = await insertPet('Rex');
    final (medId, _) = await actions.createMedication(
      {'pet_id': petId, 'name': 'Pain relief', 'medication_type': 'syrup', 'start_date': isoDateToday()},
      [
        {
          'dose_amount': '5 mL',
          'times_per_day': 1,
          'dose_times': '09:00',
          'duration_type': 'dose_based',
          'duration_dose_count': 3,
        },
      ],
    );

    for (var i = 0; i < 3; i++) {
      await actions.logDose(medId);
    }

    final medication = (await medsRepo.get(medId))!;
    final phases = await medsRepo.phasesFor(medId);
    final doses = await medsRepo.dosesFor(medId);
    final schedule = computeSchedule(medication, phases, doses);
    expect(schedule.isComplete, isTrue);
    expect((await medsRepo.get(medId))!.status, 'completed');

    // The now-pointless "next dose" reminder should be gone, not stuck
    // showing a dose that will never be due.
    final linked = await remindersRepo.findAllBySource('medication', medId);
    expect(linked, isEmpty);
  });

  test('titration: completing phase 1 hands off to phase 2 automatically', () async {
    final petId = await insertPet('Milo');
    final (medId, _) = await actions.createMedication(
      {'pet_id': petId, 'name': 'Prednisone', 'medication_type': 'pill', 'start_date': isoDateToday()},
      [
        {
          'dose_amount': '2 pills',
          'times_per_day': 1,
          'dose_times': '08:00',
          'duration_type': 'dose_based',
          'duration_dose_count': 2,
        },
        {
          'dose_amount': '1 pill',
          'times_per_day': 1,
          'dose_times': '08:00',
          'duration_type': 'time_based',
          'duration_days': 5,
        },
      ],
    );

    var medication = (await medsRepo.get(medId))!;
    var phases = await medsRepo.phasesFor(medId);
    var doses = await medsRepo.dosesFor(medId);
    expect(computeSchedule(medication, phases, doses).activePhase!.phase.doseAmount, '2 pills');

    await actions.logDose(medId); // 1 of 2 in phase 1
    doses = await medsRepo.dosesFor(medId);
    expect(computeSchedule(medication, phases, doses).activePhase!.phase.doseAmount, '2 pills');

    await actions.logDose(medId); // 2 of 2 — phase 1 done, hands off to phase 2
    doses = await medsRepo.dosesFor(medId);
    final schedule = computeSchedule(medication, phases, doses);
    expect(schedule.isComplete, isFalse);
    expect(schedule.activePhase!.phase.doseAmount, '1 pill');
    expect(schedule.activePhase!.dosesLoggedInPhase, 0);
  });

  test('deleteMedication removes its linked reminder, not just the medication', () async {
    final petId = await insertPet('Fido');
    final (medId, _) = await actions.createMedication(
      {'pet_id': petId, 'name': 'Amoxicillin', 'medication_type': 'pill', 'start_date': isoDateToday()},
      [
        {'dose_amount': '1 tablet', 'times_per_day': 1, 'dose_times': '08:00', 'duration_type': 'time_based', 'duration_days': 5}
      ],
    );
    expect(await remindersRepo.findAllBySource('medication', medId), hasLength(1));

    await actions.deleteMedication(medId);

    expect(await medsRepo.get(medId), isNull);
    expect(await remindersRepo.findAllBySource('medication', medId), isEmpty);
  });

  test('stopMedication marks it stopped and removes the reminder', () async {
    final petId = await insertPet('Fido');
    final (medId, _) = await actions.createMedication(
      {'pet_id': petId, 'name': 'Amoxicillin', 'medication_type': 'pill', 'start_date': isoDateToday()},
      [
        {'dose_amount': '1 tablet', 'times_per_day': 1, 'dose_times': '08:00', 'duration_type': 'time_based', 'duration_days': 5}
      ],
    );

    await actions.stopMedication(medId);

    expect((await medsRepo.get(medId))!.status, 'stopped');
    expect(await remindersRepo.findAllBySource('medication', medId), isEmpty);
  });

  group('validation', () {
    test('creating a medication without a name throws', () async {
      final petId = await insertPet('Fido');
      expect(
        () => actions.createMedication(
          {'pet_id': petId, 'name': '', 'medication_type': 'pill', 'start_date': isoDateToday()},
          [
            {'dose_amount': '1 tablet', 'times_per_day': 1, 'dose_times': '08:00', 'duration_type': 'time_based', 'duration_days': 5}
          ],
        ),
        throwsA(isA<ValidationError>()),
      );
    });

    test('dose_times count must match times_per_day', () async {
      final petId = await insertPet('Fido');
      expect(
        () => actions.createMedication(
          {'pet_id': petId, 'name': 'Amoxicillin', 'medication_type': 'pill', 'start_date': isoDateToday()},
          [
            {'dose_amount': '1 tablet', 'times_per_day': 2, 'dose_times': '08:00', 'duration_type': 'time_based', 'duration_days': 5}
          ],
        ),
        throwsA(isA<ValidationError>()),
      );
    });

    test('time_based phase requires duration_days, not duration_dose_count', () async {
      final petId = await insertPet('Fido');
      expect(
        () => actions.createMedication(
          {'pet_id': petId, 'name': 'Amoxicillin', 'medication_type': 'pill', 'start_date': isoDateToday()},
          [
            {'dose_amount': '1 tablet', 'times_per_day': 1, 'dose_times': '08:00', 'duration_type': 'time_based'}
          ],
        ),
        throwsA(isA<ValidationError>()),
      );
    });
  });
}
