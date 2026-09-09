// Verifies the validation.dart port against the same cases documented in
// pethealthapp's own examples bundle (11_examples_bundle...md, Example 7)
// and core/validation.py's docstrings, so this is checked against the
// actual locked rules, not just "does it run."

import 'package:flutter_test/flutter_test.dart';
import 'package:petsalud/domain/validation.dart';

void main() {
  group('validatePet', () {
    test('throws on missing required field', () {
      expect(
        () => validatePet({'species': 'dog'}), // no name
        throwsA(isA<ValidationError>()),
      );
    });

    test('throws on future date of birth', () {
      expect(
        () => validatePet({'name': 'Fido', 'species': 'dog', 'date_of_birth': '2099-01-01'}),
        throwsA(isA<ValidationError>()),
      );
    });

    test('throws when both DOB and approximate age are set', () {
      expect(
        () => validatePet({
          'name': 'Fido',
          'species': 'dog',
          'date_of_birth': '2020-01-01',
          'approximate_age_value': 3,
        }),
        throwsA(isA<ValidationError>()),
      );
    });

    test('accepts valid data with no warnings', () {
      expect(validatePet({'name': 'Fido', 'species': 'dog'}), isEmpty);
    });
  });

  group('validateVaccination', () {
    test('hard block: due date before administration date', () {
      expect(
        () => validateVaccination({
          'pet_id': 'p1',
          'vaccine_name': 'Rabies',
          'date_administered': '2026-06-01',
          'next_due_date': '2026-01-01',
        }),
        throwsA(isA<ValidationError>()),
      );
    });

    test('exact error message matches the locked example', () {
      try {
        validateVaccination({
          'pet_id': 'p1',
          'vaccine_name': 'Rabies',
          'date_administered': '2026-06-01',
          'next_due_date': '2026-01-01',
        });
        fail('expected ValidationError');
      } on ValidationError catch (e) {
        // Per Example 7 in 11_examples_bundle_pet_health_tracker.md.
        expect(e.message, 'Due date cannot be earlier than administration date.');
      }
    });

    test('soft warning: due date unusually soon (not a block)', () {
      final warnings = validateVaccination({
        'pet_id': 'p1',
        'vaccine_name': 'Rabies',
        'date_administered': '2026-06-01',
        'next_due_date': '2026-06-03',
      });
      expect(warnings, hasLength(1));
      expect(warnings.first.field, 'next_due_date');
    });

    test('no warnings for a normal one-year booster', () {
      final warnings = validateVaccination({
        'pet_id': 'p1',
        'vaccine_name': 'Rabies',
        'date_administered': '2026-01-01',
        'next_due_date': '2027-01-01',
      });
      expect(warnings, isEmpty);
    });
  });

  group('validateHospitalization', () {
    test('hard block: discharge before admission', () {
      expect(
        () => validateHospitalization({
          'pet_id': 'p1',
          'admission_date': '2026-06-10',
          'reason': 'Surgery recovery',
          'discharge_date': '2026-06-01',
        }),
        throwsA(isA<ValidationError>()),
      );
    });
  });

  group('validateReminder', () {
    test('warns (does not block) on a past due date', () {
      final warnings = validateReminder({
        'pet_id': 'p1',
        'title': 'Booster',
        'due_date': '2020-01-01',
      });
      expect(warnings, isNotEmpty);
    });
  });

  group('validateAttachment', () {
    test('warns on unsupported file type, still returns (no throw)', () {
      final warnings = validateAttachment(
        fileName: 'notes.txt',
        fileType: 'text/plain',
        fileSizeBytes: 1024,
      );
      expect(warnings, isNotEmpty);
    });

    test('no warnings for a normal PDF under the size threshold', () {
      final warnings = validateAttachment(
        fileName: 'report.pdf',
        fileType: 'application/pdf',
        fileSizeBytes: 1024,
      );
      expect(warnings, isEmpty);
    });
  });
}
