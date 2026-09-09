// Pet detail screen — reached by tapping a pet in the Pets list. One tab per
// record type (vet appointments, vaccinations, hospitalizations, procedures,
// illness/custom events, microchip records, notes), each with its own list,
// inline edit/delete per record, and a FAB that opens the shared
// record_form_sheet with that type's field spec. Attachments aren't here
// yet — they need real file-picking, a separate piece of work (see
// PENDING_ITEMS.md).
//
// Edit/delete mirrors pethealthapp/web/components/record_list.py exactly:
// editing a record whose tracked date field changed propagates to any
// linked reminder (with the same ManualOverrideConflict confirmation
// dialog); deleting a record with a linked reminder asks whether to delete
// the reminder too or detach it, never silently either.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';
import '../domain/reminders.dart';
import '../domain/validation.dart';
import '../providers/database_providers.dart';
import 'pets_screen.dart';
import 'widgets/medications_tab.dart';
import 'widgets/record_form_sheet.dart';

class PetDetailScreen extends ConsumerStatefulWidget {
  final Pet pet;
  const PetDetailScreen({super.key, required this.pet});

  @override
  ConsumerState<PetDetailScreen> createState() => _PetDetailScreenState();
}

// Ref and WidgetRef are deliberately unrelated types in Riverpod (not a
// shared-supertype relationship) — the FutureProvider.family callback below
// only has a Ref, while the FAB's onPressed only has a WidgetRef. Rather
// than fight that, _RecordTypeConfig takes a plain `read` function (both
// Ref.read and WidgetRef.read match this shape as tear-offs), so either
// caller can supply it without a type mismatch.
typedef Reader = T Function<T>(Provider<T> provider);

class _RecordTypeConfig {
  final String label;
  final IconData icon;
  final List<FieldSpec> fields;
  final Future<List<dynamic>> Function(Reader read, String petId) list;
  final Future<List<ValidationWarning>> Function(Reader read, String petId, Map<String, dynamic> data) create;
  final Future<List<ValidationWarning>> Function(Reader read, String recordId, Map<String, dynamic> data) update;
  final Future<void> Function(Reader read, String recordId) delete;
  final String Function(dynamic record) title;
  final String Function(dynamic record) subtitle;
  final String Function(dynamic record) id;
  final Map<String, dynamic> Function(dynamic record) toMap;
  /// Matches keys in sourceTypeByTable/sourceDateFieldByTable (domain/reminders.dart)
  /// — null for microchip_records/notes, which aren't reminder source types
  /// (same 5-of-7 split as core/db.py's REMINDER_SOURCE_TABLES).
  final String? tableName;

  const _RecordTypeConfig({
    required this.label,
    required this.icon,
    required this.fields,
    required this.list,
    required this.create,
    required this.update,
    required this.delete,
    required this.title,
    required this.subtitle,
    required this.id,
    required this.toMap,
    this.tableName,
  });
}

final List<_RecordTypeConfig> _recordTypes = [
  _RecordTypeConfig(
    label: 'Vet visits',
    icon: Icons.medical_services,
    tableName: 'vet_appointments',
    fields: const [
      FieldSpec(key: 'date', label: 'Date', type: FieldType.date, required: true),
      FieldSpec(key: 'reason', label: 'Reason', required: true),
      FieldSpec(key: 'clinic_name', label: 'Clinic name'),
      FieldSpec(key: 'outcome_notes', label: 'Outcome notes', type: FieldType.textarea),
      FieldSpec(key: 'status', label: 'Status', type: FieldType.select, options: ['scheduled', 'completed', 'cancelled']),
      FieldSpec.handledBy(),
    ],
    list: (read, petId) => read(vetAppointmentsRepositoryProvider).listForPet(petId),
    create: (read, petId, data) async {
      await read(vetAppointmentsRepositoryProvider).create({...data, 'pet_id': petId});
      return const [];
    },
    update: (read, recordId, data) async {
      await read(vetAppointmentsRepositoryProvider).update(recordId, data);
      return const [];
    },
    delete: (read, recordId) => read(vetAppointmentsRepositoryProvider).delete(recordId),
    title: (r) => (r as VetAppointment).reason,
    subtitle: (r) => (r as VetAppointment).date,
    id: (r) => (r as VetAppointment).id,
    toMap: (r) {
      final a = r as VetAppointment;
      return {
        'date': a.date,
        'reason': a.reason,
        'clinic_name': a.clinicName,
        'outcome_notes': a.outcomeNotes,
        'status': a.status,
        'handled_by_person_id': a.handledByPersonId,
      };
    },
  ),
  _RecordTypeConfig(
    label: 'Vaccinations',
    icon: Icons.vaccines,
    tableName: 'vaccinations',
    fields: const [
      FieldSpec(key: 'vaccine_name', label: 'Vaccine name', required: true),
      FieldSpec(key: 'date_administered', label: 'Date administered', type: FieldType.date, required: true),
      FieldSpec(key: 'next_due_date', label: 'Next due date', type: FieldType.date),
      FieldSpec(key: 'provider', label: 'Provider'),
      FieldSpec(key: 'lot_number', label: 'Lot number'),
      FieldSpec(key: 'notes', label: 'Notes', type: FieldType.textarea),
      FieldSpec.handledBy(),
    ],
    list: (read, petId) => read(vaccinationsRepositoryProvider).listForPet(petId),
    create: (read, petId, data) async {
      final (_, warnings) = await read(vaccinationsRepositoryProvider).create({...data, 'pet_id': petId});
      return warnings;
    },
    update: (read, recordId, data) => read(vaccinationsRepositoryProvider).update(recordId, data),
    delete: (read, recordId) => read(vaccinationsRepositoryProvider).delete(recordId),
    title: (r) => (r as Vaccination).vaccineName,
    subtitle: (r) => (r as Vaccination).dateAdministered,
    id: (r) => (r as Vaccination).id,
    toMap: (r) {
      final v = r as Vaccination;
      return {
        'vaccine_name': v.vaccineName,
        'date_administered': v.dateAdministered,
        'next_due_date': v.nextDueDate,
        'provider': v.provider,
        'lot_number': v.lotNumber,
        'notes': v.notes,
        'handled_by_person_id': v.handledByPersonId,
      };
    },
  ),
  _RecordTypeConfig(
    label: 'Hospitalizations',
    icon: Icons.local_hospital,
    tableName: 'hospitalizations',
    fields: const [
      FieldSpec(key: 'admission_date', label: 'Admission date', type: FieldType.date, required: true),
      FieldSpec(key: 'discharge_date', label: 'Discharge date', type: FieldType.date),
      FieldSpec(key: 'reason', label: 'Reason', required: true),
      FieldSpec(key: 'provider', label: 'Provider'),
      FieldSpec(key: 'outcome_notes', label: 'Outcome notes', type: FieldType.textarea),
      FieldSpec.handledBy(),
    ],
    list: (read, petId) => read(hospitalizationsRepositoryProvider).listForPet(petId),
    create: (read, petId, data) async {
      final (_, warnings) = await read(hospitalizationsRepositoryProvider).create({...data, 'pet_id': petId});
      return warnings;
    },
    update: (read, recordId, data) => read(hospitalizationsRepositoryProvider).update(recordId, data),
    delete: (read, recordId) => read(hospitalizationsRepositoryProvider).delete(recordId),
    title: (r) => (r as Hospitalization).reason,
    subtitle: (r) => (r as Hospitalization).admissionDate,
    id: (r) => (r as Hospitalization).id,
    toMap: (r) {
      final h = r as Hospitalization;
      return {
        'admission_date': h.admissionDate,
        'discharge_date': h.dischargeDate,
        'reason': h.reason,
        'provider': h.provider,
        'outcome_notes': h.outcomeNotes,
        'handled_by_person_id': h.handledByPersonId,
      };
    },
  ),
  _RecordTypeConfig(
    label: 'Procedures',
    icon: Icons.healing,
    tableName: 'procedures_surgeries',
    fields: const [
      FieldSpec(key: 'procedure_name', label: 'Procedure name', required: true),
      FieldSpec(key: 'date', label: 'Date', type: FieldType.date, required: true),
      FieldSpec(key: 'provider', label: 'Provider'),
      FieldSpec(key: 'anesthesia_info', label: 'Anesthesia info'),
      FieldSpec(key: 'outcome_notes', label: 'Outcome notes', type: FieldType.textarea),
      FieldSpec.handledBy(),
    ],
    list: (read, petId) => read(proceduresSurgeriesRepositoryProvider).listForPet(petId),
    create: (read, petId, data) async {
      await read(proceduresSurgeriesRepositoryProvider).create({...data, 'pet_id': petId});
      return const [];
    },
    update: (read, recordId, data) async {
      await read(proceduresSurgeriesRepositoryProvider).update(recordId, data);
      return const [];
    },
    delete: (read, recordId) => read(proceduresSurgeriesRepositoryProvider).delete(recordId),
    title: (r) => (r as ProceduresSurgery).procedureName,
    subtitle: (r) => (r as ProceduresSurgery).date,
    id: (r) => (r as ProceduresSurgery).id,
    toMap: (r) {
      final p = r as ProceduresSurgery;
      return {
        'procedure_name': p.procedureName,
        'date': p.date,
        'provider': p.provider,
        'anesthesia_info': p.anesthesiaInfo,
        'outcome_notes': p.outcomeNotes,
        'handled_by_person_id': p.handledByPersonId,
      };
    },
  ),
  _RecordTypeConfig(
    label: 'Illness/events',
    icon: Icons.sick,
    tableName: 'illness_custom_events',
    fields: const [
      FieldSpec(key: 'title', label: 'Title', required: true),
      FieldSpec(key: 'date', label: 'Date', type: FieldType.date, required: true),
      FieldSpec(key: 'description', label: 'Description', type: FieldType.textarea),
      FieldSpec(key: 'provider', label: 'Provider'),
      FieldSpec(key: 'status', label: 'Status', type: FieldType.select, options: ['', 'ongoing', 'resolved']),
      FieldSpec.handledBy(),
    ],
    list: (read, petId) => read(illnessCustomEventsRepositoryProvider).listForPet(petId),
    create: (read, petId, data) async {
      final (_, warnings) = await read(illnessCustomEventsRepositoryProvider).create({...data, 'pet_id': petId});
      return warnings;
    },
    update: (read, recordId, data) => read(illnessCustomEventsRepositoryProvider).update(recordId, data),
    delete: (read, recordId) => read(illnessCustomEventsRepositoryProvider).delete(recordId),
    title: (r) => (r as IllnessCustomEvent).title,
    subtitle: (r) => (r as IllnessCustomEvent).date,
    id: (r) => (r as IllnessCustomEvent).id,
    toMap: (r) {
      final e = r as IllnessCustomEvent;
      return {
        'title': e.title,
        'date': e.date,
        'description': e.description,
        'provider': e.provider,
        'status': e.status,
        'handled_by_person_id': e.handledByPersonId,
      };
    },
  ),
  _RecordTypeConfig(
    label: 'Microchip',
    icon: Icons.memory,
    fields: const [
      FieldSpec(key: 'chip_number', label: 'Chip number', required: true),
      FieldSpec(key: 'registry_provider', label: 'Registry provider'),
      FieldSpec(key: 'date_implanted', label: 'Date implanted', type: FieldType.date),
      FieldSpec(key: 'notes', label: 'Notes', type: FieldType.textarea),
    ],
    list: (read, petId) => read(microchipRecordsRepositoryProvider).listForPet(petId),
    create: (read, petId, data) async {
      final (_, warnings) = await read(microchipRecordsRepositoryProvider).create({...data, 'pet_id': petId});
      return warnings;
    },
    update: (read, recordId, data) => read(microchipRecordsRepositoryProvider).update(recordId, data),
    delete: (read, recordId) => read(microchipRecordsRepositoryProvider).delete(recordId),
    title: (r) => (r as MicrochipRecord).chipNumber,
    subtitle: (r) => (r as MicrochipRecord).registryProvider ?? '',
    id: (r) => (r as MicrochipRecord).id,
    toMap: (r) {
      final m = r as MicrochipRecord;
      return {
        'chip_number': m.chipNumber,
        'registry_provider': m.registryProvider,
        'date_implanted': m.dateImplanted,
        'notes': m.notes,
      };
    },
  ),
  _RecordTypeConfig(
    label: 'Notes',
    icon: Icons.note,
    fields: const [
      FieldSpec(key: 'text', label: 'Note', type: FieldType.textarea, required: true),
      FieldSpec(key: 'date', label: 'Date', type: FieldType.date),
      FieldSpec.handledBy(),
    ],
    list: (read, petId) => read(notesRepositoryProvider).listForPet(petId),
    create: (read, petId, data) async {
      await read(notesRepositoryProvider).create({...data, 'pet_id': petId});
      return const [];
    },
    update: (read, recordId, data) async {
      await read(notesRepositoryProvider).update(recordId, data);
      return const [];
    },
    delete: (read, recordId) => read(notesRepositoryProvider).delete(recordId),
    title: (r) => (r as Note).noteText,
    subtitle: (r) => (r as Note).date,
    id: (r) => (r as Note).id,
    toMap: (r) {
      final n = r as Note;
      return {'text': n.noteText, 'date': n.date, 'handled_by_person_id': n.handledByPersonId};
    },
  ),
];

class _PetDetailScreenState extends ConsumerState<PetDetailScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  // Medications is an extra tab tacked on after every _RecordTypeConfig
  // entry, not one of them — it doesn't fit that shape (creation takes a
  // nested phase list, not a flat field map) so it's handled as its own
  // self-contained widget (widgets/medications_tab.dart) instead of being
  // forced into the generic config/list/FAB machinery.
  int get _medicationsTabIndex => _recordTypes.length;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _recordTypes.length + 1, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMedicationsTab = _tabController.index == _medicationsTabIndex;
    final config = isMedicationsTab ? null : _recordTypes[_tabController.index];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pet.name),
        actions: [
          IconButton(
            key: const Key('editPetButton'),
            icon: const Icon(Icons.edit),
            tooltip: 'Edit pet profile',
            onPressed: () => showEditPetSheet(context, widget.pet),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: [
            for (final c in _recordTypes) Tab(icon: Icon(c.icon), text: c.label),
            const Tab(icon: Icon(Icons.medication), text: 'Medications'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          for (final c in _recordTypes) _RecordList(petId: widget.pet.id, config: c),
          MedicationsTab(petId: widget.pet.id),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        key: Key(isMedicationsTab ? 'addMedicationFab' : 'addRecordFab_${config!.label}'),
        onPressed: () =>
            isMedicationsTab ? showAddMedicationSheet(context, widget.pet.id) : _addRecord(context, config!),
        child: const Icon(Icons.add),
      ),
    );
  }

  // Mirrors pets.py's "record a vaccine, remind me when it's due again"
  // workflow: after a vaccination with a next_due_date is saved, offer to
  // create a source-linked reminder for it. Special-cased on vaccinations
  // only, same as desktop's own `if record_type == "vaccinations"` branch —
  // this isn't a generic record-type feature there either.
  Future<void> _addRecord(BuildContext context, _RecordTypeConfig config) async {
    if (config.tableName != 'vaccinations') {
      await showRecordFormSheet(
        context,
        title: 'Add ${config.label.toLowerCase()}',
        fields: config.fields,
        onSave: (data) => config.create(ref.read, widget.pet.id, data),
      );
      return;
    }

    String? savedVaccinationId;
    await showRecordFormSheet(
      context,
      title: 'Add vaccination',
      fields: config.fields,
      onSave: (data) async {
        final (id, warnings) = await ref.read(vaccinationsRepositoryProvider).create({...data, 'pet_id': widget.pet.id});
        savedVaccinationId = id;
        return warnings;
      },
    );
    if (!context.mounted || savedVaccinationId == null) return;

    final vaccination = await ref.read(vaccinationsRepositoryProvider).get(savedVaccinationId!);
    if (vaccination == null || vaccination.nextDueDate == null || !context.mounted) return;

    await _offerVaccinationReminder(context, vaccination);
  }

  Future<void> _offerVaccinationReminder(BuildContext context, Vaccination vaccination) {
    return showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Next due date recorded'),
        content: Text('Next due date recorded: ${vaccination.nextDueDate}'),
        actions: [
          TextButton(
            key: const Key('dismissVaccinationReminderButton'),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('No thanks'),
          ),
          FilledButton(
            key: const Key('confirmVaccinationReminderButton'),
            onPressed: () async {
              await ref.read(remindersRepositoryProvider).create({
                'pet_id': vaccination.petId,
                'title': '${vaccination.vaccineName} booster due',
                'due_date': vaccination.nextDueDate,
                'source_record_type': 'vaccination',
                'source_record_id': vaccination.id,
              });
              ref.read(dataVersionProvider.notifier).bump();
              if (context.mounted) Navigator.of(context).pop();
            },
            child: const Text('Create a reminder for this due date'),
          ),
        ],
      ),
    );
  }
}

final _recordListProvider =
    FutureProvider.family<List<dynamic>, (int, String)>((ref, args) {
  ref.watch(dataVersionProvider);
  final (typeIndex, petId) = args;
  return _recordTypes[typeIndex].list(ref.read, petId);
});

class _RecordList extends ConsumerWidget {
  final String petId;
  final _RecordTypeConfig config;
  const _RecordList({required this.petId, required this.config});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typeIndex = _recordTypes.indexOf(config);
    final recordsAsync = ref.watch(_recordListProvider((typeIndex, petId)));

    return recordsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Failed to load: $err')),
      data: (records) {
        if (records.isEmpty) {
          return Center(child: Text('No ${config.label.toLowerCase()} yet. Tap + to add one.'));
        }
        return ListView.builder(
          itemCount: records.length,
          itemBuilder: (context, i) {
            final record = records[i];
            final recordId = config.id(record);
            return Card(
              key: Key('record_${config.tableName ?? config.label}_$recordId'),
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                title: Text(config.title(record)),
                subtitle: Text(config.subtitle(record)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      key: Key('editButton_${config.tableName ?? config.label}_$recordId'),
                      icon: const Icon(Icons.edit),
                      onPressed: () => _editRecord(context, ref, record, recordId),
                    ),
                    IconButton(
                      key: Key('deleteButton_${config.tableName ?? config.label}_$recordId'),
                      icon: const Icon(Icons.delete),
                      onPressed: () => _confirmDelete(context, ref, recordId),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _editRecord(BuildContext context, WidgetRef ref, dynamic record, String recordId) async {
    final dateField = config.tableName != null ? sourceDateFieldByTable[config.tableName] : null;
    final oldDateValue = dateField != null ? config.toMap(record)[dateField] as String? : null;

    await showRecordFormSheet(
      context,
      title: 'Edit ${config.label.toLowerCase()}',
      fields: config.fields,
      initialData: config.toMap(record),
      onSave: (data) => config.update(ref.read, recordId, data),
    );
    if (!context.mounted) return;

    // Mirrors record_list.py: if this type tracks a date a reminder can be
    // linked to, and that date actually changed, propagate it — surfacing
    // the manual-override confirmation dialog if a linked reminder was
    // hand-edited, exactly like the desktop app.
    final sourceType = config.tableName != null ? sourceTypeByTable[config.tableName] : null;
    if (sourceType == null || dateField == null) return;

    final updatedRecords = await config.list(ref.read, petId);
    dynamic updated;
    for (final r in updatedRecords) {
      if (config.id(r) == recordId) {
        updated = r;
        break;
      }
    }
    if (updated == null) return;
    final newDateValue = config.toMap(updated)[dateField] as String?;
    if (newDateValue == null || newDateValue == oldDateValue) return;

    final actions = ReminderActions(ref.read(remindersRepositoryProvider));
    try {
      await actions.propagateSourceDateChange(sourceType, recordId, newDateValue);
    } on ManualOverrideConflict catch (conflict) {
      if (!context.mounted) return;
      await _showOverwriteConflictDialog(context, ref, actions, sourceType, recordId, newDateValue, conflict.reminders);
    }
    ref.read(dataVersionProvider.notifier).bump();
  }

  Future<void> _showOverwriteConflictDialog(
    BuildContext context,
    WidgetRef ref,
    ReminderActions actions,
    String sourceType,
    String recordId,
    String newDate,
    List<Reminder> reminders,
  ) {
    return showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reminder was manually set'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('The following reminder(s) linked to this record were manually rescheduled:'),
            for (final r in reminders) Text('- ${r.title} (currently due ${r.dueDate})'),
            const SizedBox(height: 8),
            Text('Update them to match the new date ($newDate) anyway, or leave them as they are?'),
          ],
        ),
        actions: [
          TextButton(
            key: const Key('leaveRemindersButton'),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Leave as is'),
          ),
          FilledButton(
            key: const Key('updateRemindersButton'),
            onPressed: () async {
              await actions.propagateSourceDateChange(sourceType, recordId, newDate, force: true);
              if (context.mounted) Navigator.of(context).pop();
              ref.read(dataVersionProvider.notifier).bump();
            },
            child: const Text('Update to match'),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, String recordId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete this record?'),
        content: const Text('This cannot be undone.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
          FilledButton(
            key: const Key('confirmDeleteRecordButton'),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;

    final sourceType = config.tableName != null ? sourceTypeByTable[config.tableName] : null;
    final actions = ReminderActions(ref.read(remindersRepositoryProvider));
    final linked = sourceType != null ? await actions.getLinkedReminders(sourceType, recordId) : <Reminder>[];

    if (linked.isEmpty) {
      await config.delete(ref.read, recordId);
      ref.read(dataVersionProvider.notifier).bump();
      return;
    }

    if (!context.mounted) return;
    await _showDeleteWithReminderDialog(context, ref, actions, sourceType!, recordId, linked);
  }

  Future<void> _showDeleteWithReminderDialog(
    BuildContext context,
    WidgetRef ref,
    ReminderActions actions,
    String sourceType,
    String recordId,
    List<Reminder> reminders,
  ) {
    return showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete linked reminder?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('This record has a linked reminder:'),
            for (final r in reminders) Text('- ${r.title} (due ${r.dueDate})'),
            const SizedBox(height: 8),
            const Text('Delete the reminder too, or keep it as a standalone reminder?'),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
          OutlinedButton(
            key: const Key('keepReminderDetachButton'),
            onPressed: () async {
              await actions.handleSourceDeletion(sourceType, recordId, deleteReminder: false);
              await config.delete(ref.read, recordId);
              if (context.mounted) Navigator.of(context).pop();
              ref.read(dataVersionProvider.notifier).bump();
            },
            child: const Text('Keep reminder, detach it'),
          ),
          FilledButton(
            key: const Key('deleteReminderTooButton'),
            onPressed: () async {
              await actions.handleSourceDeletion(sourceType, recordId, deleteReminder: true);
              await config.delete(ref.read, recordId);
              if (context.mounted) Navigator.of(context).pop();
              ref.read(dataVersionProvider.notifier).bump();
            },
            child: const Text('Delete reminder too'),
          ),
        ],
      ),
    );
  }
}
