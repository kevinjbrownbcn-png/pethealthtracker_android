// Reminder repository — basic CRUD + computed urgency, ported from
// pethealthapp/core/repositories/reminders.py.
//
// reminders.status stores only user-set states (active/snoozed/done/
// dismissed). Urgency (upcoming/dueSoon/overdue) is computed here at query
// time, never stored — same pattern as the desktop app.
//
// Keeps the desktop app's "thin repository over a loose field map" style
// (Map<String, dynamic>, snake_case keys matching the schema) rather than
// drift's typed Companion API directly, so this stays diffable against the
// Python source and shares field-naming with lib/domain/validation.dart.

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';

const dueSoonWindowDays = 7;
const _uuid = Uuid();

enum ReminderUrgency { upcoming, dueSoon, overdue, snoozed, done, dismissed }

String newId() => _uuid.v4();
String nowIso() => DateTime.now().toUtc().toIso8601String();
DateTime _todayDateOnly() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
}

/// upcoming | dueSoon | overdue | snoozed | done | dismissed
ReminderUrgency computeUrgency(Reminder reminder) {
  if (reminder.status == 'snoozed') {
    final snoozedUntil = reminder.snoozedUntil;
    if (snoozedUntil != null && DateTime.parse(snoozedUntil).isAfter(_todayDateOnly())) {
      return ReminderUrgency.snoozed;
    }
    // Snooze period has passed — re-surface it as if active, computed at
    // query time rather than needing a background job to flip the status.
  } else if (reminder.status == 'done') {
    return ReminderUrgency.done;
  } else if (reminder.status == 'dismissed') {
    return ReminderUrgency.dismissed;
  }

  final due = DateTime.parse(reminder.dueDate);
  final today = _todayDateOnly();
  if (due.isBefore(today)) return ReminderUrgency.overdue;
  if (!due.isAfter(today.add(const Duration(days: dueSoonWindowDays)))) {
    return ReminderUrgency.dueSoon;
  }
  return ReminderUrgency.upcoming;
}

RemindersCompanion _toCompanion(Map<String, dynamic> data, {required String id, required String timestamp}) {
  return RemindersCompanion.insert(
    id: id,
    petId: data['pet_id'] as String,
    title: data['title'] as String,
    dueDate: data['due_date'] as String,
    status: Value(data['status'] as String? ?? 'active'),
    snoozedUntil: Value(data['snoozed_until'] as String?),
    sourceRecordType: Value(data['source_record_type'] as String?),
    sourceRecordId: Value(data['source_record_id'] as String?),
    isManuallyOverridden: Value(data['is_manually_overridden'] as bool? ?? false),
    createdAt: timestamp,
    lastEditedAt: timestamp,
  );
}

class RemindersRepository {
  final AppDatabase db;
  RemindersRepository(this.db);

  /// Returns the new id. Validation is the caller's job (see
  /// lib/domain/validation.dart's validateReminder) — this mirrors the
  /// desktop repo's create(), which is a thin insert, not the check()+
  /// create() pair (that split lives one layer up, in domain/reminders.dart,
  /// same as core/reminders.py sits above core/repositories/reminders.py).
  Future<String> create(Map<String, dynamic> data) async {
    final id = data['id'] as String? ?? newId();
    await db.into(db.reminders).insert(_toCompanion(data, id: id, timestamp: nowIso()));
    return id;
  }

  Future<Reminder?> get(String reminderId) {
    return (db.select(db.reminders)..where((r) => r.id.equals(reminderId))).getSingleOrNull();
  }

  Future<List<Reminder>> listForPet(String petId) {
    return (db.select(db.reminders)
          ..where((r) => r.petId.equals(petId))
          ..orderBy([(r) => OrderingTerm.asc(r.dueDate)]))
        .get();
  }

  /// Includes snoozed rows too — computeUrgency re-surfaces ones whose
  /// snooze has expired.
  Future<List<Reminder>> listDueOrOverdue({String? petId, int? limit}) async {
    final query = db.select(db.reminders)
      ..where((r) => r.status.isIn(['active', 'snoozed']))
      ..orderBy([(r) => OrderingTerm.asc(r.dueDate)]);
    if (petId != null) {
      query.where((r) => r.petId.equals(petId));
    }
    if (limit != null) {
      query.limit(limit);
    }
    final rows = await query.get();
    return rows.where((r) {
      final urgency = computeUrgency(r);
      return urgency == ReminderUrgency.dueSoon || urgency == ReminderUrgency.overdue;
    }).toList();
  }

  Future<int> countDueOrOverdue({String? petId}) async {
    return (await listDueOrOverdue(petId: petId)).length;
  }

  /// A source record can have more than one linked reminder — nothing in
  /// the schema prevents it, so callers must handle all matches, not just
  /// the first.
  Future<List<Reminder>> findAllBySource(String sourceRecordType, String sourceRecordId) {
    return (db.select(db.reminders)
          ..where((r) =>
              r.sourceRecordType.equals(sourceRecordType) & r.sourceRecordId.equals(sourceRecordId)))
        .get();
  }

  Future<void> update(String reminderId, Map<String, dynamic> fields) async {
    final companion = RemindersCompanion(
      dueDate: fields.containsKey('due_date') ? Value(fields['due_date'] as String) : const Value.absent(),
      status: fields.containsKey('status') ? Value(fields['status'] as String) : const Value.absent(),
      snoozedUntil:
          fields.containsKey('snoozed_until') ? Value(fields['snoozed_until'] as String?) : const Value.absent(),
      sourceRecordType: fields.containsKey('source_record_type')
          ? Value(fields['source_record_type'] as String?)
          : const Value.absent(),
      sourceRecordId: fields.containsKey('source_record_id')
          ? Value(fields['source_record_id'] as String?)
          : const Value.absent(),
      isManuallyOverridden: fields.containsKey('is_manually_overridden')
          ? Value(fields['is_manually_overridden'] as bool)
          : const Value.absent(),
      lastEditedAt: Value(nowIso()),
    );
    await (db.update(db.reminders)..where((r) => r.id.equals(reminderId))).write(companion);
  }

  Future<void> delete(String reminderId) async {
    await (db.delete(db.reminders)..where((r) => r.id.equals(reminderId))).go();
  }
}
