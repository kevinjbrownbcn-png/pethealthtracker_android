// Verifies the Pet Detail screen and the shared record_form_sheet against
// real taps and real database writes: navigate to a pet, add a vaccination
// through its tab's form via the actual date picker, and confirm it shows
// in that tab's list.
//
// Hard-block validation (e.g. hospitalization discharge-before-admission)
// is already covered end to end at the repository layer in
// test/repositories_test.dart — not re-driven here through a real
// DatePicker's month-navigation UI, which is fiddly to automate generically
// and wouldn't be testing anything the repository test doesn't already
// prove.

import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petsalud/data/database.dart';
import 'package:petsalud/main.dart';
import 'package:petsalud/providers/database_providers.dart';

Future<void> _addPet(WidgetTester tester, String name) async {
  await tester.tap(find.text('Pets'));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(const Key('addPetFab')));
  await tester.pumpAndSettle();
  await tester.enterText(find.byKey(const Key('petNameField')), name);
  await tester.enterText(find.byKey(const Key('petSpeciesField')), 'dog');
  await tester.tap(find.byKey(const Key('petSaveButton')));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('adding a vaccination via the pet detail form shows it in that tab\'s list', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();

    await _addPet(tester, 'Fido');
    await tester.tap(find.text('Fido'));
    await tester.pumpAndSettle();

    // Lands on the first tab (Vet visits) by default; switch to Vaccinations.
    await tester.tap(find.text('Vaccinations'));
    await tester.pumpAndSettle();
    expect(find.textContaining('No vaccinations yet'), findsOneWidget);

    await tester.tap(find.byKey(const Key('addRecordFab_Vaccinations')));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('field_vaccine_name')), 'Rabies');

    // Date fields are read-only and driven by the real DatePicker dialog.
    await tester.tap(find.byKey(const Key('field_date_administered')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.textContaining('No vaccinations yet'), findsNothing);
    expect(find.text('Rabies'), findsOneWidget);
  });

  testWidgets('multiple record types on the same pet stay in their own tabs', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();

    await _addPet(tester, 'Rex');
    await tester.tap(find.text('Rex'));
    await tester.pumpAndSettle();

    // Add a note (no required date field, simplest form to drive fully).
    // "Notes" is the 7th of 7 tabs in the scrollable TabBar — off-screen at
    // the default test viewport until scrolled into view, same as it would
    // be on a narrow phone screen.
    await tester.ensureVisible(find.text('Notes'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Notes'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('addRecordFab_Notes')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('field_text')), 'Seemed tired today.');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Seemed tired today.'), findsOneWidget);

    // Switching to a different tab shows that tab's own (still empty) list,
    // not the note that was just added — confirms each tab is scoped to its
    // own record type, not sharing state across tabs.
    await tester.tap(find.text('Microchip'));
    await tester.pumpAndSettle();
    expect(find.textContaining('No microchip yet'), findsOneWidget);
    expect(find.text('Seemed tired today.'), findsNothing);
  });
}
