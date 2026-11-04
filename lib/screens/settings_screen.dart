// Settings tab: theme selector (persisted) and People management. Sync
// (Storage Access Framework) and notification settings are separate,
// not-yet-built pieces — see PENDING_ITEMS.md.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';
import '../providers/database_providers.dart';
import '../providers/theme_provider.dart';
import '../theme/app_theme.dart';
import 'privacy_policy_screen.dart';

final _peopleListProvider = FutureProvider<List<PeopleData>>((ref) async {
  ref.watch(dataVersionProvider);
  return ref.read(peopleRepositoryProvider).listActive();
});

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeAsync = ref.watch(themeProvider);
    final peopleAsync = ref.watch(_peopleListProvider);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Appearance', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        themeAsync.when(
          loading: () => const LinearProgressIndicator(),
          error: (e, _) => Text('Could not load theme: $e'),
          data: (currentTheme) => DropdownButtonFormField<String>(
            key: const Key('themeDropdown'),
            initialValue: AppColors.labels.containsKey(currentTheme) ? currentTheme : 'dark',
            decoration: const InputDecoration(labelText: 'Theme'),
            items: AppColors.labels.entries
                .map((e) => DropdownMenuItem(value: e.key, child: Text(e.value)))
                .toList(),
            onChanged: (value) {
              if (value != null) ref.read(themeProvider.notifier).setTheme(value);
            },
          ),
        ),
        const Divider(height: 32),
        Text('People', style: Theme.of(context).textTheme.titleMedium),
        const Text(
          'Household contacts you can tag records as "handled by" — no login or edit access, just a label.',
        ),
        const SizedBox(height: 8),
        peopleAsync.when(
          loading: () => const LinearProgressIndicator(),
          error: (e, _) => Text('Could not load people: $e'),
          data: (people) => Column(
            children: [
              for (final person in people)
                ListTile(
                  key: Key('person_${person.id}'),
                  title: Text(person.name),
                  subtitle: person.relationshipLabel != null ? Text(person.relationshipLabel!) : null,
                  // Soft-delete only, matching desktop's settings.py archive
                  // button: historical records must keep saying "handled by
                  // [name]" even after the person is archived, so this never
                  // deletes the row — just excludes it from future picks
                  // (PeopleRepository.listActive() already filters it out).
                  trailing: OutlinedButton(
                    key: Key('archivePersonButton_${person.id}'),
                    onPressed: () async {
                      await ref.read(peopleRepositoryProvider).archive(person.id);
                      ref.read(dataVersionProvider.notifier).bump();
                    },
                    child: const Text('Archive'),
                  ),
                ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                key: const Key('addPersonButton'),
                onPressed: () => _showAddPersonDialog(context, ref),
                icon: const Icon(Icons.add),
                label: const Text('Add a person'),
              ),
            ],
          ),
        ),
        const Divider(height: 32),
        Text('About', style: Theme.of(context).textTheme.titleMedium),
        ListTile(
          key: const Key('privacyPolicyTile'),
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.privacy_tip_outlined),
          title: const Text('Privacy Policy'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const PrivacyPolicyScreen()),
          ),
        ),
      ],
    );
  }

  Future<void> _showAddPersonDialog(BuildContext context, WidgetRef ref) async {
    final controller = TextEditingController();
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add a person'),
        content: TextField(
          key: const Key('personNameField'),
          controller: controller,
          decoration: const InputDecoration(labelText: 'Name *'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
          FilledButton(
            key: const Key('personSaveButton'),
            onPressed: () async {
              if (controller.text.trim().isEmpty) return;
              await ref.read(peopleRepositoryProvider).create({'name': controller.text.trim()});
              ref.read(dataVersionProvider.notifier).bump();
              if (context.mounted) Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
