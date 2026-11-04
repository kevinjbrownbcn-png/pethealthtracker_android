// Verifies Settings has a Privacy Policy entry that opens the in-app policy.

import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petsalud/data/database.dart';
import 'package:petsalud/main.dart';
import 'package:petsalud/providers/database_providers.dart';

void main() {
  testWidgets('Settings > Privacy Policy opens the in-app policy', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))],
        child: const PetHealthTrackerApp(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('privacyPolicyTile')));
    await tester.tap(find.byKey(const Key('privacyPolicyTile')));
    await tester.pumpAndSettle();

    expect(find.text('Privacy Policy'), findsOneWidget); // app bar title
    expect(find.text('The short version'), findsOneWidget);
    await tester.scrollUntilVisible(find.textContaining('kjbrown.dev@gmail.com'), 300);
    expect(find.textContaining('kjbrown.dev@gmail.com'), findsOneWidget);
  });
}
