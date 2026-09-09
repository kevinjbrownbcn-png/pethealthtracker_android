// Aggregates every event-type record for a pet (or across all pets) into one
// chronological, consistently-labeled list — direct port of
// pethealthapp/core/timeline.py. The "weak timeline logic" guardrail from
// planning requires a single ordered view with clear type badges, not
// unrelated items mixed together without labels.

import '../data/database.dart';
import '../data/repositories/hospitalizations_repository.dart';
import '../data/repositories/illness_custom_events_repository.dart';
import '../data/repositories/notes_repository.dart';
import '../data/repositories/people_repository.dart';
import '../data/repositories/procedures_surgeries_repository.dart';
import '../data/repositories/vaccinations_repository.dart';
import '../data/repositories/vet_appointments_repository.dart';

class TimelineEntry {
  final String type; // vet_appointment | vaccination | illness_custom_event | procedure | hospitalization | note
  final String id;
  final String petId;
  final String date;
  final String title;
  final bool ongoing;
  final String? handledBy;
  final String? handledByPersonId;

  TimelineEntry({
    required this.type,
    required this.id,
    required this.petId,
    required this.date,
    required this.title,
    required this.ongoing,
    required this.handledBy,
    required this.handledByPersonId,
  });
}

const List<String> allTimelineEventTypes = [
  'vet_appointment',
  'vaccination',
  'illness_custom_event',
  'procedure',
  'hospitalization',
  'note',
];

class TimelineService {
  final AppDatabase db;
  TimelineService(this.db);

  Future<List<TimelineEntry>> getTimelineForPet(
    String petId, {
    List<String>? eventTypes,
    String? searchText,
    String? dateFrom,
    String? dateTo,
    String? handledByPersonId,
  }) async {
    final typesToInclude = eventTypes ?? allTimelineEventTypes;
    final peopleById = {for (final p in await PeopleRepository(db).listActive()) p.id: p.name};

    var entries = <TimelineEntry>[];

    if (typesToInclude.contains('vet_appointment')) {
      for (final r in await VetAppointmentsRepository(db).listForPet(petId)) {
        entries.add(TimelineEntry(
          type: 'vet_appointment',
          id: r.id,
          petId: r.petId,
          date: r.date,
          title: r.reason,
          ongoing: false,
          handledBy: peopleById[r.handledByPersonId],
          handledByPersonId: r.handledByPersonId,
        ));
      }
    }
    if (typesToInclude.contains('vaccination')) {
      for (final r in await VaccinationsRepository(db).listForPet(petId)) {
        entries.add(TimelineEntry(
          type: 'vaccination',
          id: r.id,
          petId: r.petId,
          date: r.dateAdministered,
          title: 'Vaccination: ${r.vaccineName}',
          ongoing: false,
          handledBy: peopleById[r.handledByPersonId],
          handledByPersonId: r.handledByPersonId,
        ));
      }
    }
    if (typesToInclude.contains('illness_custom_event')) {
      for (final r in await IllnessCustomEventsRepository(db).listForPet(petId)) {
        entries.add(TimelineEntry(
          type: 'illness_custom_event',
          id: r.id,
          petId: r.petId,
          date: r.date,
          title: r.title,
          ongoing: false,
          handledBy: peopleById[r.handledByPersonId],
          handledByPersonId: r.handledByPersonId,
        ));
      }
    }
    if (typesToInclude.contains('procedure')) {
      for (final r in await ProceduresSurgeriesRepository(db).listForPet(petId)) {
        entries.add(TimelineEntry(
          type: 'procedure',
          id: r.id,
          petId: r.petId,
          date: r.date,
          title: 'Procedure: ${r.procedureName}',
          ongoing: false,
          handledBy: peopleById[r.handledByPersonId],
          handledByPersonId: r.handledByPersonId,
        ));
      }
    }
    if (typesToInclude.contains('hospitalization')) {
      for (final r in await HospitalizationsRepository(db).listForPet(petId)) {
        entries.add(TimelineEntry(
          type: 'hospitalization',
          id: r.id,
          petId: r.petId,
          date: r.admissionDate,
          title: 'Hospitalization: ${r.reason}',
          ongoing: r.dischargeDate == null,
          handledBy: peopleById[r.handledByPersonId],
          handledByPersonId: r.handledByPersonId,
        ));
      }
    }
    if (typesToInclude.contains('note')) {
      for (final r in await NotesRepository(db).listForPet(petId)) {
        entries.add(TimelineEntry(
          type: 'note',
          id: r.id,
          petId: r.petId,
          date: r.date,
          title: r.noteText.length > 80 ? r.noteText.substring(0, 80) : r.noteText,
          ongoing: false,
          handledBy: peopleById[r.handledByPersonId],
          handledByPersonId: r.handledByPersonId,
        ));
      }
    }

    if (searchText != null && searchText.isNotEmpty) {
      final needle = searchText.toLowerCase();
      entries = entries.where((e) => e.title.toLowerCase().contains(needle)).toList();
    }
    if (dateFrom != null) {
      entries = entries.where((e) => e.date.compareTo(dateFrom) >= 0).toList();
    }
    if (dateTo != null) {
      entries = entries.where((e) => e.date.compareTo(dateTo) <= 0).toList();
    }
    if (handledByPersonId != null) {
      entries = entries.where((e) => e.handledByPersonId == handledByPersonId).toList();
    }

    entries.sort((a, b) => b.date.compareTo(a.date));
    return entries;
  }

  Future<List<TimelineEntry>> getGlobalTimeline({
    List<String>? petIds,
    List<String>? eventTypes,
    String? searchText,
    String? dateFrom,
    String? dateTo,
    String? handledByPersonId,
  }) async {
    final ids = petIds ?? (await db.select(db.pets).get()).map((p) => p.id).toList();

    final entries = <TimelineEntry>[];
    for (final petId in ids) {
      entries.addAll(await getTimelineForPet(
        petId,
        eventTypes: eventTypes,
        searchText: searchText,
        dateFrom: dateFrom,
        dateTo: dateTo,
        handledByPersonId: handledByPersonId,
      ));
    }
    entries.sort((a, b) => b.date.compareTo(a.date));
    return entries;
  }
}
