// Shared helpers used by every entity repository — id/timestamp generation
// matching pethealthapp/core/repositories/_base.py's new_id()/now_iso().
// Unlike the Python _base.py, there's no generic string-table-name insert/
// update/delete helper here: drift's typed Companion API doesn't compose
// with that pattern the way Python's dict-based sqlite3 access did, so each
// repository talks to its own generated table directly instead. Each
// repository still takes/returns Map<String, dynamic> at its public edges
// (snake_case, matching the schema and lib/domain/validation.dart) so the
// call sites stay consistent with the Python source's repository shape.

import 'package:uuid/uuid.dart';

const _uuid = Uuid();

String newId() => _uuid.v4();
String nowIso() => DateTime.now().toUtc().toIso8601String();
