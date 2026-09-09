// Entry point. Opens the database, wires it into Riverpod, and renders the
// bottom-tab nav shell — the Android counterpart to pethealthapp/app.py.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/database.dart';
import 'providers/database_providers.dart';
import 'providers/theme_provider.dart';
import 'screens/nav_shell.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dataDir = await defaultDataDirectory();
  final db = AppDatabase.open(dataDir);

  runApp(
    ProviderScope(
      overrides: [appDatabaseProvider.overrideWithValue(db)],
      child: const PetHealthTrackerApp(),
    ),
  );
}

class PetHealthTrackerApp extends ConsumerWidget {
  const PetHealthTrackerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeAsync = ref.watch(themeProvider);
    final themeName = themeAsync.value ?? 'dark';
    final colors = AppColors.byKey[themeName] ?? AppColors.dark;
    final brightness = themeName == 'dark' ? Brightness.dark : Brightness.light;

    return MaterialApp(
      title: 'PetSalud',
      theme: buildAppTheme(colors, brightness),
      home: const NavShell(),
    );
  }
}
