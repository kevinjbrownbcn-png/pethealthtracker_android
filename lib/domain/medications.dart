// Medication schedule computation and dose-logging actions. No desktop
// equivalent yet — medications aren't one of the app's original 12 tables;
// this is a new feature built Android-first (see MODULE_PROGRESS.md).
//
// A medication runs through one or more phases in sequence (phase_order) —
// a plain course is one phase; titration ("2 pills for 3 days, then 1 pill
// for 7 days") is several. Each phase ends either after a fixed number of
// days (time-based) or a fixed number of logged doses (dose-based).
// Completion and "what's the next dose" are both computed from the phase
// list + dose log at query time, never stored — same pattern
// computeUrgency() in reminders_repository.dart uses for reminder status.

import '../data/database.dart';
import '../data/repositories/medications_repository.dart';
import '../data/repositories/reminders_repository.dart';
import 'validation.dart';

class DoseTime {
  final int hour;
  final int minute;
  const DoseTime(this.hour, this.minute);

  static DoseTime parse(String hhmm) {
    final parts = hhmm.split(':');
    return DoseTime(int.parse(parts[0]), int.parse(parts[1]));
  }

  String get formatted => '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
}

List<DoseTime> parseDoseTimes(String? doseTimes) {
  if (doseTimes == null || doseTimes.trim().isEmpty) return const [];
  return doseTimes.split(',').map((t) => DoseTime.parse(t.trim())).toList();
}

DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);
String isoDate(DateTime d) => d.toIso8601String().substring(0, 10);

/// The phase currently in effect, the calendar day it started on (phases
/// run back-to-back — only the medication's own start_date is stored;
/// every later phase's start is derived from where the previous one ended),
/// and how many doses have already been logged against it.
class ActivePhase {
  final MedicationPhase phase;
  final DateTime startedOn;
  final int dosesLoggedInPhase;
  const ActivePhase(this.phase, this.startedOn, this.dosesLoggedInPhase);
}

/// Walks the phase list in order, consuming logged doses against each phase
/// until it finds the one that's still open. Returns null once every phase
/// is complete (the medication is done).
ActivePhase? computeActivePhase(
  DateTime medicationStart,
  List<MedicationPhase> phases,
  List<MedicationDose> doseLog,
) {
  final sorted = [...phases]..sort((a, b) => a.phaseOrder.compareTo(b.phaseOrder));
  var phaseStart = _dateOnly(medicationStart);
  final today = _dateOnly(DateTime.now());

  for (final phase in sorted) {
    final dosesInPhase = doseLog.where((d) => d.phaseId == phase.id).toList()
      ..sort((a, b) => a.givenAt.compareTo(b.givenAt));

    if (phase.durationType == 'dose_based') {
      if (dosesInPhase.length < phase.durationDoseCount!) {
        return ActivePhase(phase, phaseStart, dosesInPhase.length);
      }
      // Phase complete — the next phase starts right after the last dose given.
      phaseStart = _dateOnly(DateTime.parse(dosesInPhase.last.givenAt));
    } else {
      final phaseEnd = phaseStart.add(Duration(days: phase.durationDays!));
      if (today.isBefore(phaseEnd)) {
        return ActivePhase(phase, phaseStart, dosesInPhase.length);
      }
      phaseStart = phaseEnd;
    }
  }
  return null;
}

/// The next scheduled dose datetime within the active phase: the Nth slot
/// in the phase's repeating daily dose-time sequence, where N is how many
/// doses have already been logged in this phase. This is what both drives
/// the reminder and lets a dose-based phase simply stop once N reaches the
/// target, with no separate day-counting needed.
DateTime computeNextDoseDateTime(ActivePhase active) {
  final times = parseDoseTimes(active.phase.doseTimes);
  final perDay = active.phase.timesPerDay;
  final n = active.dosesLoggedInPhase;
  final dayOffset = n ~/ perDay;
  final slotIndex = n % perDay;
  final day = active.startedOn.add(Duration(days: dayOffset));
  final time = times[slotIndex];
  return DateTime(day.year, day.month, day.day, time.hour, time.minute);
}

class MedicationSchedule {
  final ActivePhase? activePhase;
  final DateTime? nextDoseAt;
  final bool isComplete;
  const MedicationSchedule({this.activePhase, this.nextDoseAt, required this.isComplete});
}

MedicationSchedule computeSchedule(
  Medication medication,
  List<MedicationPhase> phases,
  List<MedicationDose> doseLog,
) {
  final active = computeActivePhase(DateTime.parse(medication.startDate), phases, doseLog);
  if (active == null) {
    return const MedicationSchedule(isComplete: true);
  }
  return MedicationSchedule(
    activePhase: active,
    nextDoseAt: computeNextDoseDateTime(active),
    isComplete: false,
  );
}

/// Orchestrates a medication's linked "next dose" reminder — one
/// self-advancing reminder per medication, not one per scheduled dose.
/// Logging a dose recomputes the schedule and brings the reminder in line
/// with it directly (no manual-override-conflict check like
/// ReminderActions.propagateSourceDateChange): the reminder's date is
/// entirely a function of the dose log, so there's nothing meaningful to
/// preserve by refusing to overwrite a hand-edited due date the way there
/// is for a source record's own static date field.
class MedicationActions {
  final MedicationsRepository medsRepo;
  final RemindersRepository remindersRepo;
  MedicationActions(this.medsRepo, this.remindersRepo);

  Future<(String, List<ValidationWarning>)> createMedication(
    Map<String, dynamic> data,
    List<Map<String, dynamic>> phases,
  ) async {
    final (id, warnings) = await medsRepo.create(data, phases);
    await syncReminder(id);
    return (id, warnings);
  }

  Future<void> logDose(String medicationId) async {
    final medication = await medsRepo.get(medicationId);
    if (medication == null) return;
    final phases = await medsRepo.phasesFor(medicationId);
    final doseLog = await medsRepo.dosesFor(medicationId);
    final schedule = computeSchedule(medication, phases, doseLog);
    if (schedule.isComplete || schedule.activePhase == null) return;

    final dueAt = schedule.nextDoseAt!;
    await medsRepo.logDose(medicationId, schedule.activePhase!.phase.id, scheduledFor: dueAt.toIso8601String());
    await syncReminder(medicationId);
  }

  /// Creates the reminder if none exists, updates its due date if the next
  /// dose moved to a different day, or marks the medication completed and
  /// removes the reminder once every phase is done. Called after creating a
  /// medication and after every logged dose.
  Future<void> syncReminder(String medicationId) async {
    final medication = await medsRepo.get(medicationId);
    if (medication == null) return;
    final phases = await medsRepo.phasesFor(medicationId);
    final doseLog = await medsRepo.dosesFor(medicationId);
    final schedule = computeSchedule(medication, phases, doseLog);
    final linked = await remindersRepo.findAllBySource('medication', medicationId);

    if (schedule.isComplete) {
      if (medication.status == 'active') {
        await medsRepo.updateFields(medicationId, {'status': 'completed'});
      }
      for (final r in linked) {
        await remindersRepo.delete(r.id);
      }
      return;
    }

    final dueDate = isoDate(schedule.nextDoseAt!);
    if (linked.isEmpty) {
      await remindersRepo.create({
        'pet_id': medication.petId,
        'title': '${medication.name} dose due',
        'due_date': dueDate,
        'source_record_type': 'medication',
        'source_record_id': medicationId,
      });
    } else {
      for (final r in linked) {
        await remindersRepo.update(r.id, {'due_date': dueDate});
      }
    }
  }

  Future<void> deleteMedication(String medicationId) async {
    final linked = await remindersRepo.findAllBySource('medication', medicationId);
    for (final r in linked) {
      await remindersRepo.delete(r.id);
    }
    await medsRepo.delete(medicationId);
  }

  /// Marking a course stopped early (vs. letting it run to natural
  /// completion) also removes its linked reminder — a stopped medication
  /// has no "next dose" to remind anyone about.
  Future<void> stopMedication(String medicationId) async {
    await medsRepo.updateFields(medicationId, {'status': 'stopped'});
    final linked = await remindersRepo.findAllBySource('medication', medicationId);
    for (final r in linked) {
      await remindersRepo.delete(r.id);
    }
  }
}
