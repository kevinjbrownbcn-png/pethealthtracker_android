// Freeform notes repository. Notes appear in the timeline like any other
// entry. Direct port of core/repositories/notes.py.
//
// Note the "text" field here is the caller-facing name (matching the Python
// dict key and the SQL column) even though the generated Dart getter on the
// Note row class is noteText — see tables.drift's "AS noteText" comment for
// why the Dart-level name had to diverge from the SQL column name.

import 'package:drift/drift.dart';

import '../../domain/validation.dart';
import '../database.dart';
import 'repository_utils.dart';

class NotesRepository {
  final AppDatabase db;
  NotesRepository(this.db);

  Future<String> create(Map<String, dynamic> data) async {
    validateRequired('notes', data);
    final id = newId();
    final timestamp = nowIso();
    await db.into(db.notes).insert(NotesCompanion.insert(
          id: id,
          petId: data['pet_id'] as String,
          date: data['date'] as String? ?? timestamp.substring(0, 10),
          noteText: data['text'] as String,
          linkedRecordType: Value(data['linked_record_type'] as String?),
          linkedRecordId: Value(data['linked_record_id'] as String?),
          handledByPersonId: Value(data['handled_by_person_id'] as String?),
          createdAt: timestamp,
          lastEditedAt: timestamp,
        ));
    return id;
  }

  Future<Note?> get(String noteId) {
    return (db.select(db.notes)..where((n) => n.id.equals(noteId))).getSingleOrNull();
  }

  Future<List<Note>> listForPet(String petId) {
    return (db.select(db.notes)
          ..where((n) => n.petId.equals(petId))
          ..orderBy([(n) => OrderingTerm.asc(n.date)]))
        .get();
  }

  Future<void> update(String noteId, Map<String, dynamic> data) async {
    final companion = NotesCompanion(
      date: data.containsKey('date') ? Value(data['date'] as String) : const Value.absent(),
      noteText: data.containsKey('text') ? Value(data['text'] as String) : const Value.absent(),
      linkedRecordType:
          data.containsKey('linked_record_type') ? Value(data['linked_record_type'] as String?) : const Value.absent(),
      linkedRecordId: data.containsKey('linked_record_id') ? Value(data['linked_record_id'] as String?) : const Value.absent(),
      handledByPersonId:
          data.containsKey('handled_by_person_id') ? Value(data['handled_by_person_id'] as String?) : const Value.absent(),
      lastEditedAt: Value(nowIso()),
    );
    await (db.update(db.notes)..where((n) => n.id.equals(noteId))).write(companion);
  }

  Future<void> delete(String noteId) async {
    await (db.delete(db.notes)..where((n) => n.id.equals(noteId))).go();
  }
}
