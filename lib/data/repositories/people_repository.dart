// Person (household contact) repository. Multi-row, no authentication or
// edit permissions attached — a labeling feature only. Direct port of
// core/repositories/people.py.

import 'package:drift/drift.dart';

import '../../domain/validation.dart';
import '../database.dart';
import 'repository_utils.dart';

class PeopleRepository {
  final AppDatabase db;
  PeopleRepository(this.db);

  Future<String> create(Map<String, dynamic> data) async {
    validateRequired('people', data);
    final id = newId();
    final timestamp = nowIso();
    await db.into(db.people).insert(PeopleCompanion.insert(
          id: id,
          name: data['name'] as String,
          relationshipLabel: Value(data['relationship_label'] as String?),
          contactInfo: Value(data['contact_info'] as String?),
          createdAt: timestamp,
          lastEditedAt: timestamp,
        ));
    return id;
  }

  Future<PeopleData?> get(String personId) {
    return (db.select(db.people)..where((p) => p.id.equals(personId))).getSingleOrNull();
  }

  Future<List<PeopleData>> listActive() {
    return (db.select(db.people)
          ..where((p) => p.isArchived.equals(false))
          ..orderBy([(p) => OrderingTerm.asc(p.name)]))
        .get();
  }

  Future<void> update(String personId, Map<String, dynamic> data) async {
    final companion = PeopleCompanion(
      name: data.containsKey('name') ? Value(data['name'] as String) : const Value.absent(),
      relationshipLabel:
          data.containsKey('relationship_label') ? Value(data['relationship_label'] as String?) : const Value.absent(),
      contactInfo: data.containsKey('contact_info') ? Value(data['contact_info'] as String?) : const Value.absent(),
      lastEditedAt: Value(nowIso()),
    );
    await (db.update(db.people)..where((p) => p.id.equals(personId))).write(companion);
  }

  /// Soft-delete only — historical records must keep saying "handled by
  /// [name]" even after the person row is archived.
  Future<void> archive(String personId) async {
    await (db.update(db.people)..where((p) => p.id.equals(personId)))
        .write(PeopleCompanion(isArchived: const Value(true), lastEditedAt: Value(nowIso())));
  }
}
