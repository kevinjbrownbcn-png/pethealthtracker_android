// Regression test for a real bug caught live (2026-09-08): the Medications
// tab hung forever on the Windows dev build's actual database file, which
// had been created before the medications/medication_phases/medication_doses
// tables existed. schemaVersion had been bumped in source but the persisted
// file's PRAGMA user_version still matched the OLD hardcoded value, so drift
// saw "nothing changed" and never ran a migration — the new tables simply
// didn't exist on disk, and querying them hung rather than cleanly erroring.
//
// This builds a minimal hand-made "v1" database file (not the full v1
// schema, just enough to prove the point) and opens it with the real
// AppDatabase class, the same way a previously-installed app would on its
// next launch after an update — proving the upgrade path actually creates
// the new tables AND replaces the reminders cross-pet-match triggers
// (SQLite triggers keep their original body forever once created, so
// editing tables.drift alone doesn't touch what's already on disk).

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:petsalud/data/database.dart';
import 'package:sqlite3/sqlite3.dart' as sqlite3;

void main() {
  test('opening a pre-medications database upgrades cleanly and preserves existing data', () async {
    final tempDir = await Directory.systemTemp.createTemp('petsalud_migration_test');
    final dbFile = File(p.join(tempDir.path, 'test.db'));
    addTearDown(() => tempDir.delete(recursive: true));

    final raw = sqlite3.sqlite3.open(dbFile.path);
    raw.execute('''
      CREATE TABLE pets (
        id TEXT NOT NULL PRIMARY KEY,
        name TEXT NOT NULL,
        species TEXT NOT NULL,
        life_status TEXT NOT NULL DEFAULT 'active',
        created_at TEXT NOT NULL,
        last_edited_at TEXT NOT NULL
      );
    ''');
    raw.execute('''
      CREATE TABLE reminders (
        id TEXT NOT NULL PRIMARY KEY,
        pet_id TEXT NOT NULL REFERENCES pets(id),
        title TEXT NOT NULL,
        due_date TEXT NOT NULL,
        status TEXT NOT NULL DEFAULT 'active',
        snoozed_until TEXT NULL,
        source_record_type TEXT NULL,
        source_record_id TEXT NULL,
        is_manually_overridden INTEGER NOT NULL DEFAULT 0,
        created_at TEXT NOT NULL,
        last_edited_at TEXT NOT NULL
      );
    ''');
    // The pre-v2 trigger, deliberately with no idea 'medication' exists —
    // proves the upgrade actually replaces it, not just assumes drift will.
    raw.execute('''
      CREATE TRIGGER reminders_pet_match_insert BEFORE INSERT ON reminders
      WHEN NEW.source_record_type IS NOT NULL
      BEGIN
        SELECT CASE
          WHEN NEW.source_record_type = 'vaccination' AND NOT EXISTS (
            SELECT 1 FROM pets WHERE id = NEW.pet_id
          ) THEN RAISE(ABORT, 'placeholder, never matched in this test')
        END;
      END;
    ''');
    raw.execute(
      "INSERT INTO pets (id, name, species, created_at, last_edited_at) VALUES ('pet-a', 'Fido', 'dog', '2026-01-01', '2026-01-01');",
    );
    raw.execute('PRAGMA user_version = 1;');
    raw.close();

    // Open it with the real app database class — exactly what a
    // previously-installed app does on its next launch after an update.
    final db = AppDatabase(NativeDatabase(dbFile));

    // The bug: this used to hang instead of returning, because the new
    // tables never got created.
    final pets = await db.select(db.pets).get();
    expect(pets, hasLength(1));
    expect(pets.first.name, 'Fido'); // pre-existing data survived the upgrade

    expect(await db.select(db.medications).get(), isEmpty);
    expect(await db.select(db.medicationPhases).get(), isEmpty);
    expect(await db.select(db.medicationDoses).get(), isEmpty);

    // Prove the trigger was actually replaced, not just that the tables
    // exist: a medication-linked reminder claiming the wrong pet must be
    // rejected post-migration, which the hand-written old trigger above
    // could never have done (it doesn't know 'medication' exists at all).
    await db.into(db.pets).insert(
          PetsCompanion.insert(
            id: 'pet-b',
            name: 'Rex',
            species: 'cat',
            createdAt: '2026-01-01',
            lastEditedAt: '2026-01-01',
          ),
        );
    final medId = 'med-a';
    await db.into(db.medications).insert(
          MedicationsCompanion.insert(
            id: medId,
            petId: 'pet-a',
            name: 'Amoxicillin',
            medicationType: 'pill',
            startDate: '2026-01-01',
            createdAt: '2026-01-01',
            lastEditedAt: '2026-01-01',
          ),
        );

    expect(
      () => db.into(db.reminders).insert(
            RemindersCompanion.insert(
              id: 'reminder-mismatched',
              petId: 'pet-b', // wrong pet — the medication belongs to pet-a
              title: 'Mismatched',
              dueDate: '2026-02-01',
              sourceRecordType: const Value('medication'),
              sourceRecordId: Value(medId),
              createdAt: '2026-01-01',
              lastEditedAt: '2026-01-01',
            ),
          ),
      throwsA(isA<Exception>()),
    );

    await db.close();
  });
}
