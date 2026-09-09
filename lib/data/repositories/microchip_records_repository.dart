// Microchip/ID record repository. Direct port of core/repositories/microchip_records.py.

import 'package:drift/drift.dart';

import '../../domain/validation.dart';
import '../database.dart';
import 'repository_utils.dart';

class MicrochipRecordsRepository {
  final AppDatabase db;
  MicrochipRecordsRepository(this.db);

  Future<List<ValidationWarning>> checkDuplicateChipNumber(
    String petId,
    String chipNumber, {
    String? excludeId,
  }) async {
    final query = db.select(db.microchipRecords).join([
      innerJoin(db.pets, db.pets.id.equalsExp(db.microchipRecords.petId)),
    ])
      ..where(db.microchipRecords.chipNumber.equals(chipNumber));
    if (excludeId != null) {
      query.where(db.microchipRecords.id.equals(excludeId).not());
    }
    final match = await query.getSingleOrNull();
    if (match != null) {
      final ownerName = match.readTable(db.pets).name;
      return [
        ValidationWarning(
          'chip_number',
          'This chip number is already recorded for "$ownerName" — please check for a typo.',
        )
      ];
    }
    return const [];
  }

  Future<List<ValidationWarning>> check(Map<String, dynamic> data, {String? excludeId}) async {
    validateRequired('microchip_records', data);
    return checkDuplicateChipNumber(data['pet_id'] as String, data['chip_number'] as String, excludeId: excludeId);
  }

  Future<(String, List<ValidationWarning>)> create(Map<String, dynamic> data) async {
    final warnings = await check(data);
    final id = newId();
    final timestamp = nowIso();
    await db.into(db.microchipRecords).insert(MicrochipRecordsCompanion.insert(
          id: id,
          petId: data['pet_id'] as String,
          chipNumber: data['chip_number'] as String,
          registryProvider: Value(data['registry_provider'] as String?),
          dateImplanted: Value(data['date_implanted'] as String?),
          notes: Value(data['notes'] as String?),
          createdAt: timestamp,
          lastEditedAt: timestamp,
        ));
    return (id, warnings);
  }

  Future<MicrochipRecord?> get(String recordId) {
    return (db.select(db.microchipRecords)..where((m) => m.id.equals(recordId))).getSingleOrNull();
  }

  Future<List<MicrochipRecord>> listForPet(String petId) {
    return (db.select(db.microchipRecords)
          ..where((m) => m.petId.equals(petId))
          ..orderBy([(m) => OrderingTerm.asc(m.createdAt)]))
        .get();
  }

  Future<List<ValidationWarning>> update(String recordId, Map<String, dynamic> data) async {
    var warnings = <ValidationWarning>[];
    if (data.containsKey('chip_number')) {
      final existing = await get(recordId);
      if (existing == null) throw StateError('Microchip record $recordId not found');
      warnings = await check({'pet_id': existing.petId, ...data}, excludeId: recordId);
    }

    final companion = MicrochipRecordsCompanion(
      chipNumber: data.containsKey('chip_number') ? Value(data['chip_number'] as String) : const Value.absent(),
      registryProvider:
          data.containsKey('registry_provider') ? Value(data['registry_provider'] as String?) : const Value.absent(),
      dateImplanted: data.containsKey('date_implanted') ? Value(data['date_implanted'] as String?) : const Value.absent(),
      notes: data.containsKey('notes') ? Value(data['notes'] as String?) : const Value.absent(),
      lastEditedAt: Value(nowIso()),
    );
    await (db.update(db.microchipRecords)..where((m) => m.id.equals(recordId))).write(companion);
    return warnings;
  }

  Future<void> delete(String recordId) async {
    await (db.delete(db.microchipRecords)..where((m) => m.id.equals(recordId))).go();
  }
}
