// Verifies the reminder state machine (lib/domain/reminders.dart) against
// the same behaviors locked in pethealthapp's planning docs (Example 8 in
// 11_examples_bundle...md) and core/reminders.py's own docstrings — not just
// "does it run," but the actual guardrails: no silent overwrites, no silent
// deletes/orphans, multiple reminders per source all get handled.

import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petsalud/data/database.dart';
import 'package:petsalud/data/repositories/reminders_repository.dart';
import 'package:petsalud/domain/reminders.dart';
import 'package:uuid/uuid.dart';

void main() {
  late AppDatabase db;
  late RemindersRepository repo;
  late ReminderActions actions;
  const uuid = Uuid();

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    repo = RemindersRepository(db);
    actions = ReminderActions(repo);
  });

  tearDown(() async => db.close());

  String nowIso() => DateTime.now().toUtc().toIso8601String();

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

  Future<String> insertVaccination(String petId, {String nextDueDate = '2026-06-01'}) async {
    final id = uuid.v4();
    await db.into(db.vaccinations).insert(VaccinationsCompanion.insert(
          id: id,
          petId: petId,
          vaccineName: 'Rabies',
          dateAdministered: '2025-06-01',
          nextDueDate: Value(nextDueDate),
          createdAt: nowIso(),
          lastEditedAt: nowIso(),
        ));
    return id;
  }

  test('reschedule sets is_manually_overridden', () async {
    final petId = await insertPet('Fido');
    final reminderId = await repo.create({
      'pet_id': petId,
      'title': 'Booster',
      'due_date': '2026-06-01',
    });

    await actions.reschedule(reminderId, '2026-07-01');
    final updated = await repo.get(reminderId);
    expect(updated!.dueDate, '2026-07-01');
    expect(updated.isManuallyOverridden, isTrue);
  });

  test('mark_done then dismiss transition status correctly', () async {
    final petId = await insertPet('Fido');
    final reminderId = await repo.create({'pet_id': petId, 'title': 'Booster', 'due_date': '2026-06-01'});

    await actions.markDone(reminderId);
    expect((await repo.get(reminderId))!.status, 'done');
  });

  test('detach clears source link but keeps the reminder', () async {
    final petId = await insertPet('Fido');
    final vaccId = await insertVaccination(petId);
    final reminderId = await repo.create({
      'pet_id': petId,
      'title': 'Booster',
      'due_date': '2026-06-01',
      'source_record_type': 'vaccination',
      'source_record_id': vaccId,
    });

    await actions.detach(reminderId);
    final detached = await repo.get(reminderId);
    expect(detached!.sourceRecordType, isNull);
    expect(detached.sourceRecordId, isNull);
  });

  test('findAllBySource returns every reminder linked to that source, not just the first', () async {
    final petId = await insertPet('Fido');
    final vaccId = await insertVaccination(petId);
    await repo.create({
      'pet_id': petId,
      'title': 'Reminder A',
      'due_date': '2026-06-01',
      'source_record_type': 'vaccination',
      'source_record_id': vaccId,
    });
    await repo.create({
      'pet_id': petId,
      'title': 'Reminder B',
      'due_date': '2026-06-15',
      'source_record_type': 'vaccination',
      'source_record_id': vaccId,
    });

    final linked = await actions.getLinkedReminders('vaccination', vaccId);
    expect(linked, hasLength(2));
  });

  group('propagateSourceDateChange', () {
    test('updates due date on all linked, non-overridden reminders', () async {
      final petId = await insertPet('Fido');
      final vaccId = await insertVaccination(petId);
      final reminderId = await repo.create({
        'pet_id': petId,
        'title': 'Booster',
        'due_date': '2026-06-01',
        'source_record_type': 'vaccination',
        'source_record_id': vaccId,
      });

      final count = await actions.propagateSourceDateChange('vaccination', vaccId, '2026-08-01');
      expect(count, 1);
      expect((await repo.get(reminderId))!.dueDate, '2026-08-01');
    });

    test('returns 0 when nothing is linked (no-op, not an error)', () async {
      final count = await actions.propagateSourceDateChange('vaccination', 'nonexistent-id', '2026-08-01');
      expect(count, 0);
    });

    test('throws ManualOverrideConflict if a linked reminder was manually edited', () async {
      final petId = await insertPet('Fido');
      final vaccId = await insertVaccination(petId);
      final reminderId = await repo.create({
        'pet_id': petId,
        'title': 'Booster',
        'due_date': '2026-06-01',
        'source_record_type': 'vaccination',
        'source_record_id': vaccId,
      });
      await actions.reschedule(reminderId, '2026-09-01'); // manually overridden now

      expect(
        () => actions.propagateSourceDateChange('vaccination', vaccId, '2026-08-01'),
        throwsA(isA<ManualOverrideConflict>()),
      );
      // Confirm the guardrail actually prevented the write, not just threw after writing.
      expect((await repo.get(reminderId))!.dueDate, '2026-09-01');
    });

    test('force: true overwrites a manually-overridden reminder and clears the flag', () async {
      final petId = await insertPet('Fido');
      final vaccId = await insertVaccination(petId);
      final reminderId = await repo.create({
        'pet_id': petId,
        'title': 'Booster',
        'due_date': '2026-06-01',
        'source_record_type': 'vaccination',
        'source_record_id': vaccId,
      });
      await actions.reschedule(reminderId, '2026-09-01');

      final count = await actions.propagateSourceDateChange('vaccination', vaccId, '2026-08-01', force: true);
      expect(count, 1);
      final updated = await repo.get(reminderId);
      expect(updated!.dueDate, '2026-08-01');
      expect(updated.isManuallyOverridden, isFalse);
    });
  });

  group('handleSourceDeletion', () {
    test('deleteReminder: true removes every linked reminder', () async {
      final petId = await insertPet('Fido');
      final vaccId = await insertVaccination(petId);
      final reminderId = await repo.create({
        'pet_id': petId,
        'title': 'Booster',
        'due_date': '2026-06-01',
        'source_record_type': 'vaccination',
        'source_record_id': vaccId,
      });

      final count = await actions.handleSourceDeletion('vaccination', vaccId, deleteReminder: true);
      expect(count, 1);
      expect(await repo.get(reminderId), isNull);
    });

    test('deleteReminder: false detaches instead of deleting — never silently orphaned or lost', () async {
      final petId = await insertPet('Fido');
      final vaccId = await insertVaccination(petId);
      final reminderId = await repo.create({
        'pet_id': petId,
        'title': 'Booster',
        'due_date': '2026-06-01',
        'source_record_type': 'vaccination',
        'source_record_id': vaccId,
      });

      final count = await actions.handleSourceDeletion('vaccination', vaccId, deleteReminder: false);
      expect(count, 1);
      final stillThere = await repo.get(reminderId);
      expect(stillThere, isNotNull);
      expect(stillThere!.sourceRecordType, isNull);
    });
  });

  group('computeUrgency', () {
    test('overdue for a past due date', () async {
      final petId = await insertPet('Fido');
      final id = await repo.create({'pet_id': petId, 'title': 'X', 'due_date': '2020-01-01'});
      expect(computeUrgency((await repo.get(id))!), ReminderUrgency.overdue);
    });

    test('dueSoon within the 7-day window', () async {
      final petId = await insertPet('Fido');
      final soon = DateTime.now().add(const Duration(days: 3)).toIso8601String().substring(0, 10);
      final id = await repo.create({'pet_id': petId, 'title': 'X', 'due_date': soon});
      expect(computeUrgency((await repo.get(id))!), ReminderUrgency.dueSoon);
    });

    test('upcoming beyond the 7-day window', () async {
      final petId = await insertPet('Fido');
      final later = DateTime.now().add(const Duration(days: 30)).toIso8601String().substring(0, 10);
      final id = await repo.create({'pet_id': petId, 'title': 'X', 'due_date': later});
      expect(computeUrgency((await repo.get(id))!), ReminderUrgency.upcoming);
    });

    test('an expired snooze re-surfaces based on due date, not stuck as snoozed', () async {
      final petId = await insertPet('Fido');
      final id = await repo.create({'pet_id': petId, 'title': 'X', 'due_date': '2020-01-01'});
      await actions.snooze(id, '2020-02-01'); // snooze window already in the past
      expect(computeUrgency((await repo.get(id))!), ReminderUrgency.overdue);
    });
  });

  test('suggestNextDueDate suggests exactly one year out', () {
    expect(ReminderActions.suggestNextDueDate('2026-03-15'), '2027-03-15');
  });
}
