// Vet appointment repository. Direct port of core/repositories/vet_appointments.py.

import 'package:drift/drift.dart';

import '../../domain/validation.dart';
import '../database.dart';
import 'repository_utils.dart';

class VetAppointmentsRepository {
  final AppDatabase db;
  VetAppointmentsRepository(this.db);

  Future<String> create(Map<String, dynamic> data) async {
    validateRequired('vet_appointments', data);
    final id = newId();
    final timestamp = nowIso();
    await db.into(db.vetAppointments).insert(VetAppointmentsCompanion.insert(
          id: id,
          petId: data['pet_id'] as String,
          date: data['date'] as String,
          reason: data['reason'] as String,
          clinicName: Value(data['clinic_name'] as String?),
          outcomeNotes: Value(data['outcome_notes'] as String?),
          status: Value(data['status'] as String? ?? 'scheduled'),
          handledByPersonId: Value(data['handled_by_person_id'] as String?),
          createdAt: timestamp,
          lastEditedAt: timestamp,
        ));
    return id;
  }

  Future<VetAppointment?> get(String appointmentId) {
    return (db.select(db.vetAppointments)..where((a) => a.id.equals(appointmentId))).getSingleOrNull();
  }

  Future<List<VetAppointment>> listForPet(String petId) {
    return (db.select(db.vetAppointments)
          ..where((a) => a.petId.equals(petId))
          ..orderBy([(a) => OrderingTerm.asc(a.date)]))
        .get();
  }

  Future<void> update(String appointmentId, Map<String, dynamic> data) async {
    final companion = VetAppointmentsCompanion(
      date: data.containsKey('date') ? Value(data['date'] as String) : const Value.absent(),
      reason: data.containsKey('reason') ? Value(data['reason'] as String) : const Value.absent(),
      clinicName: data.containsKey('clinic_name') ? Value(data['clinic_name'] as String?) : const Value.absent(),
      outcomeNotes: data.containsKey('outcome_notes') ? Value(data['outcome_notes'] as String?) : const Value.absent(),
      status: data.containsKey('status') ? Value(data['status'] as String) : const Value.absent(),
      handledByPersonId:
          data.containsKey('handled_by_person_id') ? Value(data['handled_by_person_id'] as String?) : const Value.absent(),
      lastEditedAt: Value(nowIso()),
    );
    await (db.update(db.vetAppointments)..where((a) => a.id.equals(appointmentId))).write(companion);
  }

  /// Marks cancelled rather than deleting — stays visible in the timeline.
  Future<void> cancel(String appointmentId) async {
    await update(appointmentId, {'status': 'cancelled'});
  }

  Future<void> delete(String appointmentId) async {
    await (db.delete(db.vetAppointments)..where((a) => a.id.equals(appointmentId))).go();
  }
}
