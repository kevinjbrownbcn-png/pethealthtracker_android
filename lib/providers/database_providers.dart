// Riverpod wiring for the database and every repository. One AppDatabase
// per app run (kept alive), repositories are thin and cheap so they're
// recreated per read rather than cached separately.

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';
import '../data/repositories/app_settings_repository.dart';
import '../data/repositories/attachments_repository.dart';
import '../data/repositories/hospitalizations_repository.dart';
import '../data/repositories/illness_custom_events_repository.dart';
import '../data/repositories/medications_repository.dart';
import '../data/repositories/microchip_records_repository.dart';
import '../data/repositories/notes_repository.dart';
import '../data/repositories/people_repository.dart';
import '../data/repositories/pets_repository.dart';
import '../data/repositories/procedures_surgeries_repository.dart';
import '../data/repositories/reminders_repository.dart';
import '../data/repositories/vaccinations_repository.dart';
import '../data/repositories/vet_appointments_repository.dart';

/// Overridden in tests / at app startup with the real opened database
/// (see AppDatabase.open in lib/data/database.dart). Deliberately has no
/// default here — a screen reading this before it's provided is a wiring
/// bug that should fail loudly, not silently fall back to some throwaway db.
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  throw UnimplementedError('appDatabaseProvider must be overridden at app startup');
});

final petsRepositoryProvider = Provider((ref) => PetsRepository(ref.watch(appDatabaseProvider)));
final peopleRepositoryProvider = Provider((ref) => PeopleRepository(ref.watch(appDatabaseProvider)));
final vetAppointmentsRepositoryProvider =
    Provider((ref) => VetAppointmentsRepository(ref.watch(appDatabaseProvider)));
final hospitalizationsRepositoryProvider =
    Provider((ref) => HospitalizationsRepository(ref.watch(appDatabaseProvider)));
final proceduresSurgeriesRepositoryProvider =
    Provider((ref) => ProceduresSurgeriesRepository(ref.watch(appDatabaseProvider)));
final illnessCustomEventsRepositoryProvider =
    Provider((ref) => IllnessCustomEventsRepository(ref.watch(appDatabaseProvider)));
final vaccinationsRepositoryProvider = Provider((ref) => VaccinationsRepository(ref.watch(appDatabaseProvider)));
final microchipRecordsRepositoryProvider =
    Provider((ref) => MicrochipRecordsRepository(ref.watch(appDatabaseProvider)));
final medicationsRepositoryProvider = Provider((ref) => MedicationsRepository(ref.watch(appDatabaseProvider)));
final remindersRepositoryProvider = Provider((ref) => RemindersRepository(ref.watch(appDatabaseProvider)));
final attachmentsRepositoryProvider = Provider((ref) => AttachmentsRepository(ref.watch(appDatabaseProvider)));
final notesRepositoryProvider = Provider((ref) => NotesRepository(ref.watch(appDatabaseProvider)));
final appSettingsRepositoryProvider = Provider((ref) => AppSettingsRepository(ref.watch(appDatabaseProvider)));

/// Bumped after any write so screens watching list providers refetch.
/// Simple invalidation signal rather than per-table streams — this app's
/// scale doesn't need drift's reactive query streams yet, and a single
/// shared "something changed" tick keeps every screen's refresh logic
/// identical and easy to reason about.
///
/// Riverpod 3.x moved StateProvider to a "legacy" import; using a plain
/// Notifier instead so this doesn't depend on an API the framework itself
/// is steering people away from. `ref.read(dataVersionProvider.notifier)
/// .state++` still works the same way Notifier.state is a public setter.
class DataVersionNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void bump() => state++;
}

final dataVersionProvider = NotifierProvider<DataVersionNotifier, int>(DataVersionNotifier.new);
