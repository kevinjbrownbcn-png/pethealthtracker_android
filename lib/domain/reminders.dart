// Reminder state machine and source-propagation logic — direct port of
// pethealthapp/core/reminders.py, built on top of the plain CRUD in
// lib/data/repositories/reminders_repository.dart.
//
// This never decides UI flow (which dialog to show); it exposes the actions
// and throws ManualOverrideConflict when the caller needs to ask the user
// before proceeding, so the UI layer owns the actual confirmation — same
// split as the Python source.

import '../data/database.dart';
import '../data/repositories/reminders_repository.dart';

// Table name -> reminder source_record_type string, plus which field on
// that source record is the "date" a linked reminder should track. Mirrors
// core/db.py's REMINDER_SOURCE_TABLES / core/reminders.py's
// SOURCE_DATE_FIELD_BY_TABLE.
const Map<String, String> sourceTypeByTable = {
  'vet_appointments': 'vet_appointment',
  'vaccinations': 'vaccination',
  'procedures_surgeries': 'procedure',
  'hospitalizations': 'hospitalization',
  'illness_custom_events': 'illness_custom_event',
};

const Map<String, String> sourceDateFieldByTable = {
  'vet_appointments': 'date',
  // Vaccination reminders track *next_due_date*, not date_administered —
  // that's literally what "remind me when it's due again" means, per the
  // locked workflow (11_examples_bundle...md Example 5).
  'vaccinations': 'next_due_date',
  'procedures_surgeries': 'date',
  'hospitalizations': 'admission_date',
  'illness_custom_events': 'date',
};

/// Thrown when a source record's date changed but at least one linked
/// reminder's due date was manually edited — the caller must confirm with
/// the user before calling propagateSourceDateChange(..., force: true).
class ManualOverrideConflict implements Exception {
  final List<Reminder> reminders;
  ManualOverrideConflict(this.reminders);

  @override
  String toString() =>
      'One or more linked reminders were manually set; overwrite requires confirmation.';
}

class ReminderActions {
  final RemindersRepository repo;
  ReminderActions(this.repo);

  Future<void> reschedule(String reminderId, String newDueDate) {
    return repo.update(reminderId, {'due_date': newDueDate, 'is_manually_overridden': true});
  }

  Future<void> snooze(String reminderId, String untilDate) {
    return repo.update(reminderId, {'status': 'snoozed', 'snoozed_until': untilDate});
  }

  Future<void> markDone(String reminderId) {
    return repo.update(reminderId, {'status': 'done'});
  }

  Future<void> dismiss(String reminderId) {
    return repo.update(reminderId, {'status': 'dismissed'});
  }

  /// Keeps the reminder, drops its source link — becomes standalone.
  Future<void> detach(String reminderId) {
    return repo.update(reminderId, {'source_record_type': null, 'source_record_id': null});
  }

  Future<void> delete(String reminderId) {
    return repo.delete(reminderId);
  }

  /// Used by edit/delete flows to decide whether a confirmation dialog is
  /// needed at all.
  Future<List<Reminder>> getLinkedReminders(String sourceRecordType, String sourceRecordId) {
    return repo.findAllBySource(sourceRecordType, sourceRecordId);
  }

  /// Called after a source record's relevant date is saved. Updates every
  /// linked reminder's due date to match, unless one was manually
  /// overridden — in which case this throws ManualOverrideConflict (listing
  /// all affected reminders) unless force is true.
  ///
  /// Returns the number of reminders updated (0 if none were linked).
  Future<int> propagateSourceDateChange(
    String sourceRecordType,
    String sourceRecordId,
    String newDate, {
    bool force = false,
  }) async {
    final linked = await repo.findAllBySource(sourceRecordType, sourceRecordId);
    if (linked.isEmpty) return 0;

    final overridden = linked.where((r) => r.isManuallyOverridden).toList();
    if (overridden.isNotEmpty && !force) {
      throw ManualOverrideConflict(overridden);
    }

    for (final reminder in linked) {
      await repo.update(reminder.id, {'due_date': newDate, 'is_manually_overridden': false});
    }
    return linked.length;
  }

  /// Called after a source record is deleted. The caller (the UI's
  /// confirmation dialog) decides deleteReminder vs. detach — this just
  /// executes it for every reminder linked to that source. Never silently
  /// deletes or orphans.
  ///
  /// Returns the number of reminders affected.
  Future<int> handleSourceDeletion(
    String sourceRecordType,
    String sourceRecordId, {
    required bool deleteReminder,
  }) async {
    final linked = await repo.findAllBySource(sourceRecordType, sourceRecordId);
    for (final reminder in linked) {
      if (deleteReminder) {
        await delete(reminder.id);
      } else {
        await detach(reminder.id);
      }
    }
    return linked.length;
  }

  /// Default suggestion (one year out) for the recurrence-confirmation dialog.
  static String suggestNextDueDate(String currentDueDate) {
    final d = DateTime.parse(currentDueDate);
    return DateTime(d.year + 1, d.month, d.day).toIso8601String().substring(0, 10);
  }
}
