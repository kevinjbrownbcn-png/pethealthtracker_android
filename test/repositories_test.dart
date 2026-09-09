// Verifies the remaining 11 repositories (pets, people, and the 8 record
// types + app_settings) against actual database round-trips, not just that
// they compile. Weighted toward the riskiest pieces: the microchip
// duplicate-check join query, and the app_settings upsert actually updating
// on a second call rather than only working once.

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petsalud/data/database.dart';
import 'package:petsalud/data/repositories/app_settings_repository.dart';
import 'package:petsalud/data/repositories/attachments_repository.dart';
import 'package:petsalud/data/repositories/hospitalizations_repository.dart';
import 'package:petsalud/data/repositories/illness_custom_events_repository.dart';
import 'package:petsalud/data/repositories/microchip_records_repository.dart';
import 'package:petsalud/data/repositories/notes_repository.dart';
import 'package:petsalud/data/repositories/people_repository.dart';
import 'package:petsalud/data/repositories/pets_repository.dart';
import 'package:petsalud/data/repositories/procedures_surgeries_repository.dart';
import 'package:petsalud/data/repositories/vaccinations_repository.dart';
import 'package:petsalud/data/repositories/vet_appointments_repository.dart';
import 'package:petsalud/domain/validation.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async => db.close());

  group('PetsRepository', () {
    test('create + computeAge from date_of_birth', () async {
      final repo = PetsRepository(db);
      final tenYearsAgo = DateTime.now().subtract(const Duration(days: 365 * 10)).toIso8601String().substring(0, 10);
      final (id, warnings) = await repo.create({'name': 'Fido', 'species': 'dog', 'date_of_birth': tenYearsAgo});
      expect(warnings, isEmpty);
      final pet = await repo.get(id);
      expect(computeAge(pet!), '10 yr');
    });

    test('create + computeAge from approximate age anchor', () async {
      final repo = PetsRepository(db);
      final (id, _) = await repo.create({'name': 'Whiskers', 'species': 'cat', 'approximate_age_value': 3});
      final pet = await repo.get(id);
      expect(computeAge(pet!), '~3 yr'); // anchor is today, so no elapsed years yet
    });

    test('duplicate name produces a warning, not a block', () async {
      final repo = PetsRepository(db);
      await repo.create({'name': 'Fido', 'species': 'dog'});
      final (_, warnings) = await repo.create({'name': 'Fido', 'species': 'dog'});
      expect(warnings, isNotEmpty);
      expect(warnings.first.field, 'name');
    });
  });

  group('PeopleRepository', () {
    test('create, listActive, then archive excludes it from listActive', () async {
      final repo = PeopleRepository(db);
      final id = await repo.create({'name': 'Mom'});
      expect((await repo.listActive()).map((p) => p.id), contains(id));

      await repo.archive(id);
      expect((await repo.listActive()).map((p) => p.id), isNot(contains(id)));
      // Still readable directly — archiving isn't deletion.
      expect((await repo.get(id))!.name, 'Mom');
    });
  });

  group('VetAppointmentsRepository', () {
    test('create then cancel sets status without deleting the row', () async {
      final petRepo = PetsRepository(db);
      final (petId, _) = await petRepo.create({'name': 'Fido', 'species': 'dog'});
      final repo = VetAppointmentsRepository(db);
      final id = await repo.create({'pet_id': petId, 'date': '2026-06-01', 'reason': 'Checkup'});

      await repo.cancel(id);
      final appt = await repo.get(id);
      expect(appt!.status, 'cancelled');
    });
  });

  group('HospitalizationsRepository', () {
    test('hard block surfaces via check() before any write happens', () async {
      final petRepo = PetsRepository(db);
      final (petId, _) = await petRepo.create({'name': 'Fido', 'species': 'dog'});
      final repo = HospitalizationsRepository(db);

      expect(
        () => repo.create({
          'pet_id': petId,
          'admission_date': '2026-06-10',
          'reason': 'Surgery',
          'discharge_date': '2026-06-01', // before admission
        }),
        throwsA(isA<ValidationError>()),
      );
    });
  });

  group('ProceduresSurgeriesRepository', () {
    test('create + listForPet', () async {
      final petRepo = PetsRepository(db);
      final (petId, _) = await petRepo.create({'name': 'Fido', 'species': 'dog'});
      final repo = ProceduresSurgeriesRepository(db);
      await repo.create({'pet_id': petId, 'procedure_name': 'Neuter', 'date': '2026-01-01'});

      expect(await repo.listForPet(petId), hasLength(1));
    });
  });

  group('IllnessCustomEventsRepository', () {
    test('future date produces a warning, not a block', () async {
      final petRepo = PetsRepository(db);
      final (petId, _) = await petRepo.create({'name': 'Fido', 'species': 'dog'});
      final repo = IllnessCustomEventsRepository(db);
      final (_, warnings) = await repo.create({'pet_id': petId, 'title': 'Limping', 'date': '2099-01-01'});
      expect(warnings, isNotEmpty);
    });
  });

  group('VaccinationsRepository', () {
    test('duplicate name+date for the same pet produces a warning', () async {
      final petRepo = PetsRepository(db);
      final (petId, _) = await petRepo.create({'name': 'Fido', 'species': 'dog'});
      final repo = VaccinationsRepository(db);
      await repo.create({'pet_id': petId, 'vaccine_name': 'Rabies', 'date_administered': '2026-01-01'});
      final (_, warnings) =
          await repo.create({'pet_id': petId, 'vaccine_name': 'Rabies', 'date_administered': '2026-01-01'});
      expect(warnings, isNotEmpty);
    });
  });

  group('MicrochipRecordsRepository', () {
    test('duplicate chip number across pets names the OTHER pet in the warning', () async {
      final petRepo = PetsRepository(db);
      final (petAId, _) = await petRepo.create({'name': 'Fido', 'species': 'dog'});
      final (petBId, _) = await petRepo.create({'name': 'Rex', 'species': 'dog'});
      final repo = MicrochipRecordsRepository(db);
      await repo.create({'pet_id': petAId, 'chip_number': '123456789'});

      final (_, warnings) = await repo.create({'pet_id': petBId, 'chip_number': '123456789'});
      expect(warnings, isNotEmpty);
      expect(warnings.first.message, contains('Fido')); // names the pet that already has it
    });

    test('no warning for a genuinely unique chip number', () async {
      final petRepo = PetsRepository(db);
      final (petId, _) = await petRepo.create({'name': 'Fido', 'species': 'dog'});
      final repo = MicrochipRecordsRepository(db);
      final (_, warnings) = await repo.create({'pet_id': petId, 'chip_number': 'unique-001'});
      expect(warnings, isEmpty);
    });
  });

  group('AttachmentsRepository', () {
    test('create + listForRecord finds it by linked record', () async {
      final petRepo = PetsRepository(db);
      final (petId, _) = await petRepo.create({'name': 'Fido', 'species': 'dog'});
      final vaccRepo = VaccinationsRepository(db);
      final (vaccId, _) = await vaccRepo.create({'pet_id': petId, 'vaccine_name': 'Rabies', 'date_administered': '2026-01-01'});

      final repo = AttachmentsRepository(db);
      await repo.create({
        'pet_id': petId,
        'file_name': 'cert.pdf',
        'file_path': '/tmp/cert.pdf',
        'file_type': 'application/pdf',
        'linked_record_type': 'vaccination',
        'linked_record_id': vaccId,
      }, 1024);

      expect(await repo.listForRecord('vaccination', vaccId), hasLength(1));
    });
  });

  group('NotesRepository', () {
    test('create round-trips the "text" field through noteText', () async {
      final petRepo = PetsRepository(db);
      final (petId, _) = await petRepo.create({'name': 'Fido', 'species': 'dog'});
      final repo = NotesRepository(db);
      final id = await repo.create({'pet_id': petId, 'text': 'Seemed tired today.'});

      final note = await repo.get(id);
      expect(note!.noteText, 'Seemed tired today.');
    });
  });

  group('AppSettingsRepository', () {
    test('defaults to dark, then set/get round-trips, then a SECOND set actually updates', () async {
      final repo = AppSettingsRepository(db);
      expect(await repo.getTheme(), 'dark');

      await repo.setTheme('light');
      expect(await repo.getTheme(), 'light');

      // The riskiest part: insertOnConflictUpdate must actually update on a
      // second call, not silently no-op or throw a primary-key conflict.
      await repo.setTheme('pastel-blue');
      expect(await repo.getTheme(), 'pastel-blue');
    });
  });
}
