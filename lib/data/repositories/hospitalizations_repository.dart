// Hospitalization repository. Direct port of core/repositories/hospitalizations.py.

import 'package:drift/drift.dart';

import '../../domain/validation.dart';
import '../database.dart';
import 'repository_utils.dart';

class HospitalizationsRepository {
  final AppDatabase db;
  HospitalizationsRepository(this.db);

  /// Validation-only preview, no write.
  List<ValidationWarning> check(Map<String, dynamic> data) => validateHospitalization(data);

  Future<(String, List<ValidationWarning>)> create(Map<String, dynamic> data) async {
    final warnings = check(data);
    final id = newId();
    final timestamp = nowIso();
    await db.into(db.hospitalizations).insert(HospitalizationsCompanion.insert(
          id: id,
          petId: data['pet_id'] as String,
          admissionDate: data['admission_date'] as String,
          reason: data['reason'] as String,
          dischargeDate: Value(data['discharge_date'] as String?),
          provider: Value(data['provider'] as String?),
          outcomeNotes: Value(data['outcome_notes'] as String?),
          handledByPersonId: Value(data['handled_by_person_id'] as String?),
          createdAt: timestamp,
          lastEditedAt: timestamp,
        ));
    return (id, warnings);
  }

  Future<Hospitalization?> get(String hospitalizationId) {
    return (db.select(db.hospitalizations)..where((h) => h.id.equals(hospitalizationId))).getSingleOrNull();
  }

  Future<List<Hospitalization>> listForPet(String petId) {
    return (db.select(db.hospitalizations)
          ..where((h) => h.petId.equals(petId))
          ..orderBy([(h) => OrderingTerm.asc(h.admissionDate)]))
        .get();
  }

  Future<List<ValidationWarning>> update(String hospitalizationId, Map<String, dynamic> data) async {
    final existing = await get(hospitalizationId);
    if (existing == null) throw StateError('Hospitalization $hospitalizationId not found');
    final merged = {
      'admission_date': existing.admissionDate,
      'discharge_date': existing.dischargeDate,
      'reason': existing.reason,
      ...data,
    };
    final warnings = check(merged);

    final companion = HospitalizationsCompanion(
      admissionDate: data.containsKey('admission_date') ? Value(data['admission_date'] as String) : const Value.absent(),
      dischargeDate: data.containsKey('discharge_date') ? Value(data['discharge_date'] as String?) : const Value.absent(),
      reason: data.containsKey('reason') ? Value(data['reason'] as String) : const Value.absent(),
      provider: data.containsKey('provider') ? Value(data['provider'] as String?) : const Value.absent(),
      outcomeNotes: data.containsKey('outcome_notes') ? Value(data['outcome_notes'] as String?) : const Value.absent(),
      handledByPersonId:
          data.containsKey('handled_by_person_id') ? Value(data['handled_by_person_id'] as String?) : const Value.absent(),
      lastEditedAt: Value(nowIso()),
    );
    await (db.update(db.hospitalizations)..where((h) => h.id.equals(hospitalizationId))).write(companion);
    return warnings;
  }

  Future<void> delete(String hospitalizationId) async {
    await (db.delete(db.hospitalizations)..where((h) => h.id.equals(hospitalizationId))).go();
  }
}
