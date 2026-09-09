// Dashboard tab: at-a-glance overview — pet count and the due/overdue
// reminders that need attention, reusing the same providers as the
// Reminders/Pets tabs so there's exactly one source of truth per query.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'nav_shell.dart';
import 'pets_screen.dart';
import 'reminders_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final petsAsync = ref.watch(petsListProvider);
    final remindersAsync = ref.watch(dueOrOverdueRemindersProvider);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: ListTile(
            key: const Key('dashboardPetsSummary'),
            leading: const Icon(Icons.pets),
            title: petsAsync.when(
              data: (pets) => Text('${pets.length} pet${pets.length == 1 ? '' : 's'}'),
              loading: () => const Text('Loading pets…'),
              error: (e, _) => const Text('Could not load pets'),
            ),
            subtitle: petsAsync.maybeWhen(
              data: (pets) => pets.isEmpty ? const Text('Add your first pet from the Pets tab.') : null,
              orElse: () => null,
            ),
            onTap: () => ref.read(selectedTabProvider.notifier).select(1),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: ListTile(
            key: const Key('dashboardRemindersSummary'),
            leading: const Icon(Icons.notifications_active),
            title: remindersAsync.when(
              data: (reminders) =>
                  Text('${reminders.length} reminder${reminders.length == 1 ? '' : 's'} due or overdue'),
              loading: () => const Text('Loading reminders…'),
              error: (e, _) => const Text('Could not load reminders'),
            ),
            onTap: () => ref.read(selectedTabProvider.notifier).select(3),
          ),
        ),
      ],
    );
  }
}
