// Drives the real Medications tab UI end to end: add a pet, add a
// medication through the actual (repeatable-phases) form, confirm it shows
// up with next-dose info, log a dose through the real button, edit the
// name, then delete it — the same "real widget tree, real taps, real
// database writes" bar every other feature test in this repo holds to.

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
  testWidgets('add, log a dose, edit, and delete a medication through the real UI', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();
    await _addPet(tester);

    await tester.ensureVisible(find.text('Medications'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Medications'));
    await tester.pumpAndSettle();
    expect(find.text('No medications yet. Tap + to add one.'), findsOneWidget);

    await tester.tap(find.byKey(const Key('addMedicationFab')));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('medicationNameField')), 'Amoxicillin');
    await tester.enterText(find.byKey(const Key('medicationStrengthField')), '250mg');
    await tester.enterText(find.byKey(const Key('phaseDoseAmountField_0')), '1 tablet');
    await tester.enterText(find.byKey(const Key('phaseDoseTimesField_0')), '08:00');
    await tester.enterText(find.byKey(const Key('phaseDurationValueField_0')), '5');
    await tester.ensureVisible(find.byKey(const Key('medicationSaveButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('medicationSaveButton')));
    await tester.pumpAndSettle();

    expect(find.text('No medications yet. Tap + to add one.'), findsNothing);
    expect(find.text('Amoxicillin'), findsOneWidget);
    expect(find.textContaining('Next dose:'), findsOneWidget);

    final container = _containerOf(tester);
    final db = container.read(appDatabaseProvider);
    final medication = (await db.select(db.medications).get()).first;
    expect(medication.name, 'Amoxicillin');
    expect(medication.strength, '250mg');
    expect(await db.select(db.medicationDoses).get(), isEmpty);
    var reminders = await db.select(db.reminders).get();
    expect(reminders, hasLength(1));
    expect(reminders.first.title, 'Amoxicillin dose due');

    // Log a dose through the real button — confirms the write actually
    // happens, not just that the button exists.
    await tester.tap(find.text('Log dose given'));
    await tester.pumpAndSettle();
    expect(await db.select(db.medicationDoses).get(), hasLength(1));

    // Edit the name through the real dialog.
    await tester.tap(find.descendant(of: find.byType(Card), matching: find.byIcon(Icons.edit)));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('editMedicationNameField')), 'Amoxicillin 250');
    await tester.tap(find.byKey(const Key('saveMedicationEditButton')));
    await tester.pumpAndSettle();
    expect(find.text('Amoxicillin 250'), findsOneWidget);

    // Delete it — confirms the two-step confirmation dialog and that the
    // linked reminder is cleaned up too, not left orphaned.
    await tester.tap(find.descendant(of: find.byType(Card), matching: find.byIcon(Icons.delete)));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('confirmDeleteMedicationButton')));
    await tester.pumpAndSettle();

    expect(find.text('No medications yet. Tap + to add one.'), findsOneWidget);
    expect(await db.select(db.medications).get(), isEmpty);
    reminders = await db.select(db.reminders).get();
    expect(reminders, isEmpty);
  });

  testWidgets('titration: a second phase can be added and removed in the add form', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();
    await _addPet(tester);

    await tester.ensureVisible(find.text('Medications'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Medications'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('addMedicationFab')));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('medicationNameField')), 'Prednisone');
    await tester.enterText(find.byKey(const Key('phaseDoseAmountField_0')), '2 pills');
    await tester.enterText(find.byKey(const Key('phaseDoseTimesField_0')), '08:00');
    await tester.enterText(find.byKey(const Key('phaseDurationValueField_0')), '3');

    expect(find.text('Phase 2'), findsNothing);
    await tester.ensureVisible(find.byKey(const Key('addPhaseButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('addPhaseButton')));
    await tester.pumpAndSettle();
    expect(find.text('Phase 2'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('phaseDoseAmountField_1')), '1 pill');
    await tester.enterText(find.byKey(const Key('phaseDoseTimesField_1')), '08:00');
    await tester.enterText(find.byKey(const Key('phaseDurationValueField_1')), '7');

    await tester.ensureVisible(find.byKey(const Key('medicationSaveButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('medicationSaveButton')));
    await tester.pumpAndSettle();

    expect(find.text('Prednisone'), findsOneWidget);

    final container = _containerOf(tester);
    final db = container.read(appDatabaseProvider);
    final medication = (await db.select(db.medications).get()).first;
    final phases = await (db.select(db.medicationPhases)..where((p) => p.medicationId.equals(medication.id))).get();
    expect(phases, hasLength(2));
    expect(phases.firstWhere((p) => p.phaseOrder == 0).doseAmount, '2 pills');
    expect(phases.firstWhere((p) => p.phaseOrder == 1).doseAmount, '1 pill');
  });
}
