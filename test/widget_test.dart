// Golden-path widget test: launch the real app (in-memory database standing
// in for the real file, same substitution pattern as every other test in
// this repo), navigate the bottom tabs, add a pet through the actual FAB
// sheet, and confirm it shows up on both the Pets tab and the Dashboard
// summary — real widget tree, real taps, real database writes, not mocks.

import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petsalud/data/database.dart';
import 'package:petsalud/main.dart';
import 'package:petsalud/providers/database_providers.dart';
import 'package:petsalud/theme/app_theme.dart';

void main() {
  testWidgets('nav shell renders all 5 tabs', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Dashboard'), findsWidgets);
    expect(find.text('Pets'), findsWidgets);
    expect(find.text('Timeline'), findsWidgets);
    expect(find.text('Reminders'), findsWidgets);
    expect(find.text('Settings'), findsWidgets);
  });

  testWidgets('adding a pet via the FAB shows it on Pets and Dashboard', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();

    // Switch to the Pets tab.
    await tester.tap(find.text('Pets'));
    await tester.pumpAndSettle();
    expect(find.text('No pets yet. Tap + to add one.'), findsOneWidget);

    // Open the add-pet sheet via the FAB.
    await tester.tap(find.byKey(const Key('addPetFab')));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('petNameField')), 'Fido');
    await tester.enterText(find.byKey(const Key('petSpeciesField')), 'dog');
    await tester.tap(find.byKey(const Key('petSaveButton')));
    await tester.pumpAndSettle();

    // The sheet closed and the new pet is in the list.
    expect(find.text('No pets yet. Tap + to add one.'), findsNothing);
    expect(find.text('Fido'), findsOneWidget);

    // Dashboard reflects it too — same repository, different screen.
    await tester.tap(find.text('Dashboard'));
    await tester.pumpAndSettle();
    expect(find.text('1 pet'), findsOneWidget);
  });

  testWidgets('adding a reminder via the FAB shows it on the Reminders tab', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();

    // Need a pet to exist first — reminders require one.
    await tester.tap(find.text('Pets'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('addPetFab')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('petNameField')), 'Fido');
    await tester.enterText(find.byKey(const Key('petSpeciesField')), 'dog');
    await tester.tap(find.byKey(const Key('petSaveButton')));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Reminders'));
    await tester.pumpAndSettle();
    expect(find.text('Nothing due or overdue.'), findsOneWidget);

    await tester.tap(find.byKey(const Key('addReminderFab')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('reminderPetDropdown')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Fido').last);
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('reminderTitleField')), 'Booster shot');
    await tester.enterText(find.byKey(const Key('reminderDueDateField')), '2020-01-01'); // overdue on purpose
    await tester.tap(find.byKey(const Key('reminderSaveButton')));
    await tester.pumpAndSettle();

    expect(find.text('Nothing due or overdue.'), findsNothing);
    expect(find.text('Booster shot'), findsOneWidget);
  });

  testWidgets('theme selector switches brightness live', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();

    final materialAppBefore = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(materialAppBefore.theme!.brightness, Brightness.dark);

    await tester.tap(find.byKey(const Key('themeDropdown')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Light').last);
    await tester.pumpAndSettle();

    final materialAppAfter = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(materialAppAfter.theme!.brightness, Brightness.light);
  });

  testWidgets('a pastel theme applies its own accent color and stays light-mode', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('themeDropdown')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Pastel Purple').last);
    await tester.pumpAndSettle();

    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(materialApp.theme!.brightness, Brightness.light);
    expect(materialApp.theme!.colorScheme.primary, AppColors.pastelPurple.accent);
    expect(materialApp.theme!.scaffoldBackgroundColor, AppColors.pastelPurple.bg);
  });
}
