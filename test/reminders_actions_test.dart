// Verifies the reminder action menu added to close the desktop-parity gap:
// reschedule and snooze now use a real date-picker dialog (not hardcoded),
// and detach/delete are now reachable from the UI, with detach correctly
// disabled for a standalone reminder — mirroring desktop's reminder_row.py
// exactly (six actions, detach disabled when there's no source link).

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petsalud/data/database.dart';
import 'package:petsalud/main.dart';
import 'package:petsalud/providers/database_providers.dart';
import 'package:petsalud/screens/widgets/date_field.dart';

Future<void> _addPetAndOverdueReminder(WidgetTester tester, {String pet = 'Fido', String title = 'Booster'}) async {
  await tester.tap(find.text('Pets'));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(const Key('addPetFab')));
  await tester.pumpAndSettle();
  await tester.enterText(find.byKey(const Key('petNameField')), pet);
  await tester.enterText(find.byKey(const Key('petSpeciesField')), 'dog');
  await tester.tap(find.byKey(const Key('petSaveButton')));
  await tester.pumpAndSettle();

  await tester.tap(find.text('Reminders'));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(const Key('addReminderFab')));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(const Key('reminderPetDropdown')));
  await tester.pumpAndSettle();
  await tester.tap(find.text(pet).last);
  await tester.pumpAndSettle();
  await tester.enterText(find.byKey(const Key('reminderTitleField')), title);
  await tester.enterText(find.byKey(const Key('reminderDueDateField')), '2020-01-01'); // overdue on purpose
  await tester.tap(find.byKey(const Key('reminderSaveButton')));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('reschedule dialog moves the reminder to a new due date', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();
    await _addPetAndOverdueReminder(tester);

    expect(find.textContaining('Due 2020-01-01'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.more_vert));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Reschedule'));
    await tester.pumpAndSettle();

    final field = tester.widget<DateField>(find.byKey(const Key('reminderDateDialogField')));
    expect(field.controller.text, '2020-01-01'); // dialog pre-filled with the current due date

    // Reschedule to a different but still-overdue date, so the reminder
    // stays on this due/overdue-filtered screen and the new date is
    // actually visible to assert on (unlike the snooze test, which
    // deliberately picks a far-future date specifically to prove the
    // reminder drops off this list).
    field.controller.text = '2021-03-10';
    await tester.tap(find.byKey(const Key('reminderDateDialogConfirm')));
    await tester.pumpAndSettle();

    expect(find.textContaining('Due 2021-03-10'), findsOneWidget);
    expect(find.textContaining('Due 2020-01-01'), findsNothing);
  });

  testWidgets('snooze dialog defaults to 7 days out but is editable, not hardcoded', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();
    await _addPetAndOverdueReminder(tester);

    await tester.tap(find.byIcon(Icons.more_vert));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Snooze'));
    await tester.pumpAndSettle();

    final field = tester.widget<DateField>(find.byKey(const Key('reminderDateDialogField')));
    final expectedDefault = DateTime.now().add(const Duration(days: 7)).toIso8601String().substring(0, 10);
    expect(field.controller.text, expectedDefault);

    // Override the default — proves this isn't hardcoded like the old
    // "Snooze 1 week" button was.
    field.controller.text = '2099-12-25';
    await tester.tap(find.byKey(const Key('reminderDateDialogConfirm')));
    await tester.pumpAndSettle();

    // Snoozed until a far-future date means it's no longer due/overdue —
    // reminder should disappear from this list (it only shows due/overdue).
    expect(find.textContaining('Booster'), findsNothing);
    expect(find.text('Nothing due or overdue.'), findsOneWidget);
  });

  testWidgets('delete removes the reminder from the list', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();
    await _addPetAndOverdueReminder(tester);

    await tester.tap(find.byIcon(Icons.more_vert));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();

    expect(find.text('Nothing due or overdue.'), findsOneWidget);
  });

  testWidgets('detach is disabled for a standalone reminder, enabled for a source-linked one', (tester) async {
    late AppDatabase db;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(db = AppDatabase(NativeDatabase.memory())),
        ],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();
    await _addPetAndOverdueReminder(tester, title: 'Standalone reminder');

    await tester.tap(find.byIcon(Icons.more_vert));
    await tester.pumpAndSettle();
    final standaloneDetach = tester.widget<PopupMenuItem<String>>(find.widgetWithText(PopupMenuItem<String>, 'Detach'));
    expect(standaloneDetach.enabled, isFalse);
    // Dismiss the open menu without selecting anything — tap the modal
    // barrier well away from any menu item.
    await tester.tapAt(const Offset(10, 10));
    await tester.pumpAndSettle();

    // Now create a genuinely source-linked reminder directly via the
    // repository (no UI creates linked reminders yet — that's a separate,
    // not-yet-built workflow), to prove detach's enabled state is actually
    // driven by sourceRecordType, not just always-false. The cross-pet-match
    // trigger requires the referenced vaccination to actually exist and
    // belong to this pet, so a real row has to be inserted first — a
    // made-up id correctly gets rejected (confirmed live: that was the
    // first version of this test, before adding the vaccination insert).
    final pets = await db.select(db.pets).get();
    final now = DateTime.now().toUtc().toIso8601String();
    await db.into(db.vaccinations).insert(VaccinationsCompanion.insert(
          id: 'vaccination-1',
          petId: pets.first.id,
          vaccineName: 'Rabies',
          dateAdministered: '2025-01-01',
          createdAt: now,
          lastEditedAt: now,
        ));
    await db.into(db.reminders).insertOnConflictUpdate(RemindersCompanion.insert(
          id: 'linked-reminder-1',
          petId: pets.first.id,
          title: 'Linked reminder',
          dueDate: '2020-01-01',
          sourceRecordType: const Value('vaccination'),
          sourceRecordId: const Value('vaccination-1'),
          createdAt: now,
          lastEditedAt: now,
        ));
    // The reminders list only refetches when dataVersionProvider changes
    // (see reminders_screen.dart's dueOrOverdueRemindersProvider) — writing
    // straight to the database bypasses that, so it has to be bumped
    // explicitly here, the same signal every real write path in the app
    // sends via ref.read(dataVersionProvider.notifier).bump(). Switching
    // tabs alone doesn't help either, since IndexedStack keeps every tab's
    // widget subtree mounted rather than rebuilding it.
    final container = ProviderScope.containerOf(tester.element(find.byType(MaterialApp)));
    container.read(dataVersionProvider.notifier).bump();
    await tester.pumpAndSettle();

    // Each PopupMenuButton carries a reminder-specific key
    // (reminderMenu_${reminder.id} in reminders_screen.dart) — using it
    // directly is more robust than locating the icon via ancestor/descendant
    // finders now that two reminders are on screen.
    await tester.tap(find.byKey(const Key('reminderMenu_linked-reminder-1')));
    await tester.pumpAndSettle();
    final linkedDetach = tester.widget<PopupMenuItem<String>>(find.widgetWithText(PopupMenuItem<String>, 'Detach'));
    expect(linkedDetach.enabled, isTrue);
  });
}
