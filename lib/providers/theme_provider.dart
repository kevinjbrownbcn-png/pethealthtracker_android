// Persisted theme selection — mirrors web/theme.py's get_current_theme/
// set_theme, backed by AppSettingsRepository instead of session state.

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'database_providers.dart';

class ThemeNotifier extends AsyncNotifier<String> {
  @override
  Future<String> build() async {
    return ref.read(appSettingsRepositoryProvider).getTheme();
  }

  Future<void> setTheme(String theme) async {
    await ref.read(appSettingsRepositoryProvider).setTheme(theme);
    state = AsyncData(theme);
  }
}

final themeProvider = AsyncNotifierProvider<ThemeNotifier, String>(ThemeNotifier.new);
