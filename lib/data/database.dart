// Drift database wiring: opens the SQLite file, applies the schema in
// tables.drift, and turns on the same PRAGMAs the desktop app uses
// (foreign_keys, WAL) — see pethealthapp/core/db.py for the source of truth
// this mirrors.

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DriftDatabase(include: {'tables.drift'})
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  /// Opens (creating if needed) the database file in the app's own data
  /// directory. Where that directory lives on Android — plain app-private
  /// storage vs. a Storage-Access-Framework-granted synced folder — is the
  /// sync design decided separately; this just takes whatever directory
  /// it's given.
  factory AppDatabase.open(Directory dataDir) {
    final dbFile = File(p.join(dataDir.path, 'pethealth.db'));
    return AppDatabase(
      NativeDatabase.createInBackground(
        dbFile,
        setup: (rawDb) {
          rawDb.execute('PRAGMA foreign_keys = ON;');
          rawDb.execute('PRAGMA journal_mode = WAL;');
        },
      ),
    );
  }

  @override
  int get schemaVersion => 2;

  // v2 added the medications/medication_phases/medication_doses tables and
  // extended the reminders cross-pet-match triggers to cover
  // source_record_type = 'medication'. Existing installs (this dev machine's
  // Windows db included — caught live when the Medications tab hung forever
  // on an old, un-migrated database file instead of showing "no medications
  // yet") need the new tables created and those two triggers dropped and
  // recreated, since SQLite triggers keep their original body forever once
  // created — editing tables.drift alone doesn't touch what's already on disk.
  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(medications);
            await m.createTable(medicationPhases);
            await m.createTable(medicationDoses);
            await m.createIndex(idxMedicationsPet);
            await m.createIndex(idxMedicationPhasesMedication);
            await m.createIndex(idxMedicationDosesMedication);
            await m.drop(remindersPetMatchInsert);
            await m.createTrigger(remindersPetMatchInsert);
            await m.drop(remindersPetMatchUpdate);
            await m.createTrigger(remindersPetMatchUpdate);
          }
        },
      );
}

/// Default data directory for now: the app's own private documents folder.
/// Fine for local-only use; the SAF-backed synced-folder picker (mirroring
/// the desktop app's configurable data dir) replaces this call site once
/// that's built, without needing to touch AppDatabase itself.
Future<Directory> defaultDataDirectory() async {
  return getApplicationDocumentsDirectory();
}
