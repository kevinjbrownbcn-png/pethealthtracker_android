// Verifies the People archive button added to close desktop-parity gap #2
// (settings.py has an Archive button per person; Android previously only
// had add). Confirms archiving actually removes the person from the
// Settings list — the repository's own archive()/listActive() split is
// already covered in test/repositories_test.dart, so this only needs to
// prove the UI is wired to it correctly.

import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petsalud/data/database.dart';
import 'package:petsalud/main.dart';
import 'package:petsalud/providers/database_providers.dart';

void main() {
  testWidgets('archiving a person removes them from the Settings list', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('addPersonButton')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('personNameField')), 'Mom');
    await tester.tap(find.byKey(const Key('personSaveButton')));
    await tester.pumpAndSettle();

    expect(find.text('Mom'), findsOneWidget);

    await tester.tap(find.widgetWithText(OutlinedButton, 'Archive'));
    await tester.pumpAndSettle();

    expect(find.text('Mom'), findsNothing);
  });
}
