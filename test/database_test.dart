// Smoke test for the drift schema port (lib/data/tables.drift). Verifies the
// schema doesn't just generate cleanly but actually behaves like the
// pethealthapp desktop schema it's ported from: required columns, CHECK
// constraints, and — most importantly — the cross-pet-match triggers, since
// those are the one piece of this schema too easy to get subtly wrong in a
// hand port (six triggers, all near-identical, one typo away from silently
// not firing).

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:petsalud/data/database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

void main() {
  late AppDatabase db;
  const uuid = Uuid();

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

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

  test('inserts a pet and reads it back', () async {
    final id = await insertPet('Fido');
    final row = await (db.select(db.pets)..where((p) => p.id.equals(id))).getSingle();
    expect(row.name, 'Fido');
    expect(row.lifeStatus, 'active'); // schema default
  });

  test('rejects an invalid life_status via the CHECK constraint', () async {
    final id = uuid.v4();
    expect(
      () => db.into(db.pets).insert(PetsCompanion.insert(
            id: id,
            name: 'Bad Status',
            species: 'cat',
            lifeStatus: const Value('not_a_real_status'),
            createdAt: nowIso(),
            lastEditedAt: nowIso(),
          )),
      throwsA(isA<Exception>()),
    );
  });

  test('reminder linked to a source record on the SAME pet succeeds', () async {
    final petId = await insertPet('Rex');
    final vaccinationId = uuid.v4();
    await db.into(db.vaccinations).insert(VaccinationsCompanion.insert(
          id: vaccinationId,
          petId: petId,
          vaccineName: 'Rabies',
          dateAdministered: '2026-01-01',
          createdAt: nowIso(),
          lastEditedAt: nowIso(),
        ));

    await db.into(db.reminders).insert(RemindersCompanion.insert(
          id: uuid.v4(),
          petId: petId,
          title: 'Rabies booster',
          dueDate: '2027-01-01',
          sourceRecordType: const Value('vaccination'),
          sourceRecordId: Value(vaccinationId),
          createdAt: nowIso(),
          lastEditedAt: nowIso(),
        ));

    final reminders = await db.select(db.reminders).get();
    expect(reminders, hasLength(1));
  });

  test('reminder linked to a source record on a DIFFERENT pet is rejected by the trigger', () async {
    final petA = await insertPet('Pet A');
    final petB = await insertPet('Pet B');
    final vaccinationForA = uuid.v4();
    await db.into(db.vaccinations).insert(VaccinationsCompanion.insert(
          id: vaccinationForA,
          petId: petA,
          vaccineName: 'Rabies',
          dateAdministered: '2026-01-01',
          createdAt: nowIso(),
          lastEditedAt: nowIso(),
        ));

    // Reminder claims pet B, but points at a vaccination that belongs to pet A.
    expect(
      () => db.into(db.reminders).insert(RemindersCompanion.insert(
            id: uuid.v4(),
            petId: petB,
            title: 'Mismatched reminder',
            dueDate: '2027-01-01',
            sourceRecordType: const Value('vaccination'),
            sourceRecordId: Value(vaccinationForA),
            createdAt: nowIso(),
            lastEditedAt: nowIso(),
          )),
      throwsA(isA<Exception>()),
    );
  });
}
