// Medications tab content for Pet Detail — self-contained rather than
// wired through pet_detail_screen.dart's generic _RecordTypeConfig list,
// since medications don't fit that shape: creation takes a nested list of
// phases, not a flat field map, and the list view needs a "Log dose"
// action and computed schedule info no other record type has.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database.dart';
import '../../domain/medications.dart';
import '../../domain/validation.dart';
import '../../providers/database_providers.dart';
import 'date_field.dart';

const _medicationTypeLabels = {
  'pill': 'Pill',
  'syrup': 'Syrup',
  'injection': 'Injection',
  'cream_lotion': 'Cream / lotion',
};

class _MedicationView {
  final Medication medication;
  final MedicationSchedule schedule;
  const _MedicationView(this.medication, this.schedule);
}

final _medicationsForPetProvider = FutureProvider.family<List<_MedicationView>, String>((ref, petId) async {
  ref.watch(dataVersionProvider);
  final repo = ref.read(medicationsRepositoryProvider);
  final medications = await repo.listForPet(petId);
  final views = <_MedicationView>[];
  for (final medication in medications) {
    final phases = await repo.phasesFor(medication.id);
    final doses = await repo.dosesFor(medication.id);
    views.add(_MedicationView(medication, computeSchedule(medication, phases, doses)));
  }
  return views;
});

final _activePeopleProvider = FutureProvider((ref) => ref.read(peopleRepositoryProvider).listActive());

String _formatDoseTime(DateTime dt) {
  final hour12 = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
  final minute = dt.minute.toString().padLeft(2, '0');
  final period = dt.hour < 12 ? 'AM' : 'PM';
  final today = DateTime.now();
  final isToday = dt.year == today.year && dt.month == today.month && dt.day == today.day;
  final datePart = isToday ? 'today' : '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
  return '$datePart at $hour12:$minute $period';
}

class MedicationsTab extends ConsumerWidget {
  final String petId;
  const MedicationsTab({super.key, required this.petId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicationsAsync = ref.watch(_medicationsForPetProvider(petId));

    return medicationsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Failed to load medications: $err')),
      data: (views) {
        if (views.isEmpty) {
          return const Center(child: Text('No medications yet. Tap + to add one.'));
        }
        return ListView.builder(
          itemCount: views.length,
          itemBuilder: (context, i) => _MedicationCard(petId: petId, view: views[i]),
        );
      },
    );
  }
}

class _MedicationCard extends ConsumerWidget {
  final String petId;
  final _MedicationView view;
  const _MedicationCard({required this.petId, required this.view});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medication = view.medication;
    final schedule = view.schedule;
    final isActive = medication.status == 'active';

    return Card(
      key: Key('medication_${medication.id}'),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(medication.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
                if (medication.status != 'active')
                  Chip(label: Text(medication.status), visualDensity: VisualDensity.compact),
                IconButton(
                  key: Key('editMedicationButton_${medication.id}'),
                  icon: const Icon(Icons.edit),
                  onPressed: () => _showEditMedicationDialog(context, ref, medication),
                ),
                IconButton(
                  key: Key('deleteMedicationButton_${medication.id}'),
                  icon: const Icon(Icons.delete),
                  onPressed: () => _confirmDelete(context, ref, medication.id),
                ),
              ],
            ),
            Text([
              _medicationTypeLabels[medication.medicationType] ?? medication.medicationType,
              if (medication.strength != null) medication.strength!,
              if (schedule.activePhase != null) '${schedule.activePhase!.phase.doseAmount}, ${schedule.activePhase!.phase.timesPerDay}x/day',
            ].join(' · ')),
            const SizedBox(height: 4),
            if (schedule.isComplete)
              const Text('Course complete.', style: TextStyle(fontStyle: FontStyle.italic))
            else if (isActive && schedule.nextDoseAt != null) ...[
              Text('Next dose: ${_formatDoseTime(schedule.nextDoseAt!)}'),
              const SizedBox(height: 8),
              Row(
                children: [
                  FilledButton(
                    key: Key('logDoseButton_${medication.id}'),
                    onPressed: () async {
                      await MedicationActions(
                        ref.read(medicationsRepositoryProvider),
                        ref.read(remindersRepositoryProvider),
                      ).logDose(medication.id);
                      ref.read(dataVersionProvider.notifier).bump();
                    },
                    child: const Text('Log dose given'),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    key: Key('stopMedicationButton_${medication.id}'),
                    onPressed: () async {
                      await MedicationActions(
                        ref.read(medicationsRepositoryProvider),
                        ref.read(remindersRepositoryProvider),
                      ).stopMedication(medication.id);
                      ref.read(dataVersionProvider.notifier).bump();
                    },
                    child: const Text('Stop'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, String medicationId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete this medication?'),
        content: const Text('This cannot be undone. Its dose history and reminder will be removed too.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
          FilledButton(
            key: const Key('confirmDeleteMedicationButton'),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await MedicationActions(ref.read(medicationsRepositoryProvider), ref.read(remindersRepositoryProvider))
        .deleteMedication(medicationId);
    ref.read(dataVersionProvider.notifier).bump();
  }

  Future<void> _showEditMedicationDialog(BuildContext context, WidgetRef ref, Medication medication) async {
    final nameController = TextEditingController(text: medication.name);
    final strengthController = TextEditingController(text: medication.strength ?? '');
    final notesController = TextEditingController(text: medication.notes ?? '');
    String medicationType = medication.medicationType;
    String? handledBy = medication.handledByPersonId;
    String? error;

    await showDialog<void>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Edit medication'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  key: const Key('editMedicationNameField'),
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name *'),
                ),
                TextField(
                  controller: strengthController,
                  decoration: const InputDecoration(labelText: 'Strength'),
                ),
                DropdownButtonFormField<String>(
                  key: const Key('editMedicationTypeField'),
                  initialValue: medicationType,
                  decoration: const InputDecoration(labelText: 'Type'),
                  items: _medicationTypeLabels.entries
                      .map((e) => DropdownMenuItem(value: e.key, child: Text(e.value)))
                      .toList(),
                  onChanged: (value) => setState(() => medicationType = value ?? medicationType),
                ),
                TextField(
                  controller: notesController,
                  decoration: const InputDecoration(labelText: 'Notes'),
                  maxLines: 3,
                ),
                Consumer(
                  builder: (context, ref, _) {
                    final peopleAsync = ref.watch(_activePeopleProvider);
                    return peopleAsync.when(
                      loading: () => const LinearProgressIndicator(),
                      error: (e, _) => Text('Could not load people: $e'),
                      data: (people) => DropdownButtonFormField<String>(
                        initialValue: handledBy,
                        decoration: const InputDecoration(labelText: 'Handled by'),
                        items: people.map((p) => DropdownMenuItem(value: p.id, child: Text(p.name))).toList(),
                        onChanged: (value) => setState(() => handledBy = value),
                      ),
                    );
                  },
                ),
                if (error != null) Text(error!, style: const TextStyle(color: Colors.red)),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
            FilledButton(
              key: const Key('saveMedicationEditButton'),
              onPressed: () async {
                if (nameController.text.trim().isEmpty) {
                  setState(() => error = 'Name is required.');
                  return;
                }
                await ref.read(medicationsRepositoryProvider).updateFields(medication.id, {
                  'name': nameController.text.trim(),
                  'strength': strengthController.text.trim().isEmpty ? null : strengthController.text.trim(),
                  'medication_type': medicationType,
                  'notes': notesController.text.trim().isEmpty ? null : notesController.text.trim(),
                  'handled_by_person_id': handledBy,
                });
                ref.read(dataVersionProvider.notifier).bump();
                if (context.mounted) Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showAddMedicationSheet(BuildContext context, String petId) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => _MedicationFormSheet(petId: petId),
  );
}

class _PhaseControllers {
  final doseAmount = TextEditingController();
  final timesPerDay = TextEditingController(text: '1');
  final doseTimes = TextEditingController();
  final durationValue = TextEditingController();
  String durationType = 'time_based';

  void dispose() {
    doseAmount.dispose();
    timesPerDay.dispose();
    doseTimes.dispose();
    durationValue.dispose();
  }
}

class _MedicationFormSheet extends ConsumerStatefulWidget {
  final String petId;
  const _MedicationFormSheet({required this.petId});

  @override
  ConsumerState<_MedicationFormSheet> createState() => _MedicationFormSheetState();
}

class _MedicationFormSheetState extends ConsumerState<_MedicationFormSheet> {
  final _nameController = TextEditingController();
  final _strengthController = TextEditingController();
  final _startDateController = TextEditingController(text: DateTime.now().toIso8601String().substring(0, 10));
  final _notesController = TextEditingController();
  String _medicationType = 'pill';
  String? _handledBy;
  final List<_PhaseControllers> _phases = [_PhaseControllers()];
  String? _error;
  bool _saving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _strengthController.dispose();
    _startDateController.dispose();
    _notesController.dispose();
    for (final p in _phases) {
      p.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    setState(() {
      _error = null;
      _saving = true;
    });

    final data = <String, dynamic>{
      'pet_id': widget.petId,
      'name': _nameController.text.trim(),
      if (_strengthController.text.trim().isNotEmpty) 'strength': _strengthController.text.trim(),
      'medication_type': _medicationType,
      'start_date': _startDateController.text.trim(),
      if (_notesController.text.trim().isNotEmpty) 'notes': _notesController.text.trim(),
      if (_handledBy != null) 'handled_by_person_id': _handledBy,
    };

    final phaseMaps = _phases.map((p) {
      final timesPerDay = int.tryParse(p.timesPerDay.text.trim()) ?? 0;
      final durationValue = int.tryParse(p.durationValue.text.trim());
      return <String, dynamic>{
        'dose_amount': p.doseAmount.text.trim(),
        'times_per_day': timesPerDay,
        'dose_times': p.doseTimes.text.trim(),
        'duration_type': p.durationType,
        if (p.durationType == 'time_based') 'duration_days': durationValue,
        if (p.durationType == 'dose_based') 'duration_dose_count': durationValue,
      };
    }).toList();

    try {
      await MedicationActions(ref.read(medicationsRepositoryProvider), ref.read(remindersRepositoryProvider))
          .createMedication(data, phaseMaps);
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
    final peopleAsync = ref.watch(_activePeopleProvider);

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Add medication', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            TextField(
              key: const Key('medicationNameField'),
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Medication name *'),
            ),
            const SizedBox(height: 8),
            TextField(
              key: const Key('medicationStrengthField'),
              controller: _strengthController,
              decoration: const InputDecoration(labelText: 'Strength (e.g. 50mg)'),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              key: const Key('medicationTypeField'),
              initialValue: _medicationType,
              decoration: const InputDecoration(labelText: 'Type'),
              items: _medicationTypeLabels.entries
                  .map((e) => DropdownMenuItem(value: e.key, child: Text(e.value)))
                  .toList(),
              onChanged: (value) => setState(() => _medicationType = value ?? _medicationType),
            ),
            const SizedBox(height: 8),
            DateField(
              key: const Key('medicationStartDateField'),
              controller: _startDateController,
              label: 'Start date',
              required: true,
            ),
            const SizedBox(height: 8),
            peopleAsync.when(
              loading: () => const LinearProgressIndicator(),
              error: (e, _) => Text('Could not load people: $e'),
              data: (people) => DropdownButtonFormField<String>(
                key: const Key('medicationHandledByField'),
                initialValue: _handledBy,
                decoration: const InputDecoration(labelText: 'Handled by'),
                items: people.map((p) => DropdownMenuItem(value: p.id, child: Text(p.name))).toList(),
                onChanged: (value) => setState(() => _handledBy = value),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              key: const Key('medicationNotesField'),
              controller: _notesController,
              decoration: const InputDecoration(labelText: 'Notes'),
              maxLines: 3,
            ),
            const Divider(height: 24),
            Text('Dosing schedule', style: Theme.of(context).textTheme.titleMedium),
            const Text(
              'One phase covers the whole course. Add another phase for a step-down/titrated schedule (e.g. "2 pills for 3 days, then 1 pill for 7 days").',
            ),
            for (var i = 0; i < _phases.length; i++) _PhaseCard(
              key: ValueKey(_phases[i]),
              index: i,
              controllers: _phases[i],
              onRemove: _phases.length > 1
                  ? () => setState(() {
                        _phases[i].dispose();
                        _phases.removeAt(i);
                      })
                  : null,
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              key: const Key('addPhaseButton'),
              onPressed: () => setState(() => _phases.add(_PhaseControllers())),
              icon: const Icon(Icons.add),
              label: const Text('Add another phase (titration)'),
            ),
            if (_error != null) ...[
              const SizedBox(height: 8),
              Text(_error!, style: const TextStyle(color: Colors.red)),
            ],
            const SizedBox(height: 12),
            FilledButton(
              key: const Key('medicationSaveButton'),
              onPressed: _saving ? null : _save,
              child: _saving ? const CircularProgressIndicator() : const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhaseCard extends StatefulWidget {
  final int index;
  final _PhaseControllers controllers;
  final VoidCallback? onRemove;
  const _PhaseCard({super.key, required this.index, required this.controllers, this.onRemove});

  @override
  State<_PhaseCard> createState() => _PhaseCardState();
}

class _PhaseCardState extends State<_PhaseCard> {
  @override
  Widget build(BuildContext context) {
    final c = widget.controllers;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(child: Text('Phase ${widget.index + 1}', style: const TextStyle(fontWeight: FontWeight.bold))),
                if (widget.onRemove != null)
                  IconButton(
                    key: Key('removePhaseButton_${widget.index}'),
                    icon: const Icon(Icons.close),
                    onPressed: widget.onRemove,
                  ),
              ],
            ),
            TextField(
              key: Key('phaseDoseAmountField_${widget.index}'),
              controller: c.doseAmount,
              decoration: const InputDecoration(labelText: 'Dose amount (e.g. 1 tablet) *'),
            ),
            const SizedBox(height: 8),
            TextField(
              key: Key('phaseTimesPerDayField_${widget.index}'),
              controller: c.timesPerDay,
              decoration: const InputDecoration(labelText: 'Times per day *'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextField(
              key: Key('phaseDoseTimesField_${widget.index}'),
              controller: c.doseTimes,
              decoration: const InputDecoration(labelText: 'Dose times, e.g. 08:00, 20:00 *'),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              key: Key('phaseDurationTypeField_${widget.index}'),
              initialValue: c.durationType,
              decoration: const InputDecoration(labelText: 'Duration'),
              items: const [
                DropdownMenuItem(value: 'time_based', child: Text('For a number of days')),
                DropdownMenuItem(value: 'dose_based', child: Text('For a number of doses')),
              ],
              onChanged: (value) => setState(() => c.durationType = value ?? c.durationType),
            ),
            const SizedBox(height: 8),
            TextField(
              key: Key('phaseDurationValueField_${widget.index}'),
              controller: c.durationValue,
              decoration: InputDecoration(
                labelText: c.durationType == 'time_based' ? 'Number of days *' : 'Total number of doses *',
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
