// Hard-block and soft-warning validation rules.
//
// Direct port of pethealthapp/core/validation.py — same rules, same field
// names (kept as the schema's snake_case, not camelCase, so this stays
// diffable against the Python source it's ported from). Hard blocks throw
// ValidationError and must stop a save; soft warnings are returned as a list
// the caller shows and lets the user override — they never block a save on
// their own.
//
// Duplicate-check functions (check_duplicate_pet_name etc.) need database
// access and live in validation_db.dart instead, once the generated
// AppDatabase exists.

class ValidationError implements Exception {
  final String field;
  final String message;
  ValidationError(this.field, this.message);

  @override
  String toString() => message;
}

class ValidationWarning {
  final String field;
  final String message;
  const ValidationWarning(this.field, this.message);
}

/// Required fields per entity — mirrors core/validation.py's REQUIRED_FIELDS.
const Map<String, List<String>> requiredFields = {
  'pets': ['name', 'species'],
  'people': ['name'],
  'vet_appointments': ['pet_id', 'date', 'reason'],
  'vaccinations': ['pet_id', 'vaccine_name', 'date_administered'],
  'illness_custom_events': ['pet_id', 'title', 'date'],
  'procedures_surgeries': ['pet_id', 'procedure_name', 'date'],
  'hospitalizations': ['pet_id', 'admission_date', 'reason'],
  'microchip_records': ['pet_id', 'chip_number'],
  'reminders': ['pet_id', 'title', 'due_date'],
  'attachments': ['pet_id', 'file_name', 'file_path', 'file_type'],
  'notes': ['pet_id', 'text'],
  'medications': ['pet_id', 'name', 'medication_type', 'start_date'],
  'medication_phases': ['dose_amount', 'times_per_day', 'dose_times', 'duration_type'],
};

const Set<String> supportedAttachmentTypes = {
  'image/jpeg',
  'image/png',
  'application/pdf',
};
const int maxAttachmentSizeBytes = 20 * 1024 * 1024; // soft-warning threshold, not a hard cap

DateTime _today() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
}

DateTime _parseDate(String isoDate) => DateTime.parse(isoDate);

String _titleCase(String fieldName) => fieldName
    .split('_')
    .map((word) => word.isEmpty ? word : word[0].toUpperCase() + word.substring(1))
    .join(' ');

/// Hard block: throws on the first missing/empty required field.
void validateRequired(String entityType, Map<String, dynamic> data) {
  for (final field in requiredFields[entityType] ?? const <String>[]) {
    final value = data[field];
    final isEmptyString = value is String && value.trim().isEmpty;
    if (value == null || isEmptyString) {
      throw ValidationError(field, '${_titleCase(field)} is required.');
    }
  }
}

/// Hard block: DOB in the future. Duplicate-name check lives in validation_db.dart.
List<ValidationWarning> validatePet(Map<String, dynamic> data) {
  validateRequired('pets', data);

  final dob = data['date_of_birth'] as String?;
  if (dob != null && _parseDate(dob).isAfter(_today())) {
    throw ValidationError('date_of_birth', 'Date of birth cannot be in the future.');
  }

  if (dob != null && data['approximate_age_value'] != null) {
    throw ValidationError(
      'approximate_age_value',
      'Enter either a date of birth or an approximate age, not both.',
    );
  }

  return const [];
}

/// Hard blocks: future administration date, due-before-administered (also DB-enforced).
List<ValidationWarning> validateVaccination(Map<String, dynamic> data) {
  validateRequired('vaccinations', data);
  final warnings = <ValidationWarning>[];

  final administered = _parseDate(data['date_administered'] as String);
  if (administered.isAfter(_today())) {
    throw ValidationError('date_administered', 'Date administered cannot be in the future.');
  }

  final nextDue = data['next_due_date'] as String?;
  if (nextDue != null) {
    final nextDueDate = _parseDate(nextDue);
    if (nextDueDate.isBefore(administered)) {
      throw ValidationError(
        'next_due_date',
        'Due date cannot be earlier than administration date.',
      );
    }
    final daysOut = nextDueDate.difference(administered).inDays;
    if (daysOut < 7) {
      warnings.add(const ValidationWarning(
        'next_due_date',
        'This due date is unusually soon for a vaccine — please confirm.',
      ));
    } else if (daysOut > 5 * 365) {
      warnings.add(const ValidationWarning(
        'next_due_date',
        'This due date is unusually far out for a vaccine — please confirm.',
      ));
    }
  }

  return warnings;
}

/// Hard block: discharge before admission (also DB-enforced via CHECK).
List<ValidationWarning> validateHospitalization(Map<String, dynamic> data) {
  validateRequired('hospitalizations', data);

  final admission = _parseDate(data['admission_date'] as String);
  final discharge = data['discharge_date'] as String?;
  if (discharge != null && _parseDate(discharge).isBefore(admission)) {
    throw ValidationError('discharge_date', 'Discharge date cannot be earlier than admission date.');
  }

  return const [];
}

List<ValidationWarning> validateIllnessCustomEvent(Map<String, dynamic> data) {
  validateRequired('illness_custom_events', data);
  final warnings = <ValidationWarning>[];

  final eventDate = _parseDate(data['date'] as String);
  if (eventDate.isAfter(_today())) {
    warnings.add(const ValidationWarning('date', 'This date is in the future — is that correct?'));
  }

  return warnings;
}

List<ValidationWarning> validateReminder(Map<String, dynamic> data, {String? sourceDate}) {
  validateRequired('reminders', data);
  final warnings = <ValidationWarning>[];

  final dueDate = _parseDate(data['due_date'] as String);
  if (dueDate.isBefore(_today())) {
    warnings.add(const ValidationWarning(
      'due_date',
      'Due date is in the past — consider marking it done instead.',
    ));
  }

  if (sourceDate != null && dueDate.isBefore(_parseDate(sourceDate))) {
    warnings.add(const ValidationWarning('due_date', "Due date is earlier than its source record's date."));
  }

  return warnings;
}

/// Hard block: none beyond required fields — a medication's start_date can
/// legitimately be in the past (recording an already-started course) or the
/// future (a planned one).
List<ValidationWarning> validateMedication(Map<String, dynamic> data) {
  validateRequired('medications', data);
  return const [];
}

/// Hard blocks: times_per_day must be a positive count, dose_times must list
/// exactly that many "HH:MM" entries, and exactly one of duration_days /
/// duration_dose_count must be set, matching duration_type — mirrors the
/// same mutual-exclusivity shape as validatePet's DOB/approximate-age check,
/// enforced here (not just the DB CHECK) so the form shows a clear message
/// instead of a raw SQLite error.
List<ValidationWarning> validateMedicationPhase(Map<String, dynamic> data) {
  validateRequired('medication_phases', data);

  final timesPerDay = data['times_per_day'] as int;
  if (timesPerDay < 1) {
    throw ValidationError('times_per_day', 'Times per day must be at least 1.');
  }

  final doseTimes = (data['dose_times'] as String).split(',').map((t) => t.trim()).where((t) => t.isNotEmpty).toList();
  if (doseTimes.length != timesPerDay) {
    throw ValidationError(
      'dose_times',
      'Enter exactly $timesPerDay dose time(s) (got ${doseTimes.length}).',
    );
  }

  final durationType = data['duration_type'] as String;
  final durationDays = data['duration_days'] as int?;
  final durationDoseCount = data['duration_dose_count'] as int?;
  if (durationType == 'time_based') {
    if (durationDays == null || durationDays < 1) {
      throw ValidationError('duration_days', 'Enter the number of days this dose runs for.');
    }
    if (durationDoseCount != null) {
      throw ValidationError('duration_dose_count', 'A time-based phase should not also set a dose count.');
    }
  } else if (durationType == 'dose_based') {
    if (durationDoseCount == null || durationDoseCount < 1) {
      throw ValidationError('duration_dose_count', 'Enter the total number of doses for this phase.');
    }
    if (durationDays != null) {
      throw ValidationError('duration_days', 'A dose-based phase should not also set a day count.');
    }
  } else {
    throw ValidationError('duration_type', 'Duration type must be "time_based" or "dose_based".');
  }

  return const [];
}

List<ValidationWarning> validateAttachment({
  required String fileName,
  required String fileType,
  required int fileSizeBytes,
}) {
  validateRequired('attachments', {
    'file_name': fileName,
    'file_path': 'placeholder',
    'file_type': fileType,
    'pet_id': 'placeholder',
  });
  final warnings = <ValidationWarning>[];

  if (!supportedAttachmentTypes.contains(fileType)) {
    warnings.add(const ValidationWarning(
      'file_type',
      "This file type isn't one of the supported types (JPEG, PNG, PDF).",
    ));
  }
  if (fileSizeBytes > maxAttachmentSizeBytes) {
    warnings.add(const ValidationWarning('file_name', 'This file is unusually large.'));
  }

  return warnings;
}
