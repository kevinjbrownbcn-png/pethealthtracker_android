// Procedure/surgery repository. Direct port of core/repositories/procedures_surgeries.py.

import 'package:drift/drift.dart';

import '../../domain/validation.dart';
import '../database.dart';
import 'repository_utils.dart';

class ProceduresSurgeriesRepository {
  final AppDatabase db;
  ProceduresSurgeriesRepository(this.db);

  Future<String> create(Map<String, dynamic> data) async {
    validateRequired('procedures_surgeries', data);
    final id = newId();
    final timestamp = nowIso();
    await db.into(db.proceduresSurgeries).insert(ProceduresSurgeriesCompanion.insert(
          id: id,
          petId: data['pet_id'] as String,
          procedureName: data['procedure_name'] as String,
          date: data['date'] as String,
          provider: Value(data['provider'] as String?),
          outcomeNotes: Value(data['outcome_notes'] as String?),
          anesthesiaInfo: Value(data['anesthesia_info'] as String?),
          relatedHospitalizationId: Value(data['related_hospitalization_id'] as String?),
          handledByPersonId: Value(data['handled_by_person_id'] as String?),
          createdAt: timestamp,
          lastEditedAt: timestamp,
        ));
    return id;
  }

  Future<ProceduresSurgery?> get(String procedureId) {
    return (db.select(db.proceduresSurgeries)..where((p) => p.id.equals(procedureId))).getSingleOrNull();
  }

  Future<List<ProceduresSurgery>> listForPet(String petId) {
    return (db.select(db.proceduresSurgeries)
          ..where((p) => p.petId.equals(petId))
          ..orderBy([(p) => OrderingTerm.asc(p.date)]))
        .get();
  }

  Future<void> update(String procedureId, Map<String, dynamic> data) async {
    final companion = ProceduresSurgeriesCompanion(
      procedureName: data.containsKey('procedure_name') ? Value(data['procedure_name'] as String) : const Value.absent(),
      date: data.containsKey('date') ? Value(data['date'] as String) : const Value.absent(),
      provider: data.containsKey('provider') ? Value(data['provider'] as String?) : const Value.absent(),
      outcomeNotes: data.containsKey('outcome_notes') ? Value(data['outcome_notes'] as String?) : const Value.absent(),
      anesthesiaInfo: data.containsKey('anesthesia_info') ? Value(data['anesthesia_info'] as String?) : const Value.absent(),
      relatedHospitalizationId: data.containsKey('related_hospitalization_id')
          ? Value(data['related_hospitalization_id'] as String?)
          : const Value.absent(),
      handledByPersonId:
          data.containsKey('handled_by_person_id') ? Value(data['handled_by_person_id'] as String?) : const Value.absent(),
      lastEditedAt: Value(nowIso()),
    );
    await (db.update(db.proceduresSurgeries)..where((p) => p.id.equals(procedureId))).write(companion);
  }

  Future<void> delete(String procedureId) async {
    await (db.delete(db.proceduresSurgeries)..where((p) => p.id.equals(procedureId))).go();
  }
}
