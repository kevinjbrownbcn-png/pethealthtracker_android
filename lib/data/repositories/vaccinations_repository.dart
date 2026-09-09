// Vaccination repository. Direct port of core/repositories/vaccinations.py.

import 'package:drift/drift.dart';

import '../../domain/validation.dart';
import '../database.dart';
import 'repository_utils.dart';

class VaccinationsRepository {
  final AppDatabase db;
  VaccinationsRepository(this.db);

  Future<List<ValidationWarning>> checkDuplicate(
    String petId,
    String vaccineName,
    String dateAdministered, {
    String? excludeId,
  }) async {
    final query = db.select(db.vaccinations)
      ..where((v) =>
          v.petId.equals(petId) & v.vaccineName.equals(vaccineName) & v.dateAdministered.equals(dateAdministered));
    if (excludeId != null) {
      query.where((v) => v.id.equals(excludeId).not());
    }
    final match = await query.getSingleOrNull();
    if (match != null) {
      return [
        const ValidationWarning('vaccine_name', 'A vaccination with this name and date already exists for this pet.')
      ];
    }
    return const [];
  }

  /// Validation-only preview, no write.
  Future<List<ValidationWarning>> check(Map<String, dynamic> data, {String? excludeId}) async {
    final warnings = validateVaccination(data);
    warnings.addAll(await checkDuplicate(
      data['pet_id'] as String,
      data['vaccine_name'] as String,
      data['date_administered'] as String,
      excludeId: excludeId,
    ));
    return warnings;
  }

  Future<(String, List<ValidationWarning>)> create(Map<String, dynamic> data) async {
    final warnings = await check(data);
    final id = newId();
    final timestamp = nowIso();
    await db.into(db.vaccinations).insert(VaccinationsCompanion.insert(
          id: id,
          petId: data['pet_id'] as String,
          vaccineName: data['vaccine_name'] as String,
          dateAdministered: data['date_administered'] as String,
          provider: Value(data['provider'] as String?),
          lotNumber: Value(data['lot_number'] as String?),
          nextDueDate: Value(data['next_due_date'] as String?),
          notes: Value(data['notes'] as String?),
          handledByPersonId: Value(data['handled_by_person_id'] as String?),
          createdAt: timestamp,
          lastEditedAt: timestamp,
        ));
    return (id, warnings);
  }

  Future<Vaccination?> get(String vaccinationId) {
    return (db.select(db.vaccinations)..where((v) => v.id.equals(vaccinationId))).getSingleOrNull();
  }

  Future<List<Vaccination>> listForPet(String petId) {
    return (db.select(db.vaccinations)
          ..where((v) => v.petId.equals(petId))
          ..orderBy([(v) => OrderingTerm.asc(v.dateAdministered)]))
        .get();
  }

  Future<List<ValidationWarning>> update(String vaccinationId, Map<String, dynamic> data) async {
    final existing = await get(vaccinationId);
    if (existing == null) throw StateError('Vaccination $vaccinationId not found');
    final merged = {
      'pet_id': existing.petId,
      'vaccine_name': existing.vaccineName,
      'date_administered': existing.dateAdministered,
      'next_due_date': existing.nextDueDate,
      ...data,
    };
    final warnings = await check(merged, excludeId: vaccinationId);

    final companion = VaccinationsCompanion(
      vaccineName: data.containsKey('vaccine_name') ? Value(data['vaccine_name'] as String) : const Value.absent(),
      dateAdministered:
          data.containsKey('date_administered') ? Value(data['date_administered'] as String) : const Value.absent(),
      provider: data.containsKey('provider') ? Value(data['provider'] as String?) : const Value.absent(),
      lotNumber: data.containsKey('lot_number') ? Value(data['lot_number'] as String?) : const Value.absent(),
      nextDueDate: data.containsKey('next_due_date') ? Value(data['next_due_date'] as String?) : const Value.absent(),
      notes: data.containsKey('notes') ? Value(data['notes'] as String?) : const Value.absent(),
      handledByPersonId:
          data.containsKey('handled_by_person_id') ? Value(data['handled_by_person_id'] as String?) : const Value.absent(),
      lastEditedAt: Value(nowIso()),
    );
    await (db.update(db.vaccinations)..where((v) => v.id.equals(vaccinationId))).write(companion);
    return warnings;
  }

  Future<void> delete(String vaccinationId) async {
    await (db.delete(db.vaccinations)..where((v) => v.id.equals(vaccinationId))).go();
  }
}
