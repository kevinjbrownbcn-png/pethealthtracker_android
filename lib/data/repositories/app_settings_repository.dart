// App settings repository — a single-row table for UI preferences (theme).
// Per-device, not a stable-UUID synced entity like the other 11. Direct port
// of core/repositories/app_settings.py.

import 'package:drift/drift.dart';

import '../database.dart';
import 'repository_utils.dart';

const defaultTheme = 'dark';

class AppSettingsRepository {
  final AppDatabase db;
  AppSettingsRepository(this.db);

  Future<String> getTheme() async {
    final row = await (db.select(db.appSettings)..where((s) => s.id.equals(1))).getSingleOrNull();
    return row?.theme ?? defaultTheme;
  }

  Future<void> setTheme(String theme) async {
    await db.into(db.appSettings).insertOnConflictUpdate(
          AppSettingsCompanion.insert(
            id: const Value(1),
            theme: Value(theme),
            lastEditedAt: nowIso(),
          ),
        );
  }
}
