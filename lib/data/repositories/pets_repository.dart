// Pet repository. Computes display age here (from DOB, or from the
// approximate age + anchor date) so every caller sees the same value — never
// recalculated in the UI. Direct port of core/repositories/pets.py.

import 'package:drift/drift.dart' hide isNull;

import '../../domain/validation.dart';
import '../database.dart';
import 'repository_utils.dart';

/// Human-readable age, always derived — never a stored running counter.
String? computeAge(Pet pet) {
  if (pet.dateOfBirth != null) {
    final dob = DateTime.parse(pet.dateOfBirth!);
    final years = DateTime.now().difference(dob).inDays ~/ 365;
    return years >= 1 ? '$years yr' : '< 1 yr';
  }

  if (pet.approximateAgeValue != null && pet.approximateAgeSetAt != null) {
    final anchor = DateTime.parse(pet.approximateAgeSetAt!);
    final elapsedYears = DateTime.now().difference(anchor).inDays ~/ 365;
    return '~${pet.approximateAgeValue! + elapsedYears} yr';
  }

  return null;
}

class PetsRepository {
  final AppDatabase db;
  PetsRepository(this.db);

  Future<List<ValidationWarning>> checkDuplicateName(String name, {String? excludeId}) async {
    final query = db.select(db.pets)
      ..where((p) => p.name.equals(name) & p.lifeStatus.equals('deceased').not());
    if (excludeId != null) {
      query.where((p) => p.id.equals(excludeId).not());
    }
    final match = await query.getSingleOrNull();
    if (match != null) {
      return [ValidationWarning('name', 'A pet named "$name" already exists.')];
    }
    return const [];
  }

  /// Validation-only preview, no write — mirrors pets.check() in the Python source.
  Future<List<ValidationWarning>> check(Map<String, dynamic> data, {String? excludeId}) async {
    // validatePet() returns a `const []` literal in the no-warnings case —
    // immutable, so it has to be copied before addAll() can mutate it.
    // Caught live: the original `final warnings = validatePet(data);` threw
    // "Unsupported operation: Cannot add to an unmodifiable list" the moment
    // a pet had no hard-block/soft-warning issues of its own.
    final warnings = [...validatePet(data)];
    warnings.addAll(await checkDuplicateName(data['name'] as String, excludeId: excludeId));
    return warnings;
  }

  /// Returns (newId, softWarnings). Throws ValidationError on a hard block.
  Future<(String, List<ValidationWarning>)> create(Map<String, dynamic> data) async {
    final warnings = await check(data);

    final id = newId();
    final timestamp = nowIso();
    final approxAgeValue = data['approximate_age_value'] as int?;
    await db.into(db.pets).insert(PetsCompanion.insert(
          id: id,
          name: data['name'] as String,
          species: data['species'] as String,
          breed: Value(data['breed'] as String?),
          sex: Value(data['sex'] as String?),
          dateOfBirth: Value(data['date_of_birth'] as String?),
          approximateAgeValue: Value(approxAgeValue),
          approximateAgeSetAt: Value(approxAgeValue != null ? timestamp.substring(0, 10) : null),
          colorMarkings: Value(data['color_markings'] as String?),
          sterilizationStatus: Value(data['sterilization_status'] as String?),
          lifeStatus: Value(data['life_status'] as String? ?? 'active'),
          createdAt: timestamp,
          lastEditedAt: timestamp,
        ));
    return (id, warnings);
  }

  Future<Pet?> get(String petId) {
    return (db.select(db.pets)..where((p) => p.id.equals(petId))).getSingleOrNull();
  }

  Future<List<Pet>> listAll({bool includeDeceased = true}) {
    final query = db.select(db.pets)..orderBy([(p) => OrderingTerm.asc(p.name)]);
    if (!includeDeceased) {
      query.where((p) => p.lifeStatus.equals('deceased').not());
    }
    return query.get();
  }

  /// Returns soft warnings. If the approximate age value is being changed,
  /// resets the anchor date to today, per the locked age-field design.
  Future<List<ValidationWarning>> update(String petId, Map<String, dynamic> data) async {
    final existing = await get(petId);
    if (existing == null) {
      throw StateError('Pet $petId not found');
    }
    final merged = _petToMap(existing)..addAll(data);
    final warnings = await check(merged, excludeId: petId);

    final resetAnchor =
        data.containsKey('approximate_age_value') && data['approximate_age_value'] != existing.approximateAgeValue;

    final companion = PetsCompanion(
      name: data.containsKey('name') ? Value(data['name'] as String) : const Value.absent(),
      species: data.containsKey('species') ? Value(data['species'] as String) : const Value.absent(),
      breed: data.containsKey('breed') ? Value(data['breed'] as String?) : const Value.absent(),
      sex: data.containsKey('sex') ? Value(data['sex'] as String?) : const Value.absent(),
      dateOfBirth: data.containsKey('date_of_birth') ? Value(data['date_of_birth'] as String?) : const Value.absent(),
      approximateAgeValue:
          data.containsKey('approximate_age_value') ? Value(data['approximate_age_value'] as int?) : const Value.absent(),
      approximateAgeSetAt: resetAnchor ? Value(nowIso().substring(0, 10)) : const Value.absent(),
      colorMarkings: data.containsKey('color_markings') ? Value(data['color_markings'] as String?) : const Value.absent(),
      sterilizationStatus:
          data.containsKey('sterilization_status') ? Value(data['sterilization_status'] as String?) : const Value.absent(),
      lifeStatus: data.containsKey('life_status') ? Value(data['life_status'] as String) : const Value.absent(),
      lastEditedAt: Value(nowIso()),
    );
    await (db.update(db.pets)..where((p) => p.id.equals(petId))).write(companion);
    return warnings;
  }

  Future<void> delete(String petId) async {
    await (db.delete(db.pets)..where((p) => p.id.equals(petId))).go();
  }

  Map<String, dynamic> _petToMap(Pet pet) => {
        'name': pet.name,
        'species': pet.species,
        'breed': pet.breed,
        'sex': pet.sex,
        'date_of_birth': pet.dateOfBirth,
        'approximate_age_value': pet.approximateAgeValue,
        'life_status': pet.lifeStatus,
      };
}
