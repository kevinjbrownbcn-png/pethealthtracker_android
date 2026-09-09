// Pets tab: list of pets (name, species, computed age, life status) with a
// quick-add form via the FAB (see nav_shell.dart). Single-column touch form,
// per the locked Android screen design. Edit reuses the same form, opened
// from Pet Detail's AppBar — pet deletion is deliberately not offered,
// matching desktop (pets.py has an "Edit pet profile" expander but no
// delete; every other table's pet_id column REFERENCES pets(id) with no
// ON DELETE action, so a hard delete would just fail with a foreign-key
// violation the moment the pet has any records).

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';
import '../data/repositories/pets_repository.dart';
import '../domain/validation.dart';
import '../providers/database_providers.dart';
import 'pet_detail_screen.dart';

const _sexOptions = ['', 'Male', 'Female', 'Unknown'];
const _sterilizationOptions = ['', 'Yes', 'No'];
const _lifeStatusOptions = ['active', 'deceased', 'rehomed'];

final petsListProvider = FutureProvider<List<Pet>>((ref) async {
  ref.watch(dataVersionProvider);
  return ref.read(petsRepositoryProvider).listAll();
});

class PetsScreen extends ConsumerWidget {
  const PetsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final petsAsync = ref.watch(petsListProvider);

    return petsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Failed to load pets: $err')),
      data: (pets) {
        if (pets.isEmpty) {
          return const Center(child: Text('No pets yet. Tap + to add one.'));
        }
        return ListView.builder(
          itemCount: pets.length,
          itemBuilder: (context, i) {
            final pet = pets[i];
            final age = computeAge(pet);
            // Deceased pets get greyed-out text and a headstone icon instead
            // of the word "deceased" — a fixed grey, not the theme's own
            // muted token, so it reads the same across all 7 themes rather
            // than shifting with the pastel palette.
            final isDeceased = pet.lifeStatus == 'deceased';
            final textStyle = isDeceased ? const TextStyle(color: Colors.grey) : null;

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                key: Key('pet_${pet.id}'),
                leading: isDeceased ? const Icon(Icons.church, color: Colors.grey) : null,
                title: Text(pet.name, style: textStyle),
                subtitle: Text(
                  [
                    pet.species,
                    if (pet.sex != null && pet.sex!.isNotEmpty) pet.sex!,
                    ?age,
                    if (pet.lifeStatus == 'rehomed') pet.lifeStatus,
                  ].join(' · '),
                  style: textStyle,
                ),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PetDetailScreen(pet: pet)),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

Future<void> showAddPetSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => const _PetFormSheet(existingPet: null),
  );
}

Future<void> showEditPetSheet(BuildContext context, Pet pet) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => _PetFormSheet(existingPet: pet),
  );
}

class _PetFormSheet extends ConsumerStatefulWidget {
  final Pet? existingPet;
  const _PetFormSheet({required this.existingPet});

  @override
  ConsumerState<_PetFormSheet> createState() => _PetFormSheetState();
}

class _PetFormSheetState extends ConsumerState<_PetFormSheet> {
  late final _nameController = TextEditingController(text: widget.existingPet?.name ?? '');
  late final _speciesController = TextEditingController(text: widget.existingPet?.species ?? '');
  late final _breedController = TextEditingController(text: widget.existingPet?.breed ?? '');
  late final _colorController = TextEditingController(text: widget.existingPet?.colorMarkings ?? '');
  late String? _sterilizationStatus = widget.existingPet?.sterilizationStatus;
  late String? _sex = widget.existingPet?.sex;
  late String _lifeStatus = widget.existingPet?.lifeStatus ?? 'active';
  String? _error;
  List<ValidationWarning> _warnings = const [];
  bool _saving = false;

  bool get _isEditing => widget.existingPet != null;

  Future<void> _save() async {
    setState(() {
      _error = null;
      _saving = true;
    });
    final data = <String, dynamic>{
      'name': _nameController.text.trim(),
      'species': _speciesController.text.trim(),
      if (_breedController.text.trim().isNotEmpty) 'breed': _breedController.text.trim(),
      if (_sex != null && _sex!.isNotEmpty) 'sex': _sex,
      if (_colorController.text.trim().isNotEmpty) 'color_markings': _colorController.text.trim(),
      if (_sterilizationStatus != null && _sterilizationStatus!.isNotEmpty)
        'sterilization_status': _sterilizationStatus,
      'life_status': _lifeStatus,
    };

    try {
      final List<ValidationWarning> warnings;
      if (_isEditing) {
        warnings = await ref.read(petsRepositoryProvider).update(widget.existingPet!.id, data);
      } else {
        final (_, createWarnings) = await ref.read(petsRepositoryProvider).create(data);
        warnings = createWarnings;
      }
      if (!mounted) return;
      ref.read(dataVersionProvider.notifier).bump();
      if (warnings.isNotEmpty) {
        setState(() {
          _warnings = warnings;
          _saving = false;
        });
        return; // let the user see the warning before dismissing
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
            Text(_isEditing ? 'Edit pet profile' : 'Add a pet',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            TextField(
              key: const Key('petNameField'),
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name *'),
            ),
            const SizedBox(height: 8),
            TextField(
              key: const Key('petSpeciesField'),
              controller: _speciesController,
              decoration: const InputDecoration(labelText: 'Species *'),
            ),
            const SizedBox(height: 8),
            TextField(
              key: const Key('petBreedField'),
              controller: _breedController,
              decoration: const InputDecoration(labelText: 'Breed'),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              key: const Key('petSexField'),
              initialValue: _sexOptions.contains(_sex) ? _sex : '',
              decoration: const InputDecoration(labelText: 'Sex'),
              items: _sexOptions.map((o) => DropdownMenuItem(value: o, child: Text(o.isEmpty ? '(none)' : o))).toList(),
              onChanged: (value) => setState(() => _sex = value),
            ),
            const SizedBox(height: 8),
            TextField(
              key: const Key('petColorField'),
              controller: _colorController,
              decoration: const InputDecoration(labelText: 'Color / markings'),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              key: const Key('petSterilizationField'),
              initialValue: _sterilizationOptions.contains(_sterilizationStatus) ? _sterilizationStatus : '',
              decoration: const InputDecoration(labelText: 'Sterilization status'),
              items: _sterilizationOptions
                  .map((o) => DropdownMenuItem(value: o, child: Text(o.isEmpty ? '(none)' : o)))
                  .toList(),
              onChanged: (value) => setState(() => _sterilizationStatus = value),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              key: const Key('petLifeStatusField'),
              initialValue: _lifeStatus,
              decoration: const InputDecoration(labelText: 'Status'),
              items: _lifeStatusOptions.map((o) => DropdownMenuItem(value: o, child: Text(o))).toList(),
              onChanged: (value) => setState(() => _lifeStatus = value ?? 'active'),
            ),
            if (_error != null) ...[
              const SizedBox(height: 8),
              Text(_error!, style: const TextStyle(color: Colors.red)),
            ],
            if (_warnings.isNotEmpty) ...[
              const SizedBox(height: 8),
              ..._warnings.map((w) => Text(w.message, style: const TextStyle(color: Colors.orange))),
              TextButton(
                key: const Key('petSaveAnywayButton'),
                onPressed: _saving ? null : () => Navigator.of(context).pop(),
                child: const Text('Save anyway (already saved)'),
              ),
            ],
            const SizedBox(height: 12),
            FilledButton(
              key: const Key('petSaveButton'),
              onPressed: _saving ? null : _save,
              child: _saving ? const CircularProgressIndicator() : const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
