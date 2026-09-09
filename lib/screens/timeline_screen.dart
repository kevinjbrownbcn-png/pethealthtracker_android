// Timeline tab: a cross-pet chronological view of every event-type record,
// with the same search/type/date-range/handled-by filters as the desktop
// Timeline page (pethealthapp/web/pages/timeline.py) — parity gap #5.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/timeline.dart';
import '../providers/database_providers.dart';
import 'pets_screen.dart';

class TimelineFilters {
  final String? petId; // null = all pets
  final String? eventType; // null = all types
  final String searchText;
  final String? dateFrom;
  final String? dateTo;
  final String? handledByPersonId; // null = anyone

  const TimelineFilters({
    this.petId,
    this.eventType,
    this.searchText = '',
    this.dateFrom,
    this.dateTo,
    this.handledByPersonId,
  });
}

// See providers/database_providers.dart's DataVersionNotifier comment for
// why this is a plain Notifier rather than the now-legacy StateProvider.
class _TimelineFiltersNotifier extends Notifier<TimelineFilters> {
  @override
  TimelineFilters build() => const TimelineFilters();

  void setPet(String? petId) => state = TimelineFilters(
        petId: petId,
        eventType: state.eventType,
        searchText: state.searchText,
        dateFrom: state.dateFrom,
        dateTo: state.dateTo,
        handledByPersonId: state.handledByPersonId,
      );

  void setEventType(String? eventType) => state = TimelineFilters(
        petId: state.petId,
        eventType: eventType,
        searchText: state.searchText,
        dateFrom: state.dateFrom,
        dateTo: state.dateTo,
        handledByPersonId: state.handledByPersonId,
      );

  void setSearchText(String searchText) => state = TimelineFilters(
        petId: state.petId,
        eventType: state.eventType,
        searchText: searchText,
        dateFrom: state.dateFrom,
        dateTo: state.dateTo,
        handledByPersonId: state.handledByPersonId,
      );

  void setDateFrom(String? dateFrom) => state = TimelineFilters(
        petId: state.petId,
        eventType: state.eventType,
        searchText: state.searchText,
        dateFrom: dateFrom,
        dateTo: state.dateTo,
        handledByPersonId: state.handledByPersonId,
      );

  void setDateTo(String? dateTo) => state = TimelineFilters(
        petId: state.petId,
        eventType: state.eventType,
        searchText: state.searchText,
        dateFrom: state.dateFrom,
        dateTo: dateTo,
        handledByPersonId: state.handledByPersonId,
      );

  void setHandledBy(String? personId) => state = TimelineFilters(
        petId: state.petId,
        eventType: state.eventType,
        searchText: state.searchText,
        dateFrom: state.dateFrom,
        dateTo: state.dateTo,
        handledByPersonId: personId,
      );
}

final _timelineFiltersProvider =
    NotifierProvider<_TimelineFiltersNotifier, TimelineFilters>(_TimelineFiltersNotifier.new);

final _activePeopleProvider = FutureProvider((ref) async {
  ref.watch(dataVersionProvider);
  return ref.read(peopleRepositoryProvider).listActive();
});

final _timelineEntriesProvider = FutureProvider<List<TimelineEntry>>((ref) async {
  ref.watch(dataVersionProvider);
  final filters = ref.watch(_timelineFiltersProvider);
  final db = ref.read(appDatabaseProvider);
  return TimelineService(db).getGlobalTimeline(
    petIds: filters.petId == null ? null : [filters.petId!],
    eventTypes: filters.eventType == null ? null : [filters.eventType!],
    searchText: filters.searchText.isEmpty ? null : filters.searchText,
    dateFrom: filters.dateFrom,
    dateTo: filters.dateTo,
    handledByPersonId: filters.handledByPersonId,
  );
});

// Matches pethealthapp/web/components/timeline_entry.py's BADGE_LABELS.
const _typeLabels = {
  'vet_appointment': 'Vet visit',
  'vaccination': 'Vaccination',
  'illness_custom_event': 'Illness / event',
  'procedure': 'Procedure',
  'hospitalization': 'Hospitalization',
  'note': 'Note',
};

class TimelineScreen extends ConsumerWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final petsAsync = ref.watch(petsListProvider);
    final peopleAsync = ref.watch(_activePeopleProvider);
    final filters = ref.watch(_timelineFiltersProvider);
    final filtersNotifier = ref.read(_timelineFiltersProvider.notifier);

    return petsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Could not load pets: $e')),
      data: (pets) {
        if (pets.isEmpty) {
          return const Center(child: Text('Add a pet first to see their timeline.'));
        }
        final petNameById = {for (final p in pets) p.id: p.name};

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String?>(
                      key: const Key('timelinePetDropdown'),
                      initialValue: filters.petId,
                      decoration: const InputDecoration(labelText: 'Pet'),
                      items: [
                        const DropdownMenuItem<String?>(value: null, child: Text('All pets')),
                        ...pets.map((p) => DropdownMenuItem<String?>(value: p.id, child: Text(p.name))),
                      ],
                      onChanged: filtersNotifier.setPet,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<String?>(
                      key: const Key('timelineTypeDropdown'),
                      initialValue: filters.eventType,
                      decoration: const InputDecoration(labelText: 'Type'),
                      items: [
                        const DropdownMenuItem<String?>(value: null, child: Text('All types')),
                        ...allTimelineEventTypes.map(
                          (t) => DropdownMenuItem<String?>(value: t, child: Text(_typeLabels[t] ?? t)),
                        ),
                      ],
                      onChanged: filtersNotifier.setEventType,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: TextField(
                key: const Key('timelineSearchField'),
                decoration: const InputDecoration(labelText: 'Search', hintText: 'Search titles...'),
                onChanged: filtersNotifier.setSearchText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Row(
                children: [
                  Expanded(
                    child: _FilterDateField(
                      dateKey: const Key('timelineDateFromField'),
                      clearKey: const Key('timelineDateFromClear'),
                      label: 'From',
                      value: filters.dateFrom,
                      onChanged: filtersNotifier.setDateFrom,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _FilterDateField(
                      dateKey: const Key('timelineDateToField'),
                      clearKey: const Key('timelineDateToClear'),
                      label: 'To',
                      value: filters.dateTo,
                      onChanged: filtersNotifier.setDateTo,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: peopleAsync.when(
                loading: () => const LinearProgressIndicator(),
                error: (e, _) => Text('Could not load people: $e'),
                data: (people) => DropdownButtonFormField<String?>(
                  key: const Key('timelineHandledByDropdown'),
                  initialValue: filters.handledByPersonId,
                  decoration: const InputDecoration(labelText: 'Handled by'),
                  items: [
                    const DropdownMenuItem<String?>(value: null, child: Text('Anyone')),
                    ...people.map((p) => DropdownMenuItem<String?>(value: p.id, child: Text(p.name))),
                  ],
                  onChanged: filtersNotifier.setHandledBy,
                ),
              ),
            ),
            const Divider(height: 24),
            Expanded(
              child: ref.watch(_timelineEntriesProvider).when(
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Center(child: Text('Failed to load timeline: $e')),
                    data: (entries) {
                      if (entries.isEmpty) {
                        return const Center(child: Text('No matching records. Try adjusting the filters.'));
                      }
                      return ListView.builder(
                        itemCount: entries.length,
                        itemBuilder: (context, i) {
                          final entry = entries[i];
                          return Card(
                            key: Key('timeline_${entry.type}_${entry.id}'),
                            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            child: ListTile(
                              title: Text(entry.title),
                              subtitle: Text([
                                entry.date,
                                _typeLabels[entry.type] ?? entry.type,
                                if (filters.petId == null) petNameById[entry.petId] ?? '',
                                if (entry.ongoing) 'ongoing',
                                if (entry.handledBy != null) 'handled by ${entry.handledBy}',
                              ].where((s) => s.isNotEmpty).join(' · ')),
                            ),
                          );
                        },
                      );
                    },
                  ),
            ),
          ],
        );
      },
    );
  }
}

// A date filter control that, unlike widgets/date_field.dart's DateField,
// supports being cleared back to "no filter" rather than always holding a
// date — desktop's From/To filters default to empty (st.date_input(value: None)).
class _FilterDateField extends StatelessWidget {
  final Key dateKey;
  final Key clearKey;
  final String label;
  final String? value;
  final ValueChanged<String?> onChanged;

  const _FilterDateField({
    required this.dateKey,
    required this.clearKey,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  Future<void> _pickDate(BuildContext context) async {
    final initial = value != null ? DateTime.tryParse(value!) ?? DateTime.now() : DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1990),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      onChanged(picked.toIso8601String().substring(0, 10));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: dateKey,
      onTap: () => _pickDate(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: value == null
              ? const Icon(Icons.calendar_today)
              : IconButton(
                  key: clearKey,
                  icon: const Icon(Icons.clear),
                  onPressed: () => onChanged(null),
                ),
        ),
        child: Text(value ?? 'Any'),
      ),
    );
  }
}
