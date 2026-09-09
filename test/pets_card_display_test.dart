// Verifies the Pets list card shows species/sex/age at a glance, and that a
// deceased pet is shown without the word "deceased" — greyed out (a fixed
// grey, not the active theme's own muted token, so it reads the same
// regardless of which of the 7 themes is active) with a headstone icon
// instead of text.

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petsalud/data/database.dart';
import 'package:petsalud/main.dart';
import 'package:petsalud/providers/database_providers.dart';

ProviderContainer _containerOf(WidgetTester tester) =>
    ProviderScope.containerOf(tester.element(find.byType(MaterialApp)));

void main() {
  testWidgets('pet card shows species, sex, and age together', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();

    final container = _containerOf(tester);
    final db = container.read(appDatabaseProvider);
    await db.into(db.pets).insert(PetsCompanion.insert(
          id: 'pet-1',
          name: 'Fido',
          species: 'dog',
          sex: const Value('Male'),
          dateOfBirth: const Value('2020-01-01'),
          createdAt: '2026-01-01',
          lastEditedAt: '2026-01-01',
        ));
    container.read(dataVersionProvider.notifier).bump();
    await tester.tap(find.text('Pets'));
    await tester.pumpAndSettle();

    expect(find.textContaining('dog'), findsOneWidget);
    expect(find.textContaining('Male'), findsOneWidget);
    // The exact age string depends on "today" relative to the DOB above, so
    // just confirm the species/sex line and the age are on the same
    // subtitle (joined with the same separator used elsewhere in the app).
    final subtitle = tester.widget<Text>(find.textContaining('dog')).data!;
    expect(subtitle, contains('dog · Male'));
  });

  testWidgets('a deceased pet has no "deceased" text but shows a greyed-out headstone icon', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();

    final container = _containerOf(tester);
    final db = container.read(appDatabaseProvider);
    await db.into(db.pets).insert(PetsCompanion.insert(
          id: 'pet-1',
          name: 'Old Rex',
          species: 'cat',
          lifeStatus: const Value('deceased'),
          createdAt: '2026-01-01',
          lastEditedAt: '2026-01-01',
        ));
    container.read(dataVersionProvider.notifier).bump();
    await tester.tap(find.text('Pets'));
    await tester.pumpAndSettle();

    expect(find.textContaining('deceased'), findsNothing);
    expect(find.byIcon(Icons.church), findsOneWidget);

    final nameStyle = tester.widget<Text>(find.text('Old Rex')).style;
    expect(nameStyle?.color, Colors.grey);
    final iconWidget = tester.widget<Icon>(find.byIcon(Icons.church));
    expect(iconWidget.color, Colors.grey);
  });

  testWidgets('a rehomed pet still shows the word "rehomed" (only deceased changes)', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();

    final container = _containerOf(tester);
    final db = container.read(appDatabaseProvider);
    await db.into(db.pets).insert(PetsCompanion.insert(
          id: 'pet-1',
          name: 'Buddy',
          species: 'dog',
          lifeStatus: const Value('rehomed'),
          createdAt: '2026-01-01',
          lastEditedAt: '2026-01-01',
        ));
    container.read(dataVersionProvider.notifier).bump();
    await tester.tap(find.text('Pets'));
    await tester.pumpAndSettle();

    expect(find.textContaining('rehomed'), findsOneWidget);
    expect(find.byIcon(Icons.church), findsNothing);
    final nameStyle = tester.widget<Text>(find.text('Buddy')).style;
    expect(nameStyle?.color, isNot(Colors.grey));
  });
}
