// Bottom-tab + FAB nav shell — the Android-specific chrome the desktop app's
// planning docs called for (MODULE_PROGRESS.md row 7 in pethealthapp:
// "Android: bottom tabs + FAB, single-column touch forms"), same 5 items as
// the desktop sidebar: Dashboard, Pets, Timeline, Reminders, Settings.
//
// The FAB is context-sensitive per tab (quick-add pet on Pets, quick-add
// reminder on Reminders) rather than one global action, matching "Android
// for quick-glance and quick-add" from the platform-split decision.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dashboard_screen.dart';
import 'pets_screen.dart';
import 'reminders_screen.dart';
import 'settings_screen.dart';
import 'timeline_screen.dart';

// See database_providers.dart's DataVersionNotifier comment for why this is
// a plain Notifier rather than the now-legacy StateProvider.
class SelectedTabNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void select(int index) => state = index;
}

final selectedTabProvider = NotifierProvider<SelectedTabNotifier, int>(SelectedTabNotifier.new);

class NavShell extends ConsumerWidget {
  const NavShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(selectedTabProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('PetSalud')),
      body: IndexedStack(
        index: index,
        children: const [
          DashboardScreen(),
          PetsScreen(),
          TimelineScreen(),
          RemindersScreen(),
          SettingsScreen(),
        ],
      ),
      floatingActionButton: _fabForTab(index),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (i) => ref.read(selectedTabProvider.notifier).select(i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Pets'),
          BottomNavigationBarItem(icon: Icon(Icons.timeline), label: 'Timeline'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Reminders'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  Widget? _fabForTab(int index) {
    switch (index) {
      case 1: // Pets
        return Builder(
          builder: (context) => FloatingActionButton(
            key: const Key('addPetFab'),
            onPressed: () => showAddPetSheet(context),
            child: const Icon(Icons.add),
          ),
        );
      case 3: // Reminders
        return Builder(
          builder: (context) => FloatingActionButton(
            key: const Key('addReminderFab'),
            onPressed: () => showAddReminderSheet(context),
            child: const Icon(Icons.add),
          ),
        );
      default:
        return null;
    }
  }
}
