// Attachment repository. First-class records — linked to a pet, and
// optionally to one specific event record. Deleting the linked record must
// prompt what happens to its attachments; this module never cascade-deletes
// silently. Direct port of core/repositories/attachments.py.

import 'package:drift/drift.dart';

import '../../domain/validation.dart';
import '../database.dart';
import 'repository_utils.dart';

class AttachmentsRepository {
  final AppDatabase db;
  AttachmentsRepository(this.db);

  List<ValidationWarning> check(Map<String, dynamic> data, int fileSizeBytes) {
    return validateAttachment(
      fileName: data['file_name'] as String,
      fileType: data['file_type'] as String,
      fileSizeBytes: fileSizeBytes,
    );
  }

  Future<(String, List<ValidationWarning>)> create(Map<String, dynamic> data, int fileSizeBytes) async {
    final warnings = check(data, fileSizeBytes);
    final id = newId();
    await db.into(db.attachments).insert(AttachmentsCompanion.insert(
          id: id,
          petId: data['pet_id'] as String,
          fileName: data['file_name'] as String,
          filePath: data['file_path'] as String,
          fileType: data['file_type'] as String,
          linkedRecordType: Value(data['linked_record_type'] as String?),
          linkedRecordId: Value(data['linked_record_id'] as String?),
          description: Value(data['description'] as String?),
          uploadedAt: nowIso(),
        ));
    return (id, warnings);
  }

  Future<Attachment?> get(String attachmentId) {
    return (db.select(db.attachments)..where((a) => a.id.equals(attachmentId))).getSingleOrNull();
  }

  Future<List<Attachment>> listForPet(String petId) {
    return (db.select(db.attachments)
          ..where((a) => a.petId.equals(petId))
          ..orderBy([(a) => OrderingTerm.asc(a.uploadedAt)]))
        .get();
  }

  Future<List<Attachment>> listForRecord(String recordType, String recordId) {
    return (db.select(db.attachments)
          ..where((a) => a.linkedRecordType.equals(recordType) & a.linkedRecordId.equals(recordId))
          ..orderBy([(a) => OrderingTerm.asc(a.uploadedAt)]))
        .get();
  }

  Future<void> delete(String attachmentId) async {
    await (db.delete(db.attachments)..where((a) => a.id.equals(attachmentId))).go();
  }
}
