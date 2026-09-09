// Medications repository — covers all three medication tables together
// (medications, medication_phases, medication_doses) rather than one file
// per table like every other entity, since a medication is meaningless
// without its phases and the two are always created/deleted as a unit.
// No desktop equivalent yet — see MODULE_PROGRESS.md's "Medications" entry.

import 'package:drift/drift.dart';

import '../../domain/validation.dart';
import '../database.dart';
import 'repository_utils.dart';

class MedicationsRepository {
  final AppDatabase db;
  MedicationsRepository(this.db);

  /// Creates the medication and all its phases in one transaction — a
  /// medication is never left without at least the phases it was created
  /// with. Validation runs before any write.
  Future<(String, List<ValidationWarning>)> create(
    Map<String, dynamic> data,
    List<Map<String, dynamic>> phases,
  ) async {
    final warnings = <ValidationWarning>[...validateMedication(data)];
    for (final phase in phases) {
      warnings.addAll(validateMedicationPhase(phase));
    }

    final id = newId();
    final timestamp = nowIso();
    await db.transaction(() async {
      await db.into(db.medications).insert(MedicationsCompanion.insert(
            id: id,
            petId: data['pet_id'] as String,
            name: data['name'] as String,
            strength: Value(data['strength'] as String?),
            medicationType: data['medication_type'] as String,
            startDate: data['start_date'] as String,
            status: Value(data['status'] as String? ?? 'active'),
            notes: Value(data['notes'] as String?),
            handledByPersonId: Value(data['handled_by_person_id'] as String?),
            createdAt: timestamp,
            lastEditedAt: timestamp,
          ));
      for (var i = 0; i < phases.length; i++) {
        final phase = phases[i];
        await db.into(db.medicationPhases).insert(MedicationPhasesCompanion.insert(
              id: newId(),
              medicationId: id,
              phaseOrder: i,
              doseAmount: phase['dose_amount'] as String,
              timesPerDay: phase['times_per_day'] as int,
              doseTimes: Value(phase['dose_times'] as String?),
              durationType: phase['duration_type'] as String,
              durationDays: Value(phase['duration_days'] as int?),
              durationDoseCount: Value(phase['duration_dose_count'] as int?),
            ));
      }
    });
    return (id, warnings);
  }

  Future<Medication?> get(String medicationId) {
    return (db.select(db.medications)..where((m) => m.id.equals(medicationId))).getSingleOrNull();
  }

  Future<List<Medication>> listForPet(String petId) {
    return (db.select(db.medications)
          ..where((m) => m.petId.equals(petId))
          ..orderBy([(m) => OrderingTerm.desc(m.startDate)]))
        .get();
  }

  Future<List<MedicationPhase>> phasesFor(String medicationId) {
    return (db.select(db.medicationPhases)
          ..where((p) => p.medicationId.equals(medicationId))
          ..orderBy([(p) => OrderingTerm.asc(p.phaseOrder)]))
        .get();
  }

  Future<List<MedicationDose>> dosesFor(String medicationId) {
    return (db.select(db.medicationDoses)..where((d) => d.medicationId.equals(medicationId))).get();
  }

  /// Standard field edit only — name/strength/type/status/notes/handled-by.
  /// Phases are immutable after creation (see MODULE_PROGRESS.md): changing
  /// a schedule mid-course means stopping this medication and adding a new
  /// one, which also keeps the dose log's phase links unambiguous.
  Future<void> updateFields(String medicationId, Map<String, dynamic> data) async {
    final companion = MedicationsCompanion(
      name: data.containsKey('name') ? Value(data['name'] as String) : const Value.absent(),
      strength: data.containsKey('strength') ? Value(data['strength'] as String?) : const Value.absent(),
      medicationType:
          data.containsKey('medication_type') ? Value(data['medication_type'] as String) : const Value.absent(),
      status: data.containsKey('status') ? Value(data['status'] as String) : const Value.absent(),
      notes: data.containsKey('notes') ? Value(data['notes'] as String?) : const Value.absent(),
      handledByPersonId: data.containsKey('handled_by_person_id')
          ? Value(data['handled_by_person_id'] as String?)
          : const Value.absent(),
      lastEditedAt: Value(nowIso()),
    );
    await (db.update(db.medications)..where((m) => m.id.equals(medicationId))).write(companion);
  }

  Future<void> delete(String medicationId) async {
    await db.transaction(() async {
      await (db.delete(db.medicationDoses)..where((d) => d.medicationId.equals(medicationId))).go();
      await (db.delete(db.medicationPhases)..where((p) => p.medicationId.equals(medicationId))).go();
      await (db.delete(db.medications)..where((m) => m.id.equals(medicationId))).go();
    });
  }

  Future<String> logDose(String medicationId, String phaseId, {required String scheduledFor}) async {
    final id = newId();
    await db.into(db.medicationDoses).insert(MedicationDosesCompanion.insert(
          id: id,
          medicationId: medicationId,
          phaseId: phaseId,
          scheduledFor: scheduledFor,
          givenAt: nowIso(),
        ));
    return id;
  }
}
