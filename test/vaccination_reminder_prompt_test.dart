// Verifies the reminder auto-linking prompt added for parity gap #7 (mirrors
// pethealthapp/web/pages/pets.py's "record a vaccine, remind me when it's
// due again" workflow): saving a vaccination with a next_due_date offers to
// create a source-linked reminder for it; declining or saving one without a
// next_due_date must not prompt at all.

import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petsalud/data/database.dart';
import 'package:petsalud/main.dart';
import 'package:petsalud/providers/database_providers.dart';

Future<void> _addPet(WidgetTester tester, {String name = 'Fido'}) async {
  await tester.tap(find.text('Pets'));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(const Key('addPetFab')));
  await tester.pumpAndSettle();
  await tester.enterText(find.byKey(const Key('petNameField')), name);
  await tester.enterText(find.byKey(const Key('petSpeciesField')), 'dog');
  await tester.tap(find.byKey(const Key('petSaveButton')));
  await tester.pumpAndSettle();
  await tester.tap(find.text(name));
  await tester.pumpAndSettle();
}

ProviderContainer _containerOf(WidgetTester tester) =>
    ProviderScope.containerOf(tester.element(find.byType(MaterialApp)));

void main() {
  testWidgets('saving a vaccination with a next due date offers a source-linked reminder', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();
    await _addPet(tester);

    await tester.tap(find.text('Vaccinations'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('addRecordFab_Vaccinations')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('field_vaccine_name')), 'Rabies');
    await tester.tap(find.byKey(const Key('field_date_administered')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('field_next_due_date')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('field_next_due_date')));
    await tester.pumpAndSettle();
    // Navigate forward a month before picking a day — leaving next_due_date
    // on today's date (same as date_administered) triggers the "due date
    // too soon" soft warning, which keeps the sheet open pending an
    // "OK (already saved)" tap instead of auto-closing. Same gotcha as
    // record_edit_delete_test.dart: tapping "Next month" alone only scrolls
    // the calendar view, a specific day must also be tapped.
    await tester.tap(find.byTooltip('Next month'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('15'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Save'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.text('Next due date recorded'), findsOneWidget);
    await tester.tap(find.byKey(const Key('confirmVaccinationReminderButton')));
    await tester.pumpAndSettle();

    final container = _containerOf(tester);
    final db = container.read(appDatabaseProvider);
    final vaccination = (await db.select(db.vaccinations).get()).first;
    final reminders = await db.select(db.reminders).get();
    expect(reminders, hasLength(1));
    expect(reminders.first.title, 'Rabies booster due');
    expect(reminders.first.sourceRecordType, 'vaccination');
    expect(reminders.first.sourceRecordId, vaccination.id);
    expect(reminders.first.dueDate, vaccination.nextDueDate);
  });

  testWidgets('declining the prompt creates no reminder', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();
    await _addPet(tester);

    await tester.tap(find.text('Vaccinations'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('addRecordFab_Vaccinations')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('field_vaccine_name')), 'Rabies');
    await tester.tap(find.byKey(const Key('field_date_administered')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('field_next_due_date')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('field_next_due_date')));
    await tester.pumpAndSettle();
    // Navigate forward a month before picking a day — leaving next_due_date
    // on today's date (same as date_administered) triggers the "due date
    // too soon" soft warning, which keeps the sheet open pending an
    // "OK (already saved)" tap instead of auto-closing. Same gotcha as
    // record_edit_delete_test.dart: tapping "Next month" alone only scrolls
    // the calendar view, a specific day must also be tapped.
    await tester.tap(find.byTooltip('Next month'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('15'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Save'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.text('Next due date recorded'), findsOneWidget);
    await tester.tap(find.byKey(const Key('dismissVaccinationReminderButton')));
    await tester.pumpAndSettle();

    final container = _containerOf(tester);
    final db = container.read(appDatabaseProvider);
    expect(await db.select(db.reminders).get(), isEmpty);
  });

  testWidgets('saving a vaccination without a next due date never prompts', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();
    await _addPet(tester);

    await tester.tap(find.text('Vaccinations'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('addRecordFab_Vaccinations')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('field_vaccine_name')), 'Rabies');
    await tester.tap(find.byKey(const Key('field_date_administered')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Save'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.text('Next due date recorded'), findsNothing);

    final container = _containerOf(tester);
    final db = container.read(appDatabaseProvider);
    expect(await db.select(db.reminders).get(), isEmpty);
  });
}
