// Verifies edit/delete for records and pets — the parity-gap #4 work.
// Weighted toward the two riskiest paths, both mirrored from desktop's
// record_list.py: editing a record's tracked date auto-propagates to a
// linked, non-overridden reminder, but a manually-overridden linked
// reminder triggers the same confirmation dialog desktop shows; deleting a
// record with a linked reminder always asks what to do with it, never
// silently either deletes or orphans it.

import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petsalud/data/database.dart';
import 'package:petsalud/data/repositories/reminders_repository.dart';
import 'package:petsalud/data/repositories/vaccinations_repository.dart';
import 'package:petsalud/domain/reminders.dart';
import 'package:petsalud/main.dart';
import 'package:petsalud/providers/database_providers.dart';

Future<String> _addPet(WidgetTester tester, {String name = 'Fido'}) async {
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
  return name;
}

ProviderContainer _containerOf(WidgetTester tester) =>
    ProviderScope.containerOf(tester.element(find.byType(MaterialApp)));

void main() {
  testWidgets('editing a note updates it in the list', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();
    await _addPet(tester);

    await tester.ensureVisible(find.text('Notes'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Notes'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('addRecordFab_Notes')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('field_text')), 'Original note text.');
    await tester.ensureVisible(find.text('Save'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Original note text.'), findsOneWidget);

    await tester.tap(find.descendant(of: find.byType(Card), matching: find.byIcon(Icons.edit)));
    await tester.pumpAndSettle();
    // The field is pre-filled with the existing text — confirmed via the
    // controller directly rather than find.text, since the list item behind
    // the now-open sheet still renders the same text too (two legitimate
    // matches, not a bug).
    final fieldWidget = tester.widget<TextField>(find.byKey(const Key('field_text')));
    expect(fieldWidget.controller!.text, 'Original note text.');
    await tester.enterText(find.byKey(const Key('field_text')), 'Edited note text.');
    await tester.ensureVisible(find.text('Save'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.text('Edited note text.'), findsOneWidget);
    expect(find.text('Original note text.'), findsNothing);
  });

  testWidgets('deleting a microchip record with no linked reminder removes it directly', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();
    await _addPet(tester);

    await tester.ensureVisible(find.text('Microchip'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Microchip'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('addRecordFab_Microchip')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('field_chip_number')), '123456789');
    await tester.ensureVisible(find.text('Save'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('123456789'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();
    expect(find.text('Delete this record?'), findsOneWidget);
    await tester.tap(find.byKey(const Key('confirmDeleteRecordButton')));
    await tester.pumpAndSettle();

    expect(find.text('123456789'), findsNothing);
  });

  testWidgets('editing pet profile updates species shown on the Pets list', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();
    await _addPet(tester);

    await tester.tap(find.byKey(const Key('editPetButton')));
    await tester.pumpAndSettle();
    expect(find.text('Edit pet profile'), findsOneWidget);
    // Pre-filled with the existing species.
    expect(find.text('dog'), findsWidgets);

    await tester.enterText(find.byKey(const Key('petSpeciesField')), 'cat');
    await tester.tap(find.byKey(const Key('petSaveButton')));
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    expect(find.textContaining('cat'), findsOneWidget);
  });

  testWidgets(
    'editing a vaccination\'s next due date auto-propagates to a non-overridden linked reminder',
    (tester) async {
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

      // Arrange the vaccination and its source-linked reminder directly via
      // the repositories — the CREATE form's own UI path is already covered
      // by pet_detail_test.dart; what this test actually verifies is the
      // EDIT flow's propagation logic, so only that step needs to go
      // through real widget interaction. No UI creates a reminder link yet
      // either (that's item 7 on the parity list).
      final container = _containerOf(tester);
      final db = container.read(appDatabaseProvider);
      final petsList = await db.select(db.pets).get();
      final vaccinationsRepo = VaccinationsRepository(db);
      final (vaccinationId, _) = await vaccinationsRepo.create({
        'pet_id': petsList.first.id,
        'vaccine_name': 'Rabies',
        'date_administered': '2025-01-01',
        'next_due_date': '2026-01-01',
      });
      final vaccination = (await vaccinationsRepo.get(vaccinationId))!;
      final remindersRepo = RemindersRepository(db);
      final reminderId = await remindersRepo.create({
        'pet_id': vaccination.petId,
        'title': 'Rabies booster',
        'due_date': vaccination.nextDueDate,
        'source_record_type': 'vaccination',
        'source_record_id': vaccination.id,
      });
      container.read(dataVersionProvider.notifier).bump();
      await tester.pumpAndSettle();

      await tester.tap(find.descendant(of: find.byType(Card), matching: find.byIcon(Icons.edit)));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byKey(const Key('field_next_due_date')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('field_next_due_date')));
      await tester.pumpAndSettle();
      // Move to next month, then actually tap a day — tapping "Next month"
      // alone only scrolls the calendar view, it doesn't select a date;
      // without picking a specific day, "OK" just confirms the original
      // pre-filled date unchanged (caught live: that was this test's first
      // failure — the date came back identical to what it started as).
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

      // No conflict dialog for a non-overridden reminder — propagation
      // should have happened silently, same as desktop.
      expect(find.text('Reminder was manually set'), findsNothing);
      final updatedReminder = await remindersRepo.get(reminderId);
      final updatedVaccination =
          (await db.select(db.vaccinations).get()).firstWhere((v) => v.id == vaccination.id);
      expect(updatedReminder!.dueDate, updatedVaccination.nextDueDate);
      expect(updatedReminder.dueDate, isNot(vaccination.nextDueDate));
    },
  );

  testWidgets(
    'editing a vaccination whose linked reminder was manually rescheduled shows the override-conflict dialog',
    (tester) async {
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

      // Same rationale as the previous test: arrange the vaccination and
      // its manually-rescheduled linked reminder directly via the
      // repositories, and only drive the actual EDIT flow under test
      // through real widget interaction.
      final container = _containerOf(tester);
      final db = container.read(appDatabaseProvider);
      final petsList = await db.select(db.pets).get();
      final vaccinationsRepo = VaccinationsRepository(db);
      final (vaccinationId, _) = await vaccinationsRepo.create({
        'pet_id': petsList.first.id,
        'vaccine_name': 'Rabies',
        'date_administered': '2025-01-01',
        'next_due_date': '2026-01-01',
      });
      final vaccination = (await vaccinationsRepo.get(vaccinationId))!;
      final remindersRepo = RemindersRepository(db);
      final reminderId = await remindersRepo.create({
        'pet_id': vaccination.petId,
        'title': 'Rabies booster',
        'due_date': vaccination.nextDueDate,
        'source_record_type': 'vaccination',
        'source_record_id': vaccination.id,
      });
      // Manually reschedule — this is what should trigger the conflict.
      await ReminderActions(remindersRepo).reschedule(reminderId, '2099-01-01');
      container.read(dataVersionProvider.notifier).bump();
      await tester.pumpAndSettle();

      await tester.tap(find.descendant(of: find.byType(Card), matching: find.byIcon(Icons.edit)));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byKey(const Key('field_next_due_date')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('field_next_due_date')));
      await tester.pumpAndSettle();
      // Tap a different day (the vaccination's next_due_date is 2026-01-01,
      // so day 20 is a genuine change) — tapping OK without selecting a day
      // just confirms the pre-filled date unchanged, same lesson as the
      // previous test.
      await tester.tap(find.text('20'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Save'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      expect(find.text('Reminder was manually set'), findsOneWidget);
      await tester.tap(find.byKey(const Key('leaveRemindersButton')));
      await tester.pumpAndSettle();

      // "Leave as is" must actually leave it — the manual date survives.
      final reminderAfter = await remindersRepo.get(reminderId);
      expect(reminderAfter!.dueDate, '2099-01-01');
    },
  );

  testWidgets('deleting a record with a linked reminder offers delete-too or detach, never silently either', (tester) async {
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

    final container = _containerOf(tester);
    final db = container.read(appDatabaseProvider);
    final vaccination = (await db.select(db.vaccinations).get()).first;
    final remindersRepo = RemindersRepository(db);
    final reminderId = await remindersRepo.create({
      'pet_id': vaccination.petId,
      'title': 'Rabies booster',
      'due_date': '2027-01-01',
      'source_record_type': 'vaccination',
      'source_record_id': vaccination.id,
    });

    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('confirmDeleteRecordButton')));
    await tester.pumpAndSettle();

    expect(find.text('Delete linked reminder?'), findsOneWidget);
    await tester.tap(find.byKey(const Key('keepReminderDetachButton')));
    await tester.pumpAndSettle();

    // Vaccination is gone, but the reminder survives, detached — never
    // silently deleted alongside it, never silently left dangling either.
    expect(await db.select(db.vaccinations).get(), isEmpty);
    final survivingReminder = await remindersRepo.get(reminderId);
    expect(survivingReminder, isNotNull);
    expect(survivingReminder!.sourceRecordType, isNull);
  });
}
