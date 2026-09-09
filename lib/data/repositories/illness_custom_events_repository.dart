// Illness / custom health event repository — the flexible, freeform-title
// entity that satisfies the no-rigid-record-types guardrail. Direct port of
// core/repositories/illness_custom_events.py.

import 'package:drift/drift.dart';

import '../../domain/validation.dart';
import '../database.dart';
import 'repository_utils.dart';

class IllnessCustomEventsRepository {
  final AppDatabase db;
  IllnessCustomEventsRepository(this.db);

  List<ValidationWarning> check(Map<String, dynamic> data) => validateIllnessCustomEvent(data);

  Future<(String, List<ValidationWarning>)> create(Map<String, dynamic> data) async {
    final warnings = check(data);
    final id = newId();
    final timestamp = nowIso();
    await db.into(db.illnessCustomEvents).insert(IllnessCustomEventsCompanion.insert(
          id: id,
          petId: data['pet_id'] as String,
          title: data['title'] as String,
          date: data['date'] as String,
          description: Value(data['description'] as String?),
          provider: Value(data['provider'] as String?),
          status: Value(data['status'] as String?),
          relatedAppointmentId: Value(data['related_appointment_id'] as String?),
          handledByPersonId: Value(data['handled_by_person_id'] as String?),
          createdAt: timestamp,
          lastEditedAt: timestamp,
        ));
    return (id, warnings);
  }

  Future<IllnessCustomEvent?> get(String eventId) {
    return (db.select(db.illnessCustomEvents)..where((e) => e.id.equals(eventId))).getSingleOrNull();
  }

  Future<List<IllnessCustomEvent>> listForPet(String petId) {
    return (db.select(db.illnessCustomEvents)
          ..where((e) => e.petId.equals(petId))
          ..orderBy([(e) => OrderingTerm.asc(e.date)]))
        .get();
  }

  Future<List<ValidationWarning>> update(String eventId, Map<String, dynamic> data) async {
    final existing = await get(eventId);
    if (existing == null) throw StateError('Illness/custom event $eventId not found');
    final merged = {'date': existing.date, ...data};
    final warnings = check(merged);

    final companion = IllnessCustomEventsCompanion(
      title: data.containsKey('title') ? Value(data['title'] as String) : const Value.absent(),
      date: data.containsKey('date') ? Value(data['date'] as String) : const Value.absent(),
      description: data.containsKey('description') ? Value(data['description'] as String?) : const Value.absent(),
      provider: data.containsKey('provider') ? Value(data['provider'] as String?) : const Value.absent(),
      status: data.containsKey('status') ? Value(data['status'] as String?) : const Value.absent(),
      relatedAppointmentId: data.containsKey('related_appointment_id')
          ? Value(data['related_appointment_id'] as String?)
          : const Value.absent(),
      handledByPersonId:
          data.containsKey('handled_by_person_id') ? Value(data['handled_by_person_id'] as String?) : const Value.absent(),
      lastEditedAt: Value(nowIso()),
    );
    await (db.update(db.illnessCustomEvents)..where((e) => e.id.equals(eventId))).write(companion);
    return warnings;
  }

  Future<void> delete(String eventId) async {
    await (db.delete(db.illnessCustomEvents)..where((e) => e.id.equals(eventId))).go();
  }
}
