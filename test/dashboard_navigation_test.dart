// Verifies the Dashboard summary cards actually navigate to their
// corresponding tab when tapped, rather than being purely informational —
// tapping "N pets" jumps to Pets, tapping "N reminders due or overdue"
// jumps to Reminders, both through the real bottom-tab selection state
// (nav_shell.dart's selectedTabProvider), not a fake route push.

import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petsalud/data/database.dart';
import 'package:petsalud/main.dart';
import 'package:petsalud/providers/database_providers.dart';

void main() {
  testWidgets('tapping the pets summary card opens the Pets tab', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();

    // Dashboard is the default tab — confirm we start there, not already on Pets.
    expect(find.text('No pets yet. Tap + to add one.'), findsNothing);

    await tester.tap(find.byKey(const Key('dashboardPetsSummary')));
    await tester.pumpAndSettle();

    expect(find.text('No pets yet. Tap + to add one.'), findsOneWidget);
  });

  testWidgets('tapping the reminders summary card opens the Reminders tab', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Nothing due or overdue.'), findsNothing);

    await tester.tap(find.byKey(const Key('dashboardRemindersSummary')));
    await tester.pumpAndSettle();

    expect(find.text('Nothing due or overdue.'), findsOneWidget);
  });
}
