// Generic, field-spec-driven add form — one component reused across every
// record type instead of near-duplicate bespoke forms per entity, mirroring
// pethealthapp/web/components/entity_form.py's design (a single component
// driven by a per-entity field-spec list, not N near-identical forms).
//
// Callers supply the field list and a save callback; this widget only knows
// how to render fields and collect them into a Map<String, dynamic> with the
// same snake_case keys the repositories/validation layer already expects.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database.dart';
import '../../domain/validation.dart';
import '../../providers/database_providers.dart';
import 'date_field.dart';

enum FieldType { text, textarea, date, select }

class FieldSpec {
  final String key; // matches the schema column / data map key
  final String label;
  final FieldType type;
  final bool required;
  final bool handledByPicker; // special-cased: a person dropdown, not a text field
  final List<String>? options; // required when type == FieldType.select

  const FieldSpec({
    required this.key,
    required this.label,
    this.type = FieldType.text,
    this.required = false,
    this.handledByPicker = false,
    this.options,
  }) : assert(type != FieldType.select || options != null, 'select fields need options');

  const FieldSpec.handledBy()
      : key = 'handled_by_person_id',
        label = 'Handled by',
        type = FieldType.text,
        required = false,
        handledByPicker = true,
        options = null;
}

/// Opens the sheet. [onSave] performs the actual repository create()/update()
/// call and returns any soft warnings (empty list if none) — hard blocks
/// should throw ValidationError, same contract as every repository's
/// create()/update(). Pass [initialData] to pre-fill fields for editing an
/// existing record — same "editing is never harder than creating" form,
/// just seeded, mirroring entity_form.py's existing_record parameter.
Future<void> showRecordFormSheet(
  BuildContext context, {
  required String title,
  required List<FieldSpec> fields,
  required Future<List<ValidationWarning>> Function(Map<String, dynamic> data) onSave,
  Map<String, dynamic>? initialData,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => _RecordFormSheet(title: title, fields: fields, onSave: onSave, initialData: initialData),
  );
}

class _RecordFormSheet extends ConsumerStatefulWidget {
  final String title;
  final List<FieldSpec> fields;
  final Future<List<ValidationWarning>> Function(Map<String, dynamic> data) onSave;
  final Map<String, dynamic>? initialData;

  const _RecordFormSheet({required this.title, required this.fields, required this.onSave, this.initialData});

  @override
  ConsumerState<_RecordFormSheet> createState() => _RecordFormSheetState();
}

class _RecordFormSheetState extends ConsumerState<_RecordFormSheet> {
  final Map<String, TextEditingController> _controllers = {};
  final Map<String, String?> _selectValues = {};
  String? _handledByPersonId;
  String? _error;
  List<ValidationWarning> _warnings = const [];
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final initial = widget.initialData;
    for (final field in widget.fields) {
      if (field.handledByPicker) {
        _handledByPersonId = initial?[field.key] as String?;
        continue;
      }
      if (field.type == FieldType.select) {
        _selectValues[field.key] = initial?[field.key] as String?;
        continue;
      }
      _controllers[field.key] = TextEditingController(text: initial?[field.key]?.toString() ?? '');
    }
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    setState(() {
      _error = null;
      _saving = true;
    });
    final data = <String, dynamic>{};
    for (final field in widget.fields) {
      if (field.handledByPicker) {
        if (_handledByPersonId != null) data[field.key] = _handledByPersonId;
        continue;
      }
      if (field.type == FieldType.select) {
        final value = _selectValues[field.key];
        if (value != null && value.isNotEmpty) data[field.key] = value;
        continue;
      }
      final text = _controllers[field.key]!.text.trim();
      if (text.isNotEmpty) data[field.key] = text;
    }

    try {
      final warnings = await widget.onSave(data);
      if (!mounted) return;
      ref.read(dataVersionProvider.notifier).bump();
      if (warnings.isNotEmpty) {
        setState(() {
          _warnings = warnings;
          _saving = false;
        });
        return;
      }
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
    final peopleAsync = widget.fields.any((f) => f.handledByPicker) ? ref.watch(_activePeopleProvider) : null;

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
            Text(widget.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            for (final field in widget.fields) ...[
              _buildField(field, peopleAsync),
              const SizedBox(height: 8),
            ],
            if (_error != null) ...[
              Text(_error!, style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 8),
            ],
            if (_warnings.isNotEmpty) ...[
              ..._warnings.map((w) => Text(w.message, style: const TextStyle(color: Colors.orange))),
              TextButton(
                onPressed: _saving ? null : () => Navigator.of(context).pop(),
                child: const Text('OK (already saved)'),
              ),
              const SizedBox(height: 8),
            ],
            FilledButton(
              onPressed: _saving ? null : _save,
              child: _saving ? const CircularProgressIndicator() : const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(FieldSpec field, AsyncValue<List<PeopleData>>? peopleAsync) {
    if (field.handledByPicker) {
      return peopleAsync!.when(
        loading: () => const LinearProgressIndicator(),
        error: (e, _) => Text('Could not load people: $e'),
        data: (people) => DropdownButtonFormField<String>(
          key: const Key('handledByDropdown'),
          initialValue: _handledByPersonId,
          decoration: const InputDecoration(labelText: 'Handled by'),
          items: people.map((p) => DropdownMenuItem(value: p.id, child: Text(p.name))).toList(),
          onChanged: (value) => setState(() => _handledByPersonId = value),
        ),
      );
    }

    if (field.type == FieldType.select) {
      return DropdownButtonFormField<String>(
        key: Key('field_${field.key}'),
        initialValue: _selectValues[field.key],
        decoration: InputDecoration(labelText: field.required ? '${field.label} *' : field.label),
        items: field.options!
            .map((o) => DropdownMenuItem(value: o, child: Text(o.isEmpty ? '(none)' : o)))
            .toList(),
        onChanged: (value) => setState(() => _selectValues[field.key] = value),
      );
    }

    final controller = _controllers[field.key]!;
    switch (field.type) {
      case FieldType.select:
        throw StateError('handled above'); // unreachable — kept so the switch stays exhaustive
      case FieldType.date:
        return DateField(
          key: Key('field_${field.key}'),
          controller: controller,
          label: field.label,
          required: field.required,
        );
      case FieldType.textarea:
        return TextField(
          key: Key('field_${field.key}'),
          controller: controller,
          maxLines: 3,
          decoration: InputDecoration(labelText: field.required ? '${field.label} *' : field.label),
        );
      case FieldType.text:
        return TextField(
          key: Key('field_${field.key}'),
          controller: controller,
          decoration: InputDecoration(labelText: field.required ? '${field.label} *' : field.label),
        );
    }
  }
}

final _activePeopleProvider = FutureProvider((ref) => ref.read(peopleRepositoryProvider).listActive());
