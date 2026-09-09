// Reminders tab: due/overdue list with urgency badges and inline actions
// (mark done, snooze, dismiss), plus a quick-add standalone reminder via the
// FAB. Mirrors pethealthapp's reminder_row.py component, one action -> one
// repository call each, screen reruns naturally after (here: bump
// dataVersionProvider instead of Streamlit's automatic rerun-on-interaction).

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';
import '../data/repositories/reminders_repository.dart';
import '../domain/reminders.dart';
import '../domain/validation.dart';
import '../providers/database_providers.dart';
import '../theme/app_theme.dart';
import 'widgets/date_field.dart';

final dueOrOverdueRemindersProvider = FutureProvider<List<Reminder>>((ref) async {
  ref.watch(dataVersionProvider);
  return ref.read(remindersRepositoryProvider).listDueOrOverdue();
});

class RemindersScreen extends ConsumerWidget {
  const RemindersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remindersAsync = ref.watch(dueOrOverdueRemindersProvider);
    final colors = Theme.of(context).brightness == Brightness.light ? AppColors.light : AppColors.dark;

    return remindersAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Failed to load reminders: $err')),
      data: (reminders) {
        if (reminders.isEmpty) {
          return const Center(child: Text('Nothing due or overdue.'));
        }
        return ListView.builder(
          itemCount: reminders.length,
          itemBuilder: (context, i) {
            final reminder = reminders[i];
            final urgency = computeUrgency(reminder);
            return Card(
              key: Key('reminder_${reminder.id}'),
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: urgencyColor(colors, urgency.name),
                  radius: 6,
                ),
                title: Text(reminder.title),
                subtitle: Text('Due ${reminder.dueDate} · ${urgencyLabel(urgency.name)}'),
                trailing: PopupMenuButton<String>(
                  key: Key('reminderMenu_${reminder.id}'),
                  onSelected: (action) => _handleAction(context, ref, reminder, action),
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'reschedule', child: Text('Reschedule')),
                    const PopupMenuItem(value: 'snooze', child: Text('Snooze')),
                    const PopupMenuItem(value: 'done', child: Text('Mark done')),
                    const PopupMenuItem(value: 'dismiss', child: Text('Dismiss')),
                    // Matches desktop's reminder_row.py: detach only makes
                    // sense for a reminder that actually has a source link.
                    PopupMenuItem(
                      value: 'detach',
                      enabled: reminder.sourceRecordType != null,
                      child: const Text('Detach'),
                    ),
                    const PopupMenuItem(value: 'delete', child: Text('Delete')),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _handleAction(BuildContext context, WidgetRef ref, Reminder reminder, String action) async {
    final actions = ReminderActions(ref.read(remindersRepositoryProvider));
    switch (action) {
      case 'reschedule':
        final newDate = await _showDatePickerDialog(
          context,
          title: 'Reschedule reminder',
          confirmLabel: 'Confirm reschedule',
          initial: reminder.dueDate,
        );
        if (newDate != null) await actions.reschedule(reminder.id, newDate);
      case 'snooze':
        final defaultUntil = DateTime.now().add(const Duration(days: 7)).toIso8601String().substring(0, 10);
        final until = await _showDatePickerDialog(
          context,
          title: 'Snooze reminder',
          confirmLabel: 'Confirm snooze',
          initial: defaultUntil,
        );
        if (until != null) await actions.snooze(reminder.id, until);
      case 'done':
        await actions.markDone(reminder.id);
      case 'dismiss':
        await actions.dismiss(reminder.id);
      case 'detach':
        await actions.detach(reminder.id);
      case 'delete':
        // Matches desktop's reminder_row.py: no confirmation dialog — a
        // single tap deletes, same as every other action here.
        await actions.delete(reminder.id);
    }
    ref.read(dataVersionProvider.notifier).bump();
  }

  /// Shared dialog for reschedule/snooze — both are just "pick a date,
  /// confirm," mirroring desktop's two near-identical @st.dialog functions
  /// in reminder_row.py. Returns the picked ISO date, or null if cancelled.
  Future<String?> _showDatePickerDialog(
    BuildContext context, {
    required String title,
    required String confirmLabel,
    required String initial,
  }) {
    final controller = TextEditingController(text: initial);
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: DateField(
          key: const Key('reminderDateDialogField'),
          controller: controller,
          label: 'Date',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
          FilledButton(
            key: const Key('reminderDateDialogConfirm'),
            onPressed: () => Navigator.of(context).pop(controller.text),
            child: Text(confirmLabel),
          ),
        ],
      ),
    );
  }
}

Future<void> showAddReminderSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => const _AddReminderSheet(),
  );
}

class _AddReminderSheet extends ConsumerStatefulWidget {
  const _AddReminderSheet();

  @override
  ConsumerState<_AddReminderSheet> createState() => _AddReminderSheetState();
}

class _AddReminderSheetState extends ConsumerState<_AddReminderSheet> {
  final _titleController = TextEditingController();
  final _dueDateController = TextEditingController();
  String? _petId;
  String? _error;
  bool _saving = false;

  Future<void> _save() async {
    setState(() {
      _error = null;
      _saving = true;
    });
    try {
      await ref.read(remindersRepositoryProvider).create({
        'pet_id': _petId,
        'title': _titleController.text.trim(),
        'due_date': _dueDateController.text.trim(),
      });
      if (!mounted) return;
      ref.read(dataVersionProvider.notifier).bump();
      Navigator.of(context).pop();
    } on ValidationError catch (e) {
      setState(() {
        _error = e.message;
        _saving = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final petsAsync = ref.watch(_petOptionsProvider);
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Add a reminder', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          petsAsync.when(
            loading: () => const LinearProgressIndicator(),
            error: (e, _) => Text('Could not load pets: $e'),
            data: (pets) => DropdownButtonFormField<String>(
              key: const Key('reminderPetDropdown'),
              initialValue: _petId,
              decoration: const InputDecoration(labelText: 'Pet *'),
              items: pets.map((p) => DropdownMenuItem(value: p.id, child: Text(p.name))).toList(),
              onChanged: (value) => setState(() => _petId = value),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            key: const Key('reminderTitleField'),
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title *'),
          ),
          const SizedBox(height: 8),
          TextField(
            key: const Key('reminderDueDateField'),
            controller: _dueDateController,
            decoration: const InputDecoration(labelText: 'Due date (YYYY-MM-DD) *'),
          ),
          if (_error != null) ...[
            const SizedBox(height: 8),
            Text(_error!, style: const TextStyle(color: Colors.red)),
          ],
          const SizedBox(height: 12),
          FilledButton(
            key: const Key('reminderSaveButton'),
            onPressed: _saving || _petId == null ? null : _save,
            child: _saving ? const CircularProgressIndicator() : const Text('Save'),
          ),
        ],
      ),
    );
  }
}

final _petOptionsProvider = FutureProvider((ref) => ref.read(petsRepositoryProvider).listAll());
