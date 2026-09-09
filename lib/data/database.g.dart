// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Pets extends Table with TableInfo<Pets, Pet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Pets(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _speciesMeta = const VerificationMeta(
    'species',
  );
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
    'species',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _breedMeta = const VerificationMeta('breed');
  late final GeneratedColumn<String> breed = GeneratedColumn<String>(
    'breed',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
    'sex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _dateOfBirthMeta = const VerificationMeta(
    'dateOfBirth',
  );
  late final GeneratedColumn<String> dateOfBirth = GeneratedColumn<String>(
    'date_of_birth',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _approximateAgeValueMeta =
      const VerificationMeta('approximateAgeValue');
  late final GeneratedColumn<int> approximateAgeValue = GeneratedColumn<int>(
    'approximate_age_value',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _approximateAgeSetAtMeta =
      const VerificationMeta('approximateAgeSetAt');
  late final GeneratedColumn<String> approximateAgeSetAt =
      GeneratedColumn<String>(
        'approximate_age_set_at',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: 'NULL',
      );
  static const VerificationMeta _colorMarkingsMeta = const VerificationMeta(
    'colorMarkings',
  );
  late final GeneratedColumn<String> colorMarkings = GeneratedColumn<String>(
    'color_markings',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _sterilizationStatusMeta =
      const VerificationMeta('sterilizationStatus');
  late final GeneratedColumn<String> sterilizationStatus =
      GeneratedColumn<String>(
        'sterilization_status',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: 'NULL',
      );
  static const VerificationMeta _lifeStatusMeta = const VerificationMeta(
    'lifeStatus',
  );
  late final GeneratedColumn<String> lifeStatus = GeneratedColumn<String>(
    'life_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'active\'',
    defaultValue: const CustomExpression('\'active\''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _lastEditedAtMeta = const VerificationMeta(
    'lastEditedAt',
  );
  late final GeneratedColumn<String> lastEditedAt = GeneratedColumn<String>(
    'last_edited_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    species,
    breed,
    sex,
    dateOfBirth,
    approximateAgeValue,
    approximateAgeSetAt,
    colorMarkings,
    sterilizationStatus,
    lifeStatus,
    createdAt,
    lastEditedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pets';
  @override
  VerificationContext validateIntegrity(
    Insertable<Pet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('species')) {
      context.handle(
        _speciesMeta,
        species.isAcceptableOrUnknown(data['species']!, _speciesMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('breed')) {
      context.handle(
        _breedMeta,
        breed.isAcceptableOrUnknown(data['breed']!, _breedMeta),
      );
    }
    if (data.containsKey('sex')) {
      context.handle(
        _sexMeta,
        sex.isAcceptableOrUnknown(data['sex']!, _sexMeta),
      );
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
        _dateOfBirthMeta,
        dateOfBirth.isAcceptableOrUnknown(
          data['date_of_birth']!,
          _dateOfBirthMeta,
        ),
      );
    }
    if (data.containsKey('approximate_age_value')) {
      context.handle(
        _approximateAgeValueMeta,
        approximateAgeValue.isAcceptableOrUnknown(
          data['approximate_age_value']!,
          _approximateAgeValueMeta,
        ),
      );
    }
    if (data.containsKey('approximate_age_set_at')) {
      context.handle(
        _approximateAgeSetAtMeta,
        approximateAgeSetAt.isAcceptableOrUnknown(
          data['approximate_age_set_at']!,
          _approximateAgeSetAtMeta,
        ),
      );
    }
    if (data.containsKey('color_markings')) {
      context.handle(
        _colorMarkingsMeta,
        colorMarkings.isAcceptableOrUnknown(
          data['color_markings']!,
          _colorMarkingsMeta,
        ),
      );
    }
    if (data.containsKey('sterilization_status')) {
      context.handle(
        _sterilizationStatusMeta,
        sterilizationStatus.isAcceptableOrUnknown(
          data['sterilization_status']!,
          _sterilizationStatusMeta,
        ),
      );
    }
    if (data.containsKey('life_status')) {
      context.handle(
        _lifeStatusMeta,
        lifeStatus.isAcceptableOrUnknown(data['life_status']!, _lifeStatusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_edited_at')) {
      context.handle(
        _lastEditedAtMeta,
        lastEditedAt.isAcceptableOrUnknown(
          data['last_edited_at']!,
          _lastEditedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastEditedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pet(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      species: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}species'],
      )!,
      breed: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}breed'],
      ),
      sex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sex'],
      ),
      dateOfBirth: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date_of_birth'],
      ),
      approximateAgeValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}approximate_age_value'],
      ),
      approximateAgeSetAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}approximate_age_set_at'],
      ),
      colorMarkings: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_markings'],
      ),
      sterilizationStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sterilization_status'],
      ),
      lifeStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}life_status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      lastEditedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_edited_at'],
      )!,
    );
  }

  @override
  Pets createAlias(String alias) {
    return Pets(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CHECK(date_of_birth IS NULL OR approximate_age_value IS NULL)',
    'CHECK(life_status IN (\'active\', \'deceased\', \'rehomed\'))',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class Pet extends DataClass implements Insertable<Pet> {
  final String id;
  final String name;
  final String species;
  final String? breed;
  final String? sex;
  final String? dateOfBirth;
  final int? approximateAgeValue;
  final String? approximateAgeSetAt;
  final String? colorMarkings;
  final String? sterilizationStatus;
  final String lifeStatus;
  final String createdAt;
  final String lastEditedAt;
  const Pet({
    required this.id,
    required this.name,
    required this.species,
    this.breed,
    this.sex,
    this.dateOfBirth,
    this.approximateAgeValue,
    this.approximateAgeSetAt,
    this.colorMarkings,
    this.sterilizationStatus,
    required this.lifeStatus,
    required this.createdAt,
    required this.lastEditedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['species'] = Variable<String>(species);
    if (!nullToAbsent || breed != null) {
      map['breed'] = Variable<String>(breed);
    }
    if (!nullToAbsent || sex != null) {
      map['sex'] = Variable<String>(sex);
    }
    if (!nullToAbsent || dateOfBirth != null) {
      map['date_of_birth'] = Variable<String>(dateOfBirth);
    }
    if (!nullToAbsent || approximateAgeValue != null) {
      map['approximate_age_value'] = Variable<int>(approximateAgeValue);
    }
    if (!nullToAbsent || approximateAgeSetAt != null) {
      map['approximate_age_set_at'] = Variable<String>(approximateAgeSetAt);
    }
    if (!nullToAbsent || colorMarkings != null) {
      map['color_markings'] = Variable<String>(colorMarkings);
    }
    if (!nullToAbsent || sterilizationStatus != null) {
      map['sterilization_status'] = Variable<String>(sterilizationStatus);
    }
    map['life_status'] = Variable<String>(lifeStatus);
    map['created_at'] = Variable<String>(createdAt);
    map['last_edited_at'] = Variable<String>(lastEditedAt);
    return map;
  }

  PetsCompanion toCompanion(bool nullToAbsent) {
    return PetsCompanion(
      id: Value(id),
      name: Value(name),
      species: Value(species),
      breed: breed == null && nullToAbsent
          ? const Value.absent()
          : Value(breed),
      sex: sex == null && nullToAbsent ? const Value.absent() : Value(sex),
      dateOfBirth: dateOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfBirth),
      approximateAgeValue: approximateAgeValue == null && nullToAbsent
          ? const Value.absent()
          : Value(approximateAgeValue),
      approximateAgeSetAt: approximateAgeSetAt == null && nullToAbsent
          ? const Value.absent()
          : Value(approximateAgeSetAt),
      colorMarkings: colorMarkings == null && nullToAbsent
          ? const Value.absent()
          : Value(colorMarkings),
      sterilizationStatus: sterilizationStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(sterilizationStatus),
      lifeStatus: Value(lifeStatus),
      createdAt: Value(createdAt),
      lastEditedAt: Value(lastEditedAt),
    );
  }

  factory Pet.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pet(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      species: serializer.fromJson<String>(json['species']),
      breed: serializer.fromJson<String?>(json['breed']),
      sex: serializer.fromJson<String?>(json['sex']),
      dateOfBirth: serializer.fromJson<String?>(json['date_of_birth']),
      approximateAgeValue: serializer.fromJson<int?>(
        json['approximate_age_value'],
      ),
      approximateAgeSetAt: serializer.fromJson<String?>(
        json['approximate_age_set_at'],
      ),
      colorMarkings: serializer.fromJson<String?>(json['color_markings']),
      sterilizationStatus: serializer.fromJson<String?>(
        json['sterilization_status'],
      ),
      lifeStatus: serializer.fromJson<String>(json['life_status']),
      createdAt: serializer.fromJson<String>(json['created_at']),
      lastEditedAt: serializer.fromJson<String>(json['last_edited_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'species': serializer.toJson<String>(species),
      'breed': serializer.toJson<String?>(breed),
      'sex': serializer.toJson<String?>(sex),
      'date_of_birth': serializer.toJson<String?>(dateOfBirth),
      'approximate_age_value': serializer.toJson<int?>(approximateAgeValue),
      'approximate_age_set_at': serializer.toJson<String?>(approximateAgeSetAt),
      'color_markings': serializer.toJson<String?>(colorMarkings),
      'sterilization_status': serializer.toJson<String?>(sterilizationStatus),
      'life_status': serializer.toJson<String>(lifeStatus),
      'created_at': serializer.toJson<String>(createdAt),
      'last_edited_at': serializer.toJson<String>(lastEditedAt),
    };
  }

  Pet copyWith({
    String? id,
    String? name,
    String? species,
    Value<String?> breed = const Value.absent(),
    Value<String?> sex = const Value.absent(),
    Value<String?> dateOfBirth = const Value.absent(),
    Value<int?> approximateAgeValue = const Value.absent(),
    Value<String?> approximateAgeSetAt = const Value.absent(),
    Value<String?> colorMarkings = const Value.absent(),
    Value<String?> sterilizationStatus = const Value.absent(),
    String? lifeStatus,
    String? createdAt,
    String? lastEditedAt,
  }) => Pet(
    id: id ?? this.id,
    name: name ?? this.name,
    species: species ?? this.species,
    breed: breed.present ? breed.value : this.breed,
    sex: sex.present ? sex.value : this.sex,
    dateOfBirth: dateOfBirth.present ? dateOfBirth.value : this.dateOfBirth,
    approximateAgeValue: approximateAgeValue.present
        ? approximateAgeValue.value
        : this.approximateAgeValue,
    approximateAgeSetAt: approximateAgeSetAt.present
        ? approximateAgeSetAt.value
        : this.approximateAgeSetAt,
    colorMarkings: colorMarkings.present
        ? colorMarkings.value
        : this.colorMarkings,
    sterilizationStatus: sterilizationStatus.present
        ? sterilizationStatus.value
        : this.sterilizationStatus,
    lifeStatus: lifeStatus ?? this.lifeStatus,
    createdAt: createdAt ?? this.createdAt,
    lastEditedAt: lastEditedAt ?? this.lastEditedAt,
  );
  Pet copyWithCompanion(PetsCompanion data) {
    return Pet(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      species: data.species.present ? data.species.value : this.species,
      breed: data.breed.present ? data.breed.value : this.breed,
      sex: data.sex.present ? data.sex.value : this.sex,
      dateOfBirth: data.dateOfBirth.present
          ? data.dateOfBirth.value
          : this.dateOfBirth,
      approximateAgeValue: data.approximateAgeValue.present
          ? data.approximateAgeValue.value
          : this.approximateAgeValue,
      approximateAgeSetAt: data.approximateAgeSetAt.present
          ? data.approximateAgeSetAt.value
          : this.approximateAgeSetAt,
      colorMarkings: data.colorMarkings.present
          ? data.colorMarkings.value
          : this.colorMarkings,
      sterilizationStatus: data.sterilizationStatus.present
          ? data.sterilizationStatus.value
          : this.sterilizationStatus,
      lifeStatus: data.lifeStatus.present
          ? data.lifeStatus.value
          : this.lifeStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastEditedAt: data.lastEditedAt.present
          ? data.lastEditedAt.value
          : this.lastEditedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Pet(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('species: $species, ')
          ..write('breed: $breed, ')
          ..write('sex: $sex, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('approximateAgeValue: $approximateAgeValue, ')
          ..write('approximateAgeSetAt: $approximateAgeSetAt, ')
          ..write('colorMarkings: $colorMarkings, ')
          ..write('sterilizationStatus: $sterilizationStatus, ')
          ..write('lifeStatus: $lifeStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    species,
    breed,
    sex,
    dateOfBirth,
    approximateAgeValue,
    approximateAgeSetAt,
    colorMarkings,
    sterilizationStatus,
    lifeStatus,
    createdAt,
    lastEditedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pet &&
          other.id == this.id &&
          other.name == this.name &&
          other.species == this.species &&
          other.breed == this.breed &&
          other.sex == this.sex &&
          other.dateOfBirth == this.dateOfBirth &&
          other.approximateAgeValue == this.approximateAgeValue &&
          other.approximateAgeSetAt == this.approximateAgeSetAt &&
          other.colorMarkings == this.colorMarkings &&
          other.sterilizationStatus == this.sterilizationStatus &&
          other.lifeStatus == this.lifeStatus &&
          other.createdAt == this.createdAt &&
          other.lastEditedAt == this.lastEditedAt);
}

class PetsCompanion extends UpdateCompanion<Pet> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> species;
  final Value<String?> breed;
  final Value<String?> sex;
  final Value<String?> dateOfBirth;
  final Value<int?> approximateAgeValue;
  final Value<String?> approximateAgeSetAt;
  final Value<String?> colorMarkings;
  final Value<String?> sterilizationStatus;
  final Value<String> lifeStatus;
  final Value<String> createdAt;
  final Value<String> lastEditedAt;
  final Value<int> rowid;
  const PetsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.species = const Value.absent(),
    this.breed = const Value.absent(),
    this.sex = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.approximateAgeValue = const Value.absent(),
    this.approximateAgeSetAt = const Value.absent(),
    this.colorMarkings = const Value.absent(),
    this.sterilizationStatus = const Value.absent(),
    this.lifeStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastEditedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PetsCompanion.insert({
    required String id,
    required String name,
    required String species,
    this.breed = const Value.absent(),
    this.sex = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.approximateAgeValue = const Value.absent(),
    this.approximateAgeSetAt = const Value.absent(),
    this.colorMarkings = const Value.absent(),
    this.sterilizationStatus = const Value.absent(),
    this.lifeStatus = const Value.absent(),
    required String createdAt,
    required String lastEditedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       species = Value(species),
       createdAt = Value(createdAt),
       lastEditedAt = Value(lastEditedAt);
  static Insertable<Pet> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? species,
    Expression<String>? breed,
    Expression<String>? sex,
    Expression<String>? dateOfBirth,
    Expression<int>? approximateAgeValue,
    Expression<String>? approximateAgeSetAt,
    Expression<String>? colorMarkings,
    Expression<String>? sterilizationStatus,
    Expression<String>? lifeStatus,
    Expression<String>? createdAt,
    Expression<String>? lastEditedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (species != null) 'species': species,
      if (breed != null) 'breed': breed,
      if (sex != null) 'sex': sex,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (approximateAgeValue != null)
        'approximate_age_value': approximateAgeValue,
      if (approximateAgeSetAt != null)
        'approximate_age_set_at': approximateAgeSetAt,
      if (colorMarkings != null) 'color_markings': colorMarkings,
      if (sterilizationStatus != null)
        'sterilization_status': sterilizationStatus,
      if (lifeStatus != null) 'life_status': lifeStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (lastEditedAt != null) 'last_edited_at': lastEditedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PetsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? species,
    Value<String?>? breed,
    Value<String?>? sex,
    Value<String?>? dateOfBirth,
    Value<int?>? approximateAgeValue,
    Value<String?>? approximateAgeSetAt,
    Value<String?>? colorMarkings,
    Value<String?>? sterilizationStatus,
    Value<String>? lifeStatus,
    Value<String>? createdAt,
    Value<String>? lastEditedAt,
    Value<int>? rowid,
  }) {
    return PetsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      species: species ?? this.species,
      breed: breed ?? this.breed,
      sex: sex ?? this.sex,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      approximateAgeValue: approximateAgeValue ?? this.approximateAgeValue,
      approximateAgeSetAt: approximateAgeSetAt ?? this.approximateAgeSetAt,
      colorMarkings: colorMarkings ?? this.colorMarkings,
      sterilizationStatus: sterilizationStatus ?? this.sterilizationStatus,
      lifeStatus: lifeStatus ?? this.lifeStatus,
      createdAt: createdAt ?? this.createdAt,
      lastEditedAt: lastEditedAt ?? this.lastEditedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (breed.present) {
      map['breed'] = Variable<String>(breed.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<String>(dateOfBirth.value);
    }
    if (approximateAgeValue.present) {
      map['approximate_age_value'] = Variable<int>(approximateAgeValue.value);
    }
    if (approximateAgeSetAt.present) {
      map['approximate_age_set_at'] = Variable<String>(
        approximateAgeSetAt.value,
      );
    }
    if (colorMarkings.present) {
      map['color_markings'] = Variable<String>(colorMarkings.value);
    }
    if (sterilizationStatus.present) {
      map['sterilization_status'] = Variable<String>(sterilizationStatus.value);
    }
    if (lifeStatus.present) {
      map['life_status'] = Variable<String>(lifeStatus.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (lastEditedAt.present) {
      map['last_edited_at'] = Variable<String>(lastEditedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PetsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('species: $species, ')
          ..write('breed: $breed, ')
          ..write('sex: $sex, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('approximateAgeValue: $approximateAgeValue, ')
          ..write('approximateAgeSetAt: $approximateAgeSetAt, ')
          ..write('colorMarkings: $colorMarkings, ')
          ..write('sterilizationStatus: $sterilizationStatus, ')
          ..write('lifeStatus: $lifeStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class People extends Table with TableInfo<People, PeopleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  People(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _relationshipLabelMeta = const VerificationMeta(
    'relationshipLabel',
  );
  late final GeneratedColumn<String> relationshipLabel =
      GeneratedColumn<String>(
        'relationship_label',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: 'NULL',
      );
  static const VerificationMeta _contactInfoMeta = const VerificationMeta(
    'contactInfo',
  );
  late final GeneratedColumn<String> contactInfo = GeneratedColumn<String>(
    'contact_info',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _lastEditedAtMeta = const VerificationMeta(
    'lastEditedAt',
  );
  late final GeneratedColumn<String> lastEditedAt = GeneratedColumn<String>(
    'last_edited_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    relationshipLabel,
    contactInfo,
    isArchived,
    createdAt,
    lastEditedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'people';
  @override
  VerificationContext validateIntegrity(
    Insertable<PeopleData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('relationship_label')) {
      context.handle(
        _relationshipLabelMeta,
        relationshipLabel.isAcceptableOrUnknown(
          data['relationship_label']!,
          _relationshipLabelMeta,
        ),
      );
    }
    if (data.containsKey('contact_info')) {
      context.handle(
        _contactInfoMeta,
        contactInfo.isAcceptableOrUnknown(
          data['contact_info']!,
          _contactInfoMeta,
        ),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_edited_at')) {
      context.handle(
        _lastEditedAtMeta,
        lastEditedAt.isAcceptableOrUnknown(
          data['last_edited_at']!,
          _lastEditedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastEditedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PeopleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PeopleData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      relationshipLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relationship_label'],
      ),
      contactInfo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact_info'],
      ),
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      lastEditedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_edited_at'],
      )!,
    );
  }

  @override
  People createAlias(String alias) {
    return People(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class PeopleData extends DataClass implements Insertable<PeopleData> {
  final String id;
  final String name;
  final String? relationshipLabel;
  final String? contactInfo;
  final bool isArchived;
  final String createdAt;
  final String lastEditedAt;
  const PeopleData({
    required this.id,
    required this.name,
    this.relationshipLabel,
    this.contactInfo,
    required this.isArchived,
    required this.createdAt,
    required this.lastEditedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || relationshipLabel != null) {
      map['relationship_label'] = Variable<String>(relationshipLabel);
    }
    if (!nullToAbsent || contactInfo != null) {
      map['contact_info'] = Variable<String>(contactInfo);
    }
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<String>(createdAt);
    map['last_edited_at'] = Variable<String>(lastEditedAt);
    return map;
  }

  PeopleCompanion toCompanion(bool nullToAbsent) {
    return PeopleCompanion(
      id: Value(id),
      name: Value(name),
      relationshipLabel: relationshipLabel == null && nullToAbsent
          ? const Value.absent()
          : Value(relationshipLabel),
      contactInfo: contactInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(contactInfo),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      lastEditedAt: Value(lastEditedAt),
    );
  }

  factory PeopleData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PeopleData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      relationshipLabel: serializer.fromJson<String?>(
        json['relationship_label'],
      ),
      contactInfo: serializer.fromJson<String?>(json['contact_info']),
      isArchived: serializer.fromJson<bool>(json['is_archived']),
      createdAt: serializer.fromJson<String>(json['created_at']),
      lastEditedAt: serializer.fromJson<String>(json['last_edited_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'relationship_label': serializer.toJson<String?>(relationshipLabel),
      'contact_info': serializer.toJson<String?>(contactInfo),
      'is_archived': serializer.toJson<bool>(isArchived),
      'created_at': serializer.toJson<String>(createdAt),
      'last_edited_at': serializer.toJson<String>(lastEditedAt),
    };
  }

  PeopleData copyWith({
    String? id,
    String? name,
    Value<String?> relationshipLabel = const Value.absent(),
    Value<String?> contactInfo = const Value.absent(),
    bool? isArchived,
    String? createdAt,
    String? lastEditedAt,
  }) => PeopleData(
    id: id ?? this.id,
    name: name ?? this.name,
    relationshipLabel: relationshipLabel.present
        ? relationshipLabel.value
        : this.relationshipLabel,
    contactInfo: contactInfo.present ? contactInfo.value : this.contactInfo,
    isArchived: isArchived ?? this.isArchived,
    createdAt: createdAt ?? this.createdAt,
    lastEditedAt: lastEditedAt ?? this.lastEditedAt,
  );
  PeopleData copyWithCompanion(PeopleCompanion data) {
    return PeopleData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      relationshipLabel: data.relationshipLabel.present
          ? data.relationshipLabel.value
          : this.relationshipLabel,
      contactInfo: data.contactInfo.present
          ? data.contactInfo.value
          : this.contactInfo,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastEditedAt: data.lastEditedAt.present
          ? data.lastEditedAt.value
          : this.lastEditedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PeopleData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('relationshipLabel: $relationshipLabel, ')
          ..write('contactInfo: $contactInfo, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    relationshipLabel,
    contactInfo,
    isArchived,
    createdAt,
    lastEditedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PeopleData &&
          other.id == this.id &&
          other.name == this.name &&
          other.relationshipLabel == this.relationshipLabel &&
          other.contactInfo == this.contactInfo &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.lastEditedAt == this.lastEditedAt);
}

class PeopleCompanion extends UpdateCompanion<PeopleData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> relationshipLabel;
  final Value<String?> contactInfo;
  final Value<bool> isArchived;
  final Value<String> createdAt;
  final Value<String> lastEditedAt;
  final Value<int> rowid;
  const PeopleCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.relationshipLabel = const Value.absent(),
    this.contactInfo = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastEditedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PeopleCompanion.insert({
    required String id,
    required String name,
    this.relationshipLabel = const Value.absent(),
    this.contactInfo = const Value.absent(),
    this.isArchived = const Value.absent(),
    required String createdAt,
    required String lastEditedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt),
       lastEditedAt = Value(lastEditedAt);
  static Insertable<PeopleData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? relationshipLabel,
    Expression<String>? contactInfo,
    Expression<bool>? isArchived,
    Expression<String>? createdAt,
    Expression<String>? lastEditedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (relationshipLabel != null) 'relationship_label': relationshipLabel,
      if (contactInfo != null) 'contact_info': contactInfo,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (lastEditedAt != null) 'last_edited_at': lastEditedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PeopleCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? relationshipLabel,
    Value<String?>? contactInfo,
    Value<bool>? isArchived,
    Value<String>? createdAt,
    Value<String>? lastEditedAt,
    Value<int>? rowid,
  }) {
    return PeopleCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      relationshipLabel: relationshipLabel ?? this.relationshipLabel,
      contactInfo: contactInfo ?? this.contactInfo,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      lastEditedAt: lastEditedAt ?? this.lastEditedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (relationshipLabel.present) {
      map['relationship_label'] = Variable<String>(relationshipLabel.value);
    }
    if (contactInfo.present) {
      map['contact_info'] = Variable<String>(contactInfo.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (lastEditedAt.present) {
      map['last_edited_at'] = Variable<String>(lastEditedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PeopleCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('relationshipLabel: $relationshipLabel, ')
          ..write('contactInfo: $contactInfo, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class VetAppointments extends Table
    with TableInfo<VetAppointments, VetAppointment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  VetAppointments(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES pets(id)',
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _clinicNameMeta = const VerificationMeta(
    'clinicName',
  );
  late final GeneratedColumn<String> clinicName = GeneratedColumn<String>(
    'clinic_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _outcomeNotesMeta = const VerificationMeta(
    'outcomeNotes',
  );
  late final GeneratedColumn<String> outcomeNotes = GeneratedColumn<String>(
    'outcome_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'scheduled\'',
    defaultValue: const CustomExpression('\'scheduled\''),
  );
  static const VerificationMeta _handledByPersonIdMeta = const VerificationMeta(
    'handledByPersonId',
  );
  late final GeneratedColumn<String> handledByPersonId =
      GeneratedColumn<String>(
        'handled_by_person_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: 'NULL REFERENCES people(id)',
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _lastEditedAtMeta = const VerificationMeta(
    'lastEditedAt',
  );
  late final GeneratedColumn<String> lastEditedAt = GeneratedColumn<String>(
    'last_edited_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    petId,
    date,
    reason,
    clinicName,
    outcomeNotes,
    status,
    handledByPersonId,
    createdAt,
    lastEditedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vet_appointments';
  @override
  VerificationContext validateIntegrity(
    Insertable<VetAppointment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('clinic_name')) {
      context.handle(
        _clinicNameMeta,
        clinicName.isAcceptableOrUnknown(data['clinic_name']!, _clinicNameMeta),
      );
    }
    if (data.containsKey('outcome_notes')) {
      context.handle(
        _outcomeNotesMeta,
        outcomeNotes.isAcceptableOrUnknown(
          data['outcome_notes']!,
          _outcomeNotesMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('handled_by_person_id')) {
      context.handle(
        _handledByPersonIdMeta,
        handledByPersonId.isAcceptableOrUnknown(
          data['handled_by_person_id']!,
          _handledByPersonIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_edited_at')) {
      context.handle(
        _lastEditedAtMeta,
        lastEditedAt.isAcceptableOrUnknown(
          data['last_edited_at']!,
          _lastEditedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastEditedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VetAppointment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VetAppointment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      )!,
      clinicName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}clinic_name'],
      ),
      outcomeNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}outcome_notes'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      handledByPersonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}handled_by_person_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      lastEditedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_edited_at'],
      )!,
    );
  }

  @override
  VetAppointments createAlias(String alias) {
    return VetAppointments(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CHECK(status IN (\'scheduled\', \'completed\', \'cancelled\'))',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class VetAppointment extends DataClass implements Insertable<VetAppointment> {
  final String id;
  final String petId;
  final String date;
  final String reason;
  final String? clinicName;
  final String? outcomeNotes;
  final String status;
  final String? handledByPersonId;
  final String createdAt;
  final String lastEditedAt;
  const VetAppointment({
    required this.id,
    required this.petId,
    required this.date,
    required this.reason,
    this.clinicName,
    this.outcomeNotes,
    required this.status,
    this.handledByPersonId,
    required this.createdAt,
    required this.lastEditedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    map['date'] = Variable<String>(date);
    map['reason'] = Variable<String>(reason);
    if (!nullToAbsent || clinicName != null) {
      map['clinic_name'] = Variable<String>(clinicName);
    }
    if (!nullToAbsent || outcomeNotes != null) {
      map['outcome_notes'] = Variable<String>(outcomeNotes);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || handledByPersonId != null) {
      map['handled_by_person_id'] = Variable<String>(handledByPersonId);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['last_edited_at'] = Variable<String>(lastEditedAt);
    return map;
  }

  VetAppointmentsCompanion toCompanion(bool nullToAbsent) {
    return VetAppointmentsCompanion(
      id: Value(id),
      petId: Value(petId),
      date: Value(date),
      reason: Value(reason),
      clinicName: clinicName == null && nullToAbsent
          ? const Value.absent()
          : Value(clinicName),
      outcomeNotes: outcomeNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(outcomeNotes),
      status: Value(status),
      handledByPersonId: handledByPersonId == null && nullToAbsent
          ? const Value.absent()
          : Value(handledByPersonId),
      createdAt: Value(createdAt),
      lastEditedAt: Value(lastEditedAt),
    );
  }

  factory VetAppointment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VetAppointment(
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['pet_id']),
      date: serializer.fromJson<String>(json['date']),
      reason: serializer.fromJson<String>(json['reason']),
      clinicName: serializer.fromJson<String?>(json['clinic_name']),
      outcomeNotes: serializer.fromJson<String?>(json['outcome_notes']),
      status: serializer.fromJson<String>(json['status']),
      handledByPersonId: serializer.fromJson<String?>(
        json['handled_by_person_id'],
      ),
      createdAt: serializer.fromJson<String>(json['created_at']),
      lastEditedAt: serializer.fromJson<String>(json['last_edited_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pet_id': serializer.toJson<String>(petId),
      'date': serializer.toJson<String>(date),
      'reason': serializer.toJson<String>(reason),
      'clinic_name': serializer.toJson<String?>(clinicName),
      'outcome_notes': serializer.toJson<String?>(outcomeNotes),
      'status': serializer.toJson<String>(status),
      'handled_by_person_id': serializer.toJson<String?>(handledByPersonId),
      'created_at': serializer.toJson<String>(createdAt),
      'last_edited_at': serializer.toJson<String>(lastEditedAt),
    };
  }

  VetAppointment copyWith({
    String? id,
    String? petId,
    String? date,
    String? reason,
    Value<String?> clinicName = const Value.absent(),
    Value<String?> outcomeNotes = const Value.absent(),
    String? status,
    Value<String?> handledByPersonId = const Value.absent(),
    String? createdAt,
    String? lastEditedAt,
  }) => VetAppointment(
    id: id ?? this.id,
    petId: petId ?? this.petId,
    date: date ?? this.date,
    reason: reason ?? this.reason,
    clinicName: clinicName.present ? clinicName.value : this.clinicName,
    outcomeNotes: outcomeNotes.present ? outcomeNotes.value : this.outcomeNotes,
    status: status ?? this.status,
    handledByPersonId: handledByPersonId.present
        ? handledByPersonId.value
        : this.handledByPersonId,
    createdAt: createdAt ?? this.createdAt,
    lastEditedAt: lastEditedAt ?? this.lastEditedAt,
  );
  VetAppointment copyWithCompanion(VetAppointmentsCompanion data) {
    return VetAppointment(
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      date: data.date.present ? data.date.value : this.date,
      reason: data.reason.present ? data.reason.value : this.reason,
      clinicName: data.clinicName.present
          ? data.clinicName.value
          : this.clinicName,
      outcomeNotes: data.outcomeNotes.present
          ? data.outcomeNotes.value
          : this.outcomeNotes,
      status: data.status.present ? data.status.value : this.status,
      handledByPersonId: data.handledByPersonId.present
          ? data.handledByPersonId.value
          : this.handledByPersonId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastEditedAt: data.lastEditedAt.present
          ? data.lastEditedAt.value
          : this.lastEditedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VetAppointment(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('date: $date, ')
          ..write('reason: $reason, ')
          ..write('clinicName: $clinicName, ')
          ..write('outcomeNotes: $outcomeNotes, ')
          ..write('status: $status, ')
          ..write('handledByPersonId: $handledByPersonId, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    petId,
    date,
    reason,
    clinicName,
    outcomeNotes,
    status,
    handledByPersonId,
    createdAt,
    lastEditedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VetAppointment &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.date == this.date &&
          other.reason == this.reason &&
          other.clinicName == this.clinicName &&
          other.outcomeNotes == this.outcomeNotes &&
          other.status == this.status &&
          other.handledByPersonId == this.handledByPersonId &&
          other.createdAt == this.createdAt &&
          other.lastEditedAt == this.lastEditedAt);
}

class VetAppointmentsCompanion extends UpdateCompanion<VetAppointment> {
  final Value<String> id;
  final Value<String> petId;
  final Value<String> date;
  final Value<String> reason;
  final Value<String?> clinicName;
  final Value<String?> outcomeNotes;
  final Value<String> status;
  final Value<String?> handledByPersonId;
  final Value<String> createdAt;
  final Value<String> lastEditedAt;
  final Value<int> rowid;
  const VetAppointmentsCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.date = const Value.absent(),
    this.reason = const Value.absent(),
    this.clinicName = const Value.absent(),
    this.outcomeNotes = const Value.absent(),
    this.status = const Value.absent(),
    this.handledByPersonId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastEditedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VetAppointmentsCompanion.insert({
    required String id,
    required String petId,
    required String date,
    required String reason,
    this.clinicName = const Value.absent(),
    this.outcomeNotes = const Value.absent(),
    this.status = const Value.absent(),
    this.handledByPersonId = const Value.absent(),
    required String createdAt,
    required String lastEditedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId),
       date = Value(date),
       reason = Value(reason),
       createdAt = Value(createdAt),
       lastEditedAt = Value(lastEditedAt);
  static Insertable<VetAppointment> custom({
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? date,
    Expression<String>? reason,
    Expression<String>? clinicName,
    Expression<String>? outcomeNotes,
    Expression<String>? status,
    Expression<String>? handledByPersonId,
    Expression<String>? createdAt,
    Expression<String>? lastEditedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (date != null) 'date': date,
      if (reason != null) 'reason': reason,
      if (clinicName != null) 'clinic_name': clinicName,
      if (outcomeNotes != null) 'outcome_notes': outcomeNotes,
      if (status != null) 'status': status,
      if (handledByPersonId != null) 'handled_by_person_id': handledByPersonId,
      if (createdAt != null) 'created_at': createdAt,
      if (lastEditedAt != null) 'last_edited_at': lastEditedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VetAppointmentsCompanion copyWith({
    Value<String>? id,
    Value<String>? petId,
    Value<String>? date,
    Value<String>? reason,
    Value<String?>? clinicName,
    Value<String?>? outcomeNotes,
    Value<String>? status,
    Value<String?>? handledByPersonId,
    Value<String>? createdAt,
    Value<String>? lastEditedAt,
    Value<int>? rowid,
  }) {
    return VetAppointmentsCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      date: date ?? this.date,
      reason: reason ?? this.reason,
      clinicName: clinicName ?? this.clinicName,
      outcomeNotes: outcomeNotes ?? this.outcomeNotes,
      status: status ?? this.status,
      handledByPersonId: handledByPersonId ?? this.handledByPersonId,
      createdAt: createdAt ?? this.createdAt,
      lastEditedAt: lastEditedAt ?? this.lastEditedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (clinicName.present) {
      map['clinic_name'] = Variable<String>(clinicName.value);
    }
    if (outcomeNotes.present) {
      map['outcome_notes'] = Variable<String>(outcomeNotes.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (handledByPersonId.present) {
      map['handled_by_person_id'] = Variable<String>(handledByPersonId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (lastEditedAt.present) {
      map['last_edited_at'] = Variable<String>(lastEditedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VetAppointmentsCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('date: $date, ')
          ..write('reason: $reason, ')
          ..write('clinicName: $clinicName, ')
          ..write('outcomeNotes: $outcomeNotes, ')
          ..write('status: $status, ')
          ..write('handledByPersonId: $handledByPersonId, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Hospitalizations extends Table
    with TableInfo<Hospitalizations, Hospitalization> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Hospitalizations(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES pets(id)',
  );
  static const VerificationMeta _admissionDateMeta = const VerificationMeta(
    'admissionDate',
  );
  late final GeneratedColumn<String> admissionDate = GeneratedColumn<String>(
    'admission_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _dischargeDateMeta = const VerificationMeta(
    'dischargeDate',
  );
  late final GeneratedColumn<String> dischargeDate = GeneratedColumn<String>(
    'discharge_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _providerMeta = const VerificationMeta(
    'provider',
  );
  late final GeneratedColumn<String> provider = GeneratedColumn<String>(
    'provider',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _outcomeNotesMeta = const VerificationMeta(
    'outcomeNotes',
  );
  late final GeneratedColumn<String> outcomeNotes = GeneratedColumn<String>(
    'outcome_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _handledByPersonIdMeta = const VerificationMeta(
    'handledByPersonId',
  );
  late final GeneratedColumn<String> handledByPersonId =
      GeneratedColumn<String>(
        'handled_by_person_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: 'NULL REFERENCES people(id)',
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _lastEditedAtMeta = const VerificationMeta(
    'lastEditedAt',
  );
  late final GeneratedColumn<String> lastEditedAt = GeneratedColumn<String>(
    'last_edited_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    petId,
    admissionDate,
    dischargeDate,
    reason,
    provider,
    outcomeNotes,
    handledByPersonId,
    createdAt,
    lastEditedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hospitalizations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Hospitalization> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('admission_date')) {
      context.handle(
        _admissionDateMeta,
        admissionDate.isAcceptableOrUnknown(
          data['admission_date']!,
          _admissionDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_admissionDateMeta);
    }
    if (data.containsKey('discharge_date')) {
      context.handle(
        _dischargeDateMeta,
        dischargeDate.isAcceptableOrUnknown(
          data['discharge_date']!,
          _dischargeDateMeta,
        ),
      );
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('provider')) {
      context.handle(
        _providerMeta,
        provider.isAcceptableOrUnknown(data['provider']!, _providerMeta),
      );
    }
    if (data.containsKey('outcome_notes')) {
      context.handle(
        _outcomeNotesMeta,
        outcomeNotes.isAcceptableOrUnknown(
          data['outcome_notes']!,
          _outcomeNotesMeta,
        ),
      );
    }
    if (data.containsKey('handled_by_person_id')) {
      context.handle(
        _handledByPersonIdMeta,
        handledByPersonId.isAcceptableOrUnknown(
          data['handled_by_person_id']!,
          _handledByPersonIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_edited_at')) {
      context.handle(
        _lastEditedAtMeta,
        lastEditedAt.isAcceptableOrUnknown(
          data['last_edited_at']!,
          _lastEditedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastEditedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Hospitalization map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Hospitalization(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      )!,
      admissionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}admission_date'],
      )!,
      dischargeDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}discharge_date'],
      ),
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      )!,
      provider: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider'],
      ),
      outcomeNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}outcome_notes'],
      ),
      handledByPersonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}handled_by_person_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      lastEditedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_edited_at'],
      )!,
    );
  }

  @override
  Hospitalizations createAlias(String alias) {
    return Hospitalizations(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CHECK(discharge_date IS NULL OR discharge_date >= admission_date)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class Hospitalization extends DataClass implements Insertable<Hospitalization> {
  final String id;
  final String petId;
  final String admissionDate;
  final String? dischargeDate;
  final String reason;
  final String? provider;
  final String? outcomeNotes;
  final String? handledByPersonId;
  final String createdAt;
  final String lastEditedAt;
  const Hospitalization({
    required this.id,
    required this.petId,
    required this.admissionDate,
    this.dischargeDate,
    required this.reason,
    this.provider,
    this.outcomeNotes,
    this.handledByPersonId,
    required this.createdAt,
    required this.lastEditedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    map['admission_date'] = Variable<String>(admissionDate);
    if (!nullToAbsent || dischargeDate != null) {
      map['discharge_date'] = Variable<String>(dischargeDate);
    }
    map['reason'] = Variable<String>(reason);
    if (!nullToAbsent || provider != null) {
      map['provider'] = Variable<String>(provider);
    }
    if (!nullToAbsent || outcomeNotes != null) {
      map['outcome_notes'] = Variable<String>(outcomeNotes);
    }
    if (!nullToAbsent || handledByPersonId != null) {
      map['handled_by_person_id'] = Variable<String>(handledByPersonId);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['last_edited_at'] = Variable<String>(lastEditedAt);
    return map;
  }

  HospitalizationsCompanion toCompanion(bool nullToAbsent) {
    return HospitalizationsCompanion(
      id: Value(id),
      petId: Value(petId),
      admissionDate: Value(admissionDate),
      dischargeDate: dischargeDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dischargeDate),
      reason: Value(reason),
      provider: provider == null && nullToAbsent
          ? const Value.absent()
          : Value(provider),
      outcomeNotes: outcomeNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(outcomeNotes),
      handledByPersonId: handledByPersonId == null && nullToAbsent
          ? const Value.absent()
          : Value(handledByPersonId),
      createdAt: Value(createdAt),
      lastEditedAt: Value(lastEditedAt),
    );
  }

  factory Hospitalization.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Hospitalization(
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['pet_id']),
      admissionDate: serializer.fromJson<String>(json['admission_date']),
      dischargeDate: serializer.fromJson<String?>(json['discharge_date']),
      reason: serializer.fromJson<String>(json['reason']),
      provider: serializer.fromJson<String?>(json['provider']),
      outcomeNotes: serializer.fromJson<String?>(json['outcome_notes']),
      handledByPersonId: serializer.fromJson<String?>(
        json['handled_by_person_id'],
      ),
      createdAt: serializer.fromJson<String>(json['created_at']),
      lastEditedAt: serializer.fromJson<String>(json['last_edited_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pet_id': serializer.toJson<String>(petId),
      'admission_date': serializer.toJson<String>(admissionDate),
      'discharge_date': serializer.toJson<String?>(dischargeDate),
      'reason': serializer.toJson<String>(reason),
      'provider': serializer.toJson<String?>(provider),
      'outcome_notes': serializer.toJson<String?>(outcomeNotes),
      'handled_by_person_id': serializer.toJson<String?>(handledByPersonId),
      'created_at': serializer.toJson<String>(createdAt),
      'last_edited_at': serializer.toJson<String>(lastEditedAt),
    };
  }

  Hospitalization copyWith({
    String? id,
    String? petId,
    String? admissionDate,
    Value<String?> dischargeDate = const Value.absent(),
    String? reason,
    Value<String?> provider = const Value.absent(),
    Value<String?> outcomeNotes = const Value.absent(),
    Value<String?> handledByPersonId = const Value.absent(),
    String? createdAt,
    String? lastEditedAt,
  }) => Hospitalization(
    id: id ?? this.id,
    petId: petId ?? this.petId,
    admissionDate: admissionDate ?? this.admissionDate,
    dischargeDate: dischargeDate.present
        ? dischargeDate.value
        : this.dischargeDate,
    reason: reason ?? this.reason,
    provider: provider.present ? provider.value : this.provider,
    outcomeNotes: outcomeNotes.present ? outcomeNotes.value : this.outcomeNotes,
    handledByPersonId: handledByPersonId.present
        ? handledByPersonId.value
        : this.handledByPersonId,
    createdAt: createdAt ?? this.createdAt,
    lastEditedAt: lastEditedAt ?? this.lastEditedAt,
  );
  Hospitalization copyWithCompanion(HospitalizationsCompanion data) {
    return Hospitalization(
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      admissionDate: data.admissionDate.present
          ? data.admissionDate.value
          : this.admissionDate,
      dischargeDate: data.dischargeDate.present
          ? data.dischargeDate.value
          : this.dischargeDate,
      reason: data.reason.present ? data.reason.value : this.reason,
      provider: data.provider.present ? data.provider.value : this.provider,
      outcomeNotes: data.outcomeNotes.present
          ? data.outcomeNotes.value
          : this.outcomeNotes,
      handledByPersonId: data.handledByPersonId.present
          ? data.handledByPersonId.value
          : this.handledByPersonId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastEditedAt: data.lastEditedAt.present
          ? data.lastEditedAt.value
          : this.lastEditedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Hospitalization(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('admissionDate: $admissionDate, ')
          ..write('dischargeDate: $dischargeDate, ')
          ..write('reason: $reason, ')
          ..write('provider: $provider, ')
          ..write('outcomeNotes: $outcomeNotes, ')
          ..write('handledByPersonId: $handledByPersonId, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    petId,
    admissionDate,
    dischargeDate,
    reason,
    provider,
    outcomeNotes,
    handledByPersonId,
    createdAt,
    lastEditedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Hospitalization &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.admissionDate == this.admissionDate &&
          other.dischargeDate == this.dischargeDate &&
          other.reason == this.reason &&
          other.provider == this.provider &&
          other.outcomeNotes == this.outcomeNotes &&
          other.handledByPersonId == this.handledByPersonId &&
          other.createdAt == this.createdAt &&
          other.lastEditedAt == this.lastEditedAt);
}

class HospitalizationsCompanion extends UpdateCompanion<Hospitalization> {
  final Value<String> id;
  final Value<String> petId;
  final Value<String> admissionDate;
  final Value<String?> dischargeDate;
  final Value<String> reason;
  final Value<String?> provider;
  final Value<String?> outcomeNotes;
  final Value<String?> handledByPersonId;
  final Value<String> createdAt;
  final Value<String> lastEditedAt;
  final Value<int> rowid;
  const HospitalizationsCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.admissionDate = const Value.absent(),
    this.dischargeDate = const Value.absent(),
    this.reason = const Value.absent(),
    this.provider = const Value.absent(),
    this.outcomeNotes = const Value.absent(),
    this.handledByPersonId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastEditedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HospitalizationsCompanion.insert({
    required String id,
    required String petId,
    required String admissionDate,
    this.dischargeDate = const Value.absent(),
    required String reason,
    this.provider = const Value.absent(),
    this.outcomeNotes = const Value.absent(),
    this.handledByPersonId = const Value.absent(),
    required String createdAt,
    required String lastEditedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId),
       admissionDate = Value(admissionDate),
       reason = Value(reason),
       createdAt = Value(createdAt),
       lastEditedAt = Value(lastEditedAt);
  static Insertable<Hospitalization> custom({
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? admissionDate,
    Expression<String>? dischargeDate,
    Expression<String>? reason,
    Expression<String>? provider,
    Expression<String>? outcomeNotes,
    Expression<String>? handledByPersonId,
    Expression<String>? createdAt,
    Expression<String>? lastEditedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (admissionDate != null) 'admission_date': admissionDate,
      if (dischargeDate != null) 'discharge_date': dischargeDate,
      if (reason != null) 'reason': reason,
      if (provider != null) 'provider': provider,
      if (outcomeNotes != null) 'outcome_notes': outcomeNotes,
      if (handledByPersonId != null) 'handled_by_person_id': handledByPersonId,
      if (createdAt != null) 'created_at': createdAt,
      if (lastEditedAt != null) 'last_edited_at': lastEditedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HospitalizationsCompanion copyWith({
    Value<String>? id,
    Value<String>? petId,
    Value<String>? admissionDate,
    Value<String?>? dischargeDate,
    Value<String>? reason,
    Value<String?>? provider,
    Value<String?>? outcomeNotes,
    Value<String?>? handledByPersonId,
    Value<String>? createdAt,
    Value<String>? lastEditedAt,
    Value<int>? rowid,
  }) {
    return HospitalizationsCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      admissionDate: admissionDate ?? this.admissionDate,
      dischargeDate: dischargeDate ?? this.dischargeDate,
      reason: reason ?? this.reason,
      provider: provider ?? this.provider,
      outcomeNotes: outcomeNotes ?? this.outcomeNotes,
      handledByPersonId: handledByPersonId ?? this.handledByPersonId,
      createdAt: createdAt ?? this.createdAt,
      lastEditedAt: lastEditedAt ?? this.lastEditedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (admissionDate.present) {
      map['admission_date'] = Variable<String>(admissionDate.value);
    }
    if (dischargeDate.present) {
      map['discharge_date'] = Variable<String>(dischargeDate.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (provider.present) {
      map['provider'] = Variable<String>(provider.value);
    }
    if (outcomeNotes.present) {
      map['outcome_notes'] = Variable<String>(outcomeNotes.value);
    }
    if (handledByPersonId.present) {
      map['handled_by_person_id'] = Variable<String>(handledByPersonId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (lastEditedAt.present) {
      map['last_edited_at'] = Variable<String>(lastEditedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HospitalizationsCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('admissionDate: $admissionDate, ')
          ..write('dischargeDate: $dischargeDate, ')
          ..write('reason: $reason, ')
          ..write('provider: $provider, ')
          ..write('outcomeNotes: $outcomeNotes, ')
          ..write('handledByPersonId: $handledByPersonId, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class ProceduresSurgeries extends Table
    with TableInfo<ProceduresSurgeries, ProceduresSurgery> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ProceduresSurgeries(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES pets(id)',
  );
  static const VerificationMeta _procedureNameMeta = const VerificationMeta(
    'procedureName',
  );
  late final GeneratedColumn<String> procedureName = GeneratedColumn<String>(
    'procedure_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _providerMeta = const VerificationMeta(
    'provider',
  );
  late final GeneratedColumn<String> provider = GeneratedColumn<String>(
    'provider',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _outcomeNotesMeta = const VerificationMeta(
    'outcomeNotes',
  );
  late final GeneratedColumn<String> outcomeNotes = GeneratedColumn<String>(
    'outcome_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _anesthesiaInfoMeta = const VerificationMeta(
    'anesthesiaInfo',
  );
  late final GeneratedColumn<String> anesthesiaInfo = GeneratedColumn<String>(
    'anesthesia_info',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _relatedHospitalizationIdMeta =
      const VerificationMeta('relatedHospitalizationId');
  late final GeneratedColumn<String> relatedHospitalizationId =
      GeneratedColumn<String>(
        'related_hospitalization_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: 'NULL REFERENCES hospitalizations(id)',
      );
  static const VerificationMeta _handledByPersonIdMeta = const VerificationMeta(
    'handledByPersonId',
  );
  late final GeneratedColumn<String> handledByPersonId =
      GeneratedColumn<String>(
        'handled_by_person_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: 'NULL REFERENCES people(id)',
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _lastEditedAtMeta = const VerificationMeta(
    'lastEditedAt',
  );
  late final GeneratedColumn<String> lastEditedAt = GeneratedColumn<String>(
    'last_edited_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    petId,
    procedureName,
    date,
    provider,
    outcomeNotes,
    anesthesiaInfo,
    relatedHospitalizationId,
    handledByPersonId,
    createdAt,
    lastEditedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'procedures_surgeries';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProceduresSurgery> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('procedure_name')) {
      context.handle(
        _procedureNameMeta,
        procedureName.isAcceptableOrUnknown(
          data['procedure_name']!,
          _procedureNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_procedureNameMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('provider')) {
      context.handle(
        _providerMeta,
        provider.isAcceptableOrUnknown(data['provider']!, _providerMeta),
      );
    }
    if (data.containsKey('outcome_notes')) {
      context.handle(
        _outcomeNotesMeta,
        outcomeNotes.isAcceptableOrUnknown(
          data['outcome_notes']!,
          _outcomeNotesMeta,
        ),
      );
    }
    if (data.containsKey('anesthesia_info')) {
      context.handle(
        _anesthesiaInfoMeta,
        anesthesiaInfo.isAcceptableOrUnknown(
          data['anesthesia_info']!,
          _anesthesiaInfoMeta,
        ),
      );
    }
    if (data.containsKey('related_hospitalization_id')) {
      context.handle(
        _relatedHospitalizationIdMeta,
        relatedHospitalizationId.isAcceptableOrUnknown(
          data['related_hospitalization_id']!,
          _relatedHospitalizationIdMeta,
        ),
      );
    }
    if (data.containsKey('handled_by_person_id')) {
      context.handle(
        _handledByPersonIdMeta,
        handledByPersonId.isAcceptableOrUnknown(
          data['handled_by_person_id']!,
          _handledByPersonIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_edited_at')) {
      context.handle(
        _lastEditedAtMeta,
        lastEditedAt.isAcceptableOrUnknown(
          data['last_edited_at']!,
          _lastEditedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastEditedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProceduresSurgery map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProceduresSurgery(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      )!,
      procedureName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}procedure_name'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      provider: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider'],
      ),
      outcomeNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}outcome_notes'],
      ),
      anesthesiaInfo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}anesthesia_info'],
      ),
      relatedHospitalizationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_hospitalization_id'],
      ),
      handledByPersonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}handled_by_person_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      lastEditedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_edited_at'],
      )!,
    );
  }

  @override
  ProceduresSurgeries createAlias(String alias) {
    return ProceduresSurgeries(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ProceduresSurgery extends DataClass
    implements Insertable<ProceduresSurgery> {
  final String id;
  final String petId;
  final String procedureName;
  final String date;
  final String? provider;
  final String? outcomeNotes;
  final String? anesthesiaInfo;
  final String? relatedHospitalizationId;
  final String? handledByPersonId;
  final String createdAt;
  final String lastEditedAt;
  const ProceduresSurgery({
    required this.id,
    required this.petId,
    required this.procedureName,
    required this.date,
    this.provider,
    this.outcomeNotes,
    this.anesthesiaInfo,
    this.relatedHospitalizationId,
    this.handledByPersonId,
    required this.createdAt,
    required this.lastEditedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    map['procedure_name'] = Variable<String>(procedureName);
    map['date'] = Variable<String>(date);
    if (!nullToAbsent || provider != null) {
      map['provider'] = Variable<String>(provider);
    }
    if (!nullToAbsent || outcomeNotes != null) {
      map['outcome_notes'] = Variable<String>(outcomeNotes);
    }
    if (!nullToAbsent || anesthesiaInfo != null) {
      map['anesthesia_info'] = Variable<String>(anesthesiaInfo);
    }
    if (!nullToAbsent || relatedHospitalizationId != null) {
      map['related_hospitalization_id'] = Variable<String>(
        relatedHospitalizationId,
      );
    }
    if (!nullToAbsent || handledByPersonId != null) {
      map['handled_by_person_id'] = Variable<String>(handledByPersonId);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['last_edited_at'] = Variable<String>(lastEditedAt);
    return map;
  }

  ProceduresSurgeriesCompanion toCompanion(bool nullToAbsent) {
    return ProceduresSurgeriesCompanion(
      id: Value(id),
      petId: Value(petId),
      procedureName: Value(procedureName),
      date: Value(date),
      provider: provider == null && nullToAbsent
          ? const Value.absent()
          : Value(provider),
      outcomeNotes: outcomeNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(outcomeNotes),
      anesthesiaInfo: anesthesiaInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(anesthesiaInfo),
      relatedHospitalizationId: relatedHospitalizationId == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedHospitalizationId),
      handledByPersonId: handledByPersonId == null && nullToAbsent
          ? const Value.absent()
          : Value(handledByPersonId),
      createdAt: Value(createdAt),
      lastEditedAt: Value(lastEditedAt),
    );
  }

  factory ProceduresSurgery.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProceduresSurgery(
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['pet_id']),
      procedureName: serializer.fromJson<String>(json['procedure_name']),
      date: serializer.fromJson<String>(json['date']),
      provider: serializer.fromJson<String?>(json['provider']),
      outcomeNotes: serializer.fromJson<String?>(json['outcome_notes']),
      anesthesiaInfo: serializer.fromJson<String?>(json['anesthesia_info']),
      relatedHospitalizationId: serializer.fromJson<String?>(
        json['related_hospitalization_id'],
      ),
      handledByPersonId: serializer.fromJson<String?>(
        json['handled_by_person_id'],
      ),
      createdAt: serializer.fromJson<String>(json['created_at']),
      lastEditedAt: serializer.fromJson<String>(json['last_edited_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pet_id': serializer.toJson<String>(petId),
      'procedure_name': serializer.toJson<String>(procedureName),
      'date': serializer.toJson<String>(date),
      'provider': serializer.toJson<String?>(provider),
      'outcome_notes': serializer.toJson<String?>(outcomeNotes),
      'anesthesia_info': serializer.toJson<String?>(anesthesiaInfo),
      'related_hospitalization_id': serializer.toJson<String?>(
        relatedHospitalizationId,
      ),
      'handled_by_person_id': serializer.toJson<String?>(handledByPersonId),
      'created_at': serializer.toJson<String>(createdAt),
      'last_edited_at': serializer.toJson<String>(lastEditedAt),
    };
  }

  ProceduresSurgery copyWith({
    String? id,
    String? petId,
    String? procedureName,
    String? date,
    Value<String?> provider = const Value.absent(),
    Value<String?> outcomeNotes = const Value.absent(),
    Value<String?> anesthesiaInfo = const Value.absent(),
    Value<String?> relatedHospitalizationId = const Value.absent(),
    Value<String?> handledByPersonId = const Value.absent(),
    String? createdAt,
    String? lastEditedAt,
  }) => ProceduresSurgery(
    id: id ?? this.id,
    petId: petId ?? this.petId,
    procedureName: procedureName ?? this.procedureName,
    date: date ?? this.date,
    provider: provider.present ? provider.value : this.provider,
    outcomeNotes: outcomeNotes.present ? outcomeNotes.value : this.outcomeNotes,
    anesthesiaInfo: anesthesiaInfo.present
        ? anesthesiaInfo.value
        : this.anesthesiaInfo,
    relatedHospitalizationId: relatedHospitalizationId.present
        ? relatedHospitalizationId.value
        : this.relatedHospitalizationId,
    handledByPersonId: handledByPersonId.present
        ? handledByPersonId.value
        : this.handledByPersonId,
    createdAt: createdAt ?? this.createdAt,
    lastEditedAt: lastEditedAt ?? this.lastEditedAt,
  );
  ProceduresSurgery copyWithCompanion(ProceduresSurgeriesCompanion data) {
    return ProceduresSurgery(
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      procedureName: data.procedureName.present
          ? data.procedureName.value
          : this.procedureName,
      date: data.date.present ? data.date.value : this.date,
      provider: data.provider.present ? data.provider.value : this.provider,
      outcomeNotes: data.outcomeNotes.present
          ? data.outcomeNotes.value
          : this.outcomeNotes,
      anesthesiaInfo: data.anesthesiaInfo.present
          ? data.anesthesiaInfo.value
          : this.anesthesiaInfo,
      relatedHospitalizationId: data.relatedHospitalizationId.present
          ? data.relatedHospitalizationId.value
          : this.relatedHospitalizationId,
      handledByPersonId: data.handledByPersonId.present
          ? data.handledByPersonId.value
          : this.handledByPersonId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastEditedAt: data.lastEditedAt.present
          ? data.lastEditedAt.value
          : this.lastEditedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProceduresSurgery(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('procedureName: $procedureName, ')
          ..write('date: $date, ')
          ..write('provider: $provider, ')
          ..write('outcomeNotes: $outcomeNotes, ')
          ..write('anesthesiaInfo: $anesthesiaInfo, ')
          ..write('relatedHospitalizationId: $relatedHospitalizationId, ')
          ..write('handledByPersonId: $handledByPersonId, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    petId,
    procedureName,
    date,
    provider,
    outcomeNotes,
    anesthesiaInfo,
    relatedHospitalizationId,
    handledByPersonId,
    createdAt,
    lastEditedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProceduresSurgery &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.procedureName == this.procedureName &&
          other.date == this.date &&
          other.provider == this.provider &&
          other.outcomeNotes == this.outcomeNotes &&
          other.anesthesiaInfo == this.anesthesiaInfo &&
          other.relatedHospitalizationId == this.relatedHospitalizationId &&
          other.handledByPersonId == this.handledByPersonId &&
          other.createdAt == this.createdAt &&
          other.lastEditedAt == this.lastEditedAt);
}

class ProceduresSurgeriesCompanion extends UpdateCompanion<ProceduresSurgery> {
  final Value<String> id;
  final Value<String> petId;
  final Value<String> procedureName;
  final Value<String> date;
  final Value<String?> provider;
  final Value<String?> outcomeNotes;
  final Value<String?> anesthesiaInfo;
  final Value<String?> relatedHospitalizationId;
  final Value<String?> handledByPersonId;
  final Value<String> createdAt;
  final Value<String> lastEditedAt;
  final Value<int> rowid;
  const ProceduresSurgeriesCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.procedureName = const Value.absent(),
    this.date = const Value.absent(),
    this.provider = const Value.absent(),
    this.outcomeNotes = const Value.absent(),
    this.anesthesiaInfo = const Value.absent(),
    this.relatedHospitalizationId = const Value.absent(),
    this.handledByPersonId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastEditedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProceduresSurgeriesCompanion.insert({
    required String id,
    required String petId,
    required String procedureName,
    required String date,
    this.provider = const Value.absent(),
    this.outcomeNotes = const Value.absent(),
    this.anesthesiaInfo = const Value.absent(),
    this.relatedHospitalizationId = const Value.absent(),
    this.handledByPersonId = const Value.absent(),
    required String createdAt,
    required String lastEditedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId),
       procedureName = Value(procedureName),
       date = Value(date),
       createdAt = Value(createdAt),
       lastEditedAt = Value(lastEditedAt);
  static Insertable<ProceduresSurgery> custom({
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? procedureName,
    Expression<String>? date,
    Expression<String>? provider,
    Expression<String>? outcomeNotes,
    Expression<String>? anesthesiaInfo,
    Expression<String>? relatedHospitalizationId,
    Expression<String>? handledByPersonId,
    Expression<String>? createdAt,
    Expression<String>? lastEditedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (procedureName != null) 'procedure_name': procedureName,
      if (date != null) 'date': date,
      if (provider != null) 'provider': provider,
      if (outcomeNotes != null) 'outcome_notes': outcomeNotes,
      if (anesthesiaInfo != null) 'anesthesia_info': anesthesiaInfo,
      if (relatedHospitalizationId != null)
        'related_hospitalization_id': relatedHospitalizationId,
      if (handledByPersonId != null) 'handled_by_person_id': handledByPersonId,
      if (createdAt != null) 'created_at': createdAt,
      if (lastEditedAt != null) 'last_edited_at': lastEditedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProceduresSurgeriesCompanion copyWith({
    Value<String>? id,
    Value<String>? petId,
    Value<String>? procedureName,
    Value<String>? date,
    Value<String?>? provider,
    Value<String?>? outcomeNotes,
    Value<String?>? anesthesiaInfo,
    Value<String?>? relatedHospitalizationId,
    Value<String?>? handledByPersonId,
    Value<String>? createdAt,
    Value<String>? lastEditedAt,
    Value<int>? rowid,
  }) {
    return ProceduresSurgeriesCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      procedureName: procedureName ?? this.procedureName,
      date: date ?? this.date,
      provider: provider ?? this.provider,
      outcomeNotes: outcomeNotes ?? this.outcomeNotes,
      anesthesiaInfo: anesthesiaInfo ?? this.anesthesiaInfo,
      relatedHospitalizationId:
          relatedHospitalizationId ?? this.relatedHospitalizationId,
      handledByPersonId: handledByPersonId ?? this.handledByPersonId,
      createdAt: createdAt ?? this.createdAt,
      lastEditedAt: lastEditedAt ?? this.lastEditedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (procedureName.present) {
      map['procedure_name'] = Variable<String>(procedureName.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (provider.present) {
      map['provider'] = Variable<String>(provider.value);
    }
    if (outcomeNotes.present) {
      map['outcome_notes'] = Variable<String>(outcomeNotes.value);
    }
    if (anesthesiaInfo.present) {
      map['anesthesia_info'] = Variable<String>(anesthesiaInfo.value);
    }
    if (relatedHospitalizationId.present) {
      map['related_hospitalization_id'] = Variable<String>(
        relatedHospitalizationId.value,
      );
    }
    if (handledByPersonId.present) {
      map['handled_by_person_id'] = Variable<String>(handledByPersonId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (lastEditedAt.present) {
      map['last_edited_at'] = Variable<String>(lastEditedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProceduresSurgeriesCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('procedureName: $procedureName, ')
          ..write('date: $date, ')
          ..write('provider: $provider, ')
          ..write('outcomeNotes: $outcomeNotes, ')
          ..write('anesthesiaInfo: $anesthesiaInfo, ')
          ..write('relatedHospitalizationId: $relatedHospitalizationId, ')
          ..write('handledByPersonId: $handledByPersonId, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class IllnessCustomEvents extends Table
    with TableInfo<IllnessCustomEvents, IllnessCustomEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  IllnessCustomEvents(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES pets(id)',
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _providerMeta = const VerificationMeta(
    'provider',
  );
  late final GeneratedColumn<String> provider = GeneratedColumn<String>(
    'provider',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _relatedAppointmentIdMeta =
      const VerificationMeta('relatedAppointmentId');
  late final GeneratedColumn<String> relatedAppointmentId =
      GeneratedColumn<String>(
        'related_appointment_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: 'NULL REFERENCES vet_appointments(id)',
      );
  static const VerificationMeta _handledByPersonIdMeta = const VerificationMeta(
    'handledByPersonId',
  );
  late final GeneratedColumn<String> handledByPersonId =
      GeneratedColumn<String>(
        'handled_by_person_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: 'NULL REFERENCES people(id)',
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _lastEditedAtMeta = const VerificationMeta(
    'lastEditedAt',
  );
  late final GeneratedColumn<String> lastEditedAt = GeneratedColumn<String>(
    'last_edited_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    petId,
    title,
    date,
    description,
    provider,
    status,
    relatedAppointmentId,
    handledByPersonId,
    createdAt,
    lastEditedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'illness_custom_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<IllnessCustomEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('provider')) {
      context.handle(
        _providerMeta,
        provider.isAcceptableOrUnknown(data['provider']!, _providerMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('related_appointment_id')) {
      context.handle(
        _relatedAppointmentIdMeta,
        relatedAppointmentId.isAcceptableOrUnknown(
          data['related_appointment_id']!,
          _relatedAppointmentIdMeta,
        ),
      );
    }
    if (data.containsKey('handled_by_person_id')) {
      context.handle(
        _handledByPersonIdMeta,
        handledByPersonId.isAcceptableOrUnknown(
          data['handled_by_person_id']!,
          _handledByPersonIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_edited_at')) {
      context.handle(
        _lastEditedAtMeta,
        lastEditedAt.isAcceptableOrUnknown(
          data['last_edited_at']!,
          _lastEditedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastEditedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IllnessCustomEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IllnessCustomEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      provider: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
      relatedAppointmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_appointment_id'],
      ),
      handledByPersonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}handled_by_person_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      lastEditedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_edited_at'],
      )!,
    );
  }

  @override
  IllnessCustomEvents createAlias(String alias) {
    return IllnessCustomEvents(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class IllnessCustomEvent extends DataClass
    implements Insertable<IllnessCustomEvent> {
  final String id;
  final String petId;
  final String title;
  final String date;
  final String? description;
  final String? provider;
  final String? status;
  final String? relatedAppointmentId;
  final String? handledByPersonId;
  final String createdAt;
  final String lastEditedAt;
  const IllnessCustomEvent({
    required this.id,
    required this.petId,
    required this.title,
    required this.date,
    this.description,
    this.provider,
    this.status,
    this.relatedAppointmentId,
    this.handledByPersonId,
    required this.createdAt,
    required this.lastEditedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    map['title'] = Variable<String>(title);
    map['date'] = Variable<String>(date);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || provider != null) {
      map['provider'] = Variable<String>(provider);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || relatedAppointmentId != null) {
      map['related_appointment_id'] = Variable<String>(relatedAppointmentId);
    }
    if (!nullToAbsent || handledByPersonId != null) {
      map['handled_by_person_id'] = Variable<String>(handledByPersonId);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['last_edited_at'] = Variable<String>(lastEditedAt);
    return map;
  }

  IllnessCustomEventsCompanion toCompanion(bool nullToAbsent) {
    return IllnessCustomEventsCompanion(
      id: Value(id),
      petId: Value(petId),
      title: Value(title),
      date: Value(date),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      provider: provider == null && nullToAbsent
          ? const Value.absent()
          : Value(provider),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      relatedAppointmentId: relatedAppointmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedAppointmentId),
      handledByPersonId: handledByPersonId == null && nullToAbsent
          ? const Value.absent()
          : Value(handledByPersonId),
      createdAt: Value(createdAt),
      lastEditedAt: Value(lastEditedAt),
    );
  }

  factory IllnessCustomEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IllnessCustomEvent(
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['pet_id']),
      title: serializer.fromJson<String>(json['title']),
      date: serializer.fromJson<String>(json['date']),
      description: serializer.fromJson<String?>(json['description']),
      provider: serializer.fromJson<String?>(json['provider']),
      status: serializer.fromJson<String?>(json['status']),
      relatedAppointmentId: serializer.fromJson<String?>(
        json['related_appointment_id'],
      ),
      handledByPersonId: serializer.fromJson<String?>(
        json['handled_by_person_id'],
      ),
      createdAt: serializer.fromJson<String>(json['created_at']),
      lastEditedAt: serializer.fromJson<String>(json['last_edited_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pet_id': serializer.toJson<String>(petId),
      'title': serializer.toJson<String>(title),
      'date': serializer.toJson<String>(date),
      'description': serializer.toJson<String?>(description),
      'provider': serializer.toJson<String?>(provider),
      'status': serializer.toJson<String?>(status),
      'related_appointment_id': serializer.toJson<String?>(
        relatedAppointmentId,
      ),
      'handled_by_person_id': serializer.toJson<String?>(handledByPersonId),
      'created_at': serializer.toJson<String>(createdAt),
      'last_edited_at': serializer.toJson<String>(lastEditedAt),
    };
  }

  IllnessCustomEvent copyWith({
    String? id,
    String? petId,
    String? title,
    String? date,
    Value<String?> description = const Value.absent(),
    Value<String?> provider = const Value.absent(),
    Value<String?> status = const Value.absent(),
    Value<String?> relatedAppointmentId = const Value.absent(),
    Value<String?> handledByPersonId = const Value.absent(),
    String? createdAt,
    String? lastEditedAt,
  }) => IllnessCustomEvent(
    id: id ?? this.id,
    petId: petId ?? this.petId,
    title: title ?? this.title,
    date: date ?? this.date,
    description: description.present ? description.value : this.description,
    provider: provider.present ? provider.value : this.provider,
    status: status.present ? status.value : this.status,
    relatedAppointmentId: relatedAppointmentId.present
        ? relatedAppointmentId.value
        : this.relatedAppointmentId,
    handledByPersonId: handledByPersonId.present
        ? handledByPersonId.value
        : this.handledByPersonId,
    createdAt: createdAt ?? this.createdAt,
    lastEditedAt: lastEditedAt ?? this.lastEditedAt,
  );
  IllnessCustomEvent copyWithCompanion(IllnessCustomEventsCompanion data) {
    return IllnessCustomEvent(
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      title: data.title.present ? data.title.value : this.title,
      date: data.date.present ? data.date.value : this.date,
      description: data.description.present
          ? data.description.value
          : this.description,
      provider: data.provider.present ? data.provider.value : this.provider,
      status: data.status.present ? data.status.value : this.status,
      relatedAppointmentId: data.relatedAppointmentId.present
          ? data.relatedAppointmentId.value
          : this.relatedAppointmentId,
      handledByPersonId: data.handledByPersonId.present
          ? data.handledByPersonId.value
          : this.handledByPersonId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastEditedAt: data.lastEditedAt.present
          ? data.lastEditedAt.value
          : this.lastEditedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IllnessCustomEvent(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('title: $title, ')
          ..write('date: $date, ')
          ..write('description: $description, ')
          ..write('provider: $provider, ')
          ..write('status: $status, ')
          ..write('relatedAppointmentId: $relatedAppointmentId, ')
          ..write('handledByPersonId: $handledByPersonId, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    petId,
    title,
    date,
    description,
    provider,
    status,
    relatedAppointmentId,
    handledByPersonId,
    createdAt,
    lastEditedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IllnessCustomEvent &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.title == this.title &&
          other.date == this.date &&
          other.description == this.description &&
          other.provider == this.provider &&
          other.status == this.status &&
          other.relatedAppointmentId == this.relatedAppointmentId &&
          other.handledByPersonId == this.handledByPersonId &&
          other.createdAt == this.createdAt &&
          other.lastEditedAt == this.lastEditedAt);
}

class IllnessCustomEventsCompanion extends UpdateCompanion<IllnessCustomEvent> {
  final Value<String> id;
  final Value<String> petId;
  final Value<String> title;
  final Value<String> date;
  final Value<String?> description;
  final Value<String?> provider;
  final Value<String?> status;
  final Value<String?> relatedAppointmentId;
  final Value<String?> handledByPersonId;
  final Value<String> createdAt;
  final Value<String> lastEditedAt;
  final Value<int> rowid;
  const IllnessCustomEventsCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.title = const Value.absent(),
    this.date = const Value.absent(),
    this.description = const Value.absent(),
    this.provider = const Value.absent(),
    this.status = const Value.absent(),
    this.relatedAppointmentId = const Value.absent(),
    this.handledByPersonId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastEditedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IllnessCustomEventsCompanion.insert({
    required String id,
    required String petId,
    required String title,
    required String date,
    this.description = const Value.absent(),
    this.provider = const Value.absent(),
    this.status = const Value.absent(),
    this.relatedAppointmentId = const Value.absent(),
    this.handledByPersonId = const Value.absent(),
    required String createdAt,
    required String lastEditedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId),
       title = Value(title),
       date = Value(date),
       createdAt = Value(createdAt),
       lastEditedAt = Value(lastEditedAt);
  static Insertable<IllnessCustomEvent> custom({
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? title,
    Expression<String>? date,
    Expression<String>? description,
    Expression<String>? provider,
    Expression<String>? status,
    Expression<String>? relatedAppointmentId,
    Expression<String>? handledByPersonId,
    Expression<String>? createdAt,
    Expression<String>? lastEditedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (title != null) 'title': title,
      if (date != null) 'date': date,
      if (description != null) 'description': description,
      if (provider != null) 'provider': provider,
      if (status != null) 'status': status,
      if (relatedAppointmentId != null)
        'related_appointment_id': relatedAppointmentId,
      if (handledByPersonId != null) 'handled_by_person_id': handledByPersonId,
      if (createdAt != null) 'created_at': createdAt,
      if (lastEditedAt != null) 'last_edited_at': lastEditedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IllnessCustomEventsCompanion copyWith({
    Value<String>? id,
    Value<String>? petId,
    Value<String>? title,
    Value<String>? date,
    Value<String?>? description,
    Value<String?>? provider,
    Value<String?>? status,
    Value<String?>? relatedAppointmentId,
    Value<String?>? handledByPersonId,
    Value<String>? createdAt,
    Value<String>? lastEditedAt,
    Value<int>? rowid,
  }) {
    return IllnessCustomEventsCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      title: title ?? this.title,
      date: date ?? this.date,
      description: description ?? this.description,
      provider: provider ?? this.provider,
      status: status ?? this.status,
      relatedAppointmentId: relatedAppointmentId ?? this.relatedAppointmentId,
      handledByPersonId: handledByPersonId ?? this.handledByPersonId,
      createdAt: createdAt ?? this.createdAt,
      lastEditedAt: lastEditedAt ?? this.lastEditedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (provider.present) {
      map['provider'] = Variable<String>(provider.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (relatedAppointmentId.present) {
      map['related_appointment_id'] = Variable<String>(
        relatedAppointmentId.value,
      );
    }
    if (handledByPersonId.present) {
      map['handled_by_person_id'] = Variable<String>(handledByPersonId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (lastEditedAt.present) {
      map['last_edited_at'] = Variable<String>(lastEditedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IllnessCustomEventsCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('title: $title, ')
          ..write('date: $date, ')
          ..write('description: $description, ')
          ..write('provider: $provider, ')
          ..write('status: $status, ')
          ..write('relatedAppointmentId: $relatedAppointmentId, ')
          ..write('handledByPersonId: $handledByPersonId, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Vaccinations extends Table with TableInfo<Vaccinations, Vaccination> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Vaccinations(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES pets(id)',
  );
  static const VerificationMeta _vaccineNameMeta = const VerificationMeta(
    'vaccineName',
  );
  late final GeneratedColumn<String> vaccineName = GeneratedColumn<String>(
    'vaccine_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _dateAdministeredMeta = const VerificationMeta(
    'dateAdministered',
  );
  late final GeneratedColumn<String> dateAdministered = GeneratedColumn<String>(
    'date_administered',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _providerMeta = const VerificationMeta(
    'provider',
  );
  late final GeneratedColumn<String> provider = GeneratedColumn<String>(
    'provider',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _lotNumberMeta = const VerificationMeta(
    'lotNumber',
  );
  late final GeneratedColumn<String> lotNumber = GeneratedColumn<String>(
    'lot_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _nextDueDateMeta = const VerificationMeta(
    'nextDueDate',
  );
  late final GeneratedColumn<String> nextDueDate = GeneratedColumn<String>(
    'next_due_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _handledByPersonIdMeta = const VerificationMeta(
    'handledByPersonId',
  );
  late final GeneratedColumn<String> handledByPersonId =
      GeneratedColumn<String>(
        'handled_by_person_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: 'NULL REFERENCES people(id)',
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _lastEditedAtMeta = const VerificationMeta(
    'lastEditedAt',
  );
  late final GeneratedColumn<String> lastEditedAt = GeneratedColumn<String>(
    'last_edited_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    petId,
    vaccineName,
    dateAdministered,
    provider,
    lotNumber,
    nextDueDate,
    notes,
    handledByPersonId,
    createdAt,
    lastEditedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vaccinations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Vaccination> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('vaccine_name')) {
      context.handle(
        _vaccineNameMeta,
        vaccineName.isAcceptableOrUnknown(
          data['vaccine_name']!,
          _vaccineNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vaccineNameMeta);
    }
    if (data.containsKey('date_administered')) {
      context.handle(
        _dateAdministeredMeta,
        dateAdministered.isAcceptableOrUnknown(
          data['date_administered']!,
          _dateAdministeredMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dateAdministeredMeta);
    }
    if (data.containsKey('provider')) {
      context.handle(
        _providerMeta,
        provider.isAcceptableOrUnknown(data['provider']!, _providerMeta),
      );
    }
    if (data.containsKey('lot_number')) {
      context.handle(
        _lotNumberMeta,
        lotNumber.isAcceptableOrUnknown(data['lot_number']!, _lotNumberMeta),
      );
    }
    if (data.containsKey('next_due_date')) {
      context.handle(
        _nextDueDateMeta,
        nextDueDate.isAcceptableOrUnknown(
          data['next_due_date']!,
          _nextDueDateMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('handled_by_person_id')) {
      context.handle(
        _handledByPersonIdMeta,
        handledByPersonId.isAcceptableOrUnknown(
          data['handled_by_person_id']!,
          _handledByPersonIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_edited_at')) {
      context.handle(
        _lastEditedAtMeta,
        lastEditedAt.isAcceptableOrUnknown(
          data['last_edited_at']!,
          _lastEditedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastEditedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Vaccination map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Vaccination(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      )!,
      vaccineName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vaccine_name'],
      )!,
      dateAdministered: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date_administered'],
      )!,
      provider: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider'],
      ),
      lotNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lot_number'],
      ),
      nextDueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}next_due_date'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      handledByPersonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}handled_by_person_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      lastEditedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_edited_at'],
      )!,
    );
  }

  @override
  Vaccinations createAlias(String alias) {
    return Vaccinations(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CHECK(next_due_date IS NULL OR next_due_date >= date_administered)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class Vaccination extends DataClass implements Insertable<Vaccination> {
  final String id;
  final String petId;
  final String vaccineName;
  final String dateAdministered;
  final String? provider;
  final String? lotNumber;
  final String? nextDueDate;
  final String? notes;
  final String? handledByPersonId;
  final String createdAt;
  final String lastEditedAt;
  const Vaccination({
    required this.id,
    required this.petId,
    required this.vaccineName,
    required this.dateAdministered,
    this.provider,
    this.lotNumber,
    this.nextDueDate,
    this.notes,
    this.handledByPersonId,
    required this.createdAt,
    required this.lastEditedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    map['vaccine_name'] = Variable<String>(vaccineName);
    map['date_administered'] = Variable<String>(dateAdministered);
    if (!nullToAbsent || provider != null) {
      map['provider'] = Variable<String>(provider);
    }
    if (!nullToAbsent || lotNumber != null) {
      map['lot_number'] = Variable<String>(lotNumber);
    }
    if (!nullToAbsent || nextDueDate != null) {
      map['next_due_date'] = Variable<String>(nextDueDate);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || handledByPersonId != null) {
      map['handled_by_person_id'] = Variable<String>(handledByPersonId);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['last_edited_at'] = Variable<String>(lastEditedAt);
    return map;
  }

  VaccinationsCompanion toCompanion(bool nullToAbsent) {
    return VaccinationsCompanion(
      id: Value(id),
      petId: Value(petId),
      vaccineName: Value(vaccineName),
      dateAdministered: Value(dateAdministered),
      provider: provider == null && nullToAbsent
          ? const Value.absent()
          : Value(provider),
      lotNumber: lotNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(lotNumber),
      nextDueDate: nextDueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(nextDueDate),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      handledByPersonId: handledByPersonId == null && nullToAbsent
          ? const Value.absent()
          : Value(handledByPersonId),
      createdAt: Value(createdAt),
      lastEditedAt: Value(lastEditedAt),
    );
  }

  factory Vaccination.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Vaccination(
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['pet_id']),
      vaccineName: serializer.fromJson<String>(json['vaccine_name']),
      dateAdministered: serializer.fromJson<String>(json['date_administered']),
      provider: serializer.fromJson<String?>(json['provider']),
      lotNumber: serializer.fromJson<String?>(json['lot_number']),
      nextDueDate: serializer.fromJson<String?>(json['next_due_date']),
      notes: serializer.fromJson<String?>(json['notes']),
      handledByPersonId: serializer.fromJson<String?>(
        json['handled_by_person_id'],
      ),
      createdAt: serializer.fromJson<String>(json['created_at']),
      lastEditedAt: serializer.fromJson<String>(json['last_edited_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pet_id': serializer.toJson<String>(petId),
      'vaccine_name': serializer.toJson<String>(vaccineName),
      'date_administered': serializer.toJson<String>(dateAdministered),
      'provider': serializer.toJson<String?>(provider),
      'lot_number': serializer.toJson<String?>(lotNumber),
      'next_due_date': serializer.toJson<String?>(nextDueDate),
      'notes': serializer.toJson<String?>(notes),
      'handled_by_person_id': serializer.toJson<String?>(handledByPersonId),
      'created_at': serializer.toJson<String>(createdAt),
      'last_edited_at': serializer.toJson<String>(lastEditedAt),
    };
  }

  Vaccination copyWith({
    String? id,
    String? petId,
    String? vaccineName,
    String? dateAdministered,
    Value<String?> provider = const Value.absent(),
    Value<String?> lotNumber = const Value.absent(),
    Value<String?> nextDueDate = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> handledByPersonId = const Value.absent(),
    String? createdAt,
    String? lastEditedAt,
  }) => Vaccination(
    id: id ?? this.id,
    petId: petId ?? this.petId,
    vaccineName: vaccineName ?? this.vaccineName,
    dateAdministered: dateAdministered ?? this.dateAdministered,
    provider: provider.present ? provider.value : this.provider,
    lotNumber: lotNumber.present ? lotNumber.value : this.lotNumber,
    nextDueDate: nextDueDate.present ? nextDueDate.value : this.nextDueDate,
    notes: notes.present ? notes.value : this.notes,
    handledByPersonId: handledByPersonId.present
        ? handledByPersonId.value
        : this.handledByPersonId,
    createdAt: createdAt ?? this.createdAt,
    lastEditedAt: lastEditedAt ?? this.lastEditedAt,
  );
  Vaccination copyWithCompanion(VaccinationsCompanion data) {
    return Vaccination(
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      vaccineName: data.vaccineName.present
          ? data.vaccineName.value
          : this.vaccineName,
      dateAdministered: data.dateAdministered.present
          ? data.dateAdministered.value
          : this.dateAdministered,
      provider: data.provider.present ? data.provider.value : this.provider,
      lotNumber: data.lotNumber.present ? data.lotNumber.value : this.lotNumber,
      nextDueDate: data.nextDueDate.present
          ? data.nextDueDate.value
          : this.nextDueDate,
      notes: data.notes.present ? data.notes.value : this.notes,
      handledByPersonId: data.handledByPersonId.present
          ? data.handledByPersonId.value
          : this.handledByPersonId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastEditedAt: data.lastEditedAt.present
          ? data.lastEditedAt.value
          : this.lastEditedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Vaccination(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('vaccineName: $vaccineName, ')
          ..write('dateAdministered: $dateAdministered, ')
          ..write('provider: $provider, ')
          ..write('lotNumber: $lotNumber, ')
          ..write('nextDueDate: $nextDueDate, ')
          ..write('notes: $notes, ')
          ..write('handledByPersonId: $handledByPersonId, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    petId,
    vaccineName,
    dateAdministered,
    provider,
    lotNumber,
    nextDueDate,
    notes,
    handledByPersonId,
    createdAt,
    lastEditedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Vaccination &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.vaccineName == this.vaccineName &&
          other.dateAdministered == this.dateAdministered &&
          other.provider == this.provider &&
          other.lotNumber == this.lotNumber &&
          other.nextDueDate == this.nextDueDate &&
          other.notes == this.notes &&
          other.handledByPersonId == this.handledByPersonId &&
          other.createdAt == this.createdAt &&
          other.lastEditedAt == this.lastEditedAt);
}

class VaccinationsCompanion extends UpdateCompanion<Vaccination> {
  final Value<String> id;
  final Value<String> petId;
  final Value<String> vaccineName;
  final Value<String> dateAdministered;
  final Value<String?> provider;
  final Value<String?> lotNumber;
  final Value<String?> nextDueDate;
  final Value<String?> notes;
  final Value<String?> handledByPersonId;
  final Value<String> createdAt;
  final Value<String> lastEditedAt;
  final Value<int> rowid;
  const VaccinationsCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.vaccineName = const Value.absent(),
    this.dateAdministered = const Value.absent(),
    this.provider = const Value.absent(),
    this.lotNumber = const Value.absent(),
    this.nextDueDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.handledByPersonId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastEditedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VaccinationsCompanion.insert({
    required String id,
    required String petId,
    required String vaccineName,
    required String dateAdministered,
    this.provider = const Value.absent(),
    this.lotNumber = const Value.absent(),
    this.nextDueDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.handledByPersonId = const Value.absent(),
    required String createdAt,
    required String lastEditedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId),
       vaccineName = Value(vaccineName),
       dateAdministered = Value(dateAdministered),
       createdAt = Value(createdAt),
       lastEditedAt = Value(lastEditedAt);
  static Insertable<Vaccination> custom({
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? vaccineName,
    Expression<String>? dateAdministered,
    Expression<String>? provider,
    Expression<String>? lotNumber,
    Expression<String>? nextDueDate,
    Expression<String>? notes,
    Expression<String>? handledByPersonId,
    Expression<String>? createdAt,
    Expression<String>? lastEditedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (vaccineName != null) 'vaccine_name': vaccineName,
      if (dateAdministered != null) 'date_administered': dateAdministered,
      if (provider != null) 'provider': provider,
      if (lotNumber != null) 'lot_number': lotNumber,
      if (nextDueDate != null) 'next_due_date': nextDueDate,
      if (notes != null) 'notes': notes,
      if (handledByPersonId != null) 'handled_by_person_id': handledByPersonId,
      if (createdAt != null) 'created_at': createdAt,
      if (lastEditedAt != null) 'last_edited_at': lastEditedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VaccinationsCompanion copyWith({
    Value<String>? id,
    Value<String>? petId,
    Value<String>? vaccineName,
    Value<String>? dateAdministered,
    Value<String?>? provider,
    Value<String?>? lotNumber,
    Value<String?>? nextDueDate,
    Value<String?>? notes,
    Value<String?>? handledByPersonId,
    Value<String>? createdAt,
    Value<String>? lastEditedAt,
    Value<int>? rowid,
  }) {
    return VaccinationsCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      vaccineName: vaccineName ?? this.vaccineName,
      dateAdministered: dateAdministered ?? this.dateAdministered,
      provider: provider ?? this.provider,
      lotNumber: lotNumber ?? this.lotNumber,
      nextDueDate: nextDueDate ?? this.nextDueDate,
      notes: notes ?? this.notes,
      handledByPersonId: handledByPersonId ?? this.handledByPersonId,
      createdAt: createdAt ?? this.createdAt,
      lastEditedAt: lastEditedAt ?? this.lastEditedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (vaccineName.present) {
      map['vaccine_name'] = Variable<String>(vaccineName.value);
    }
    if (dateAdministered.present) {
      map['date_administered'] = Variable<String>(dateAdministered.value);
    }
    if (provider.present) {
      map['provider'] = Variable<String>(provider.value);
    }
    if (lotNumber.present) {
      map['lot_number'] = Variable<String>(lotNumber.value);
    }
    if (nextDueDate.present) {
      map['next_due_date'] = Variable<String>(nextDueDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (handledByPersonId.present) {
      map['handled_by_person_id'] = Variable<String>(handledByPersonId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (lastEditedAt.present) {
      map['last_edited_at'] = Variable<String>(lastEditedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VaccinationsCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('vaccineName: $vaccineName, ')
          ..write('dateAdministered: $dateAdministered, ')
          ..write('provider: $provider, ')
          ..write('lotNumber: $lotNumber, ')
          ..write('nextDueDate: $nextDueDate, ')
          ..write('notes: $notes, ')
          ..write('handledByPersonId: $handledByPersonId, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class MicrochipRecords extends Table
    with TableInfo<MicrochipRecords, MicrochipRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MicrochipRecords(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES pets(id)',
  );
  static const VerificationMeta _chipNumberMeta = const VerificationMeta(
    'chipNumber',
  );
  late final GeneratedColumn<String> chipNumber = GeneratedColumn<String>(
    'chip_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _registryProviderMeta = const VerificationMeta(
    'registryProvider',
  );
  late final GeneratedColumn<String> registryProvider = GeneratedColumn<String>(
    'registry_provider',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _dateImplantedMeta = const VerificationMeta(
    'dateImplanted',
  );
  late final GeneratedColumn<String> dateImplanted = GeneratedColumn<String>(
    'date_implanted',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _lastEditedAtMeta = const VerificationMeta(
    'lastEditedAt',
  );
  late final GeneratedColumn<String> lastEditedAt = GeneratedColumn<String>(
    'last_edited_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    petId,
    chipNumber,
    registryProvider,
    dateImplanted,
    notes,
    createdAt,
    lastEditedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'microchip_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<MicrochipRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('chip_number')) {
      context.handle(
        _chipNumberMeta,
        chipNumber.isAcceptableOrUnknown(data['chip_number']!, _chipNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_chipNumberMeta);
    }
    if (data.containsKey('registry_provider')) {
      context.handle(
        _registryProviderMeta,
        registryProvider.isAcceptableOrUnknown(
          data['registry_provider']!,
          _registryProviderMeta,
        ),
      );
    }
    if (data.containsKey('date_implanted')) {
      context.handle(
        _dateImplantedMeta,
        dateImplanted.isAcceptableOrUnknown(
          data['date_implanted']!,
          _dateImplantedMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_edited_at')) {
      context.handle(
        _lastEditedAtMeta,
        lastEditedAt.isAcceptableOrUnknown(
          data['last_edited_at']!,
          _lastEditedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastEditedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MicrochipRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MicrochipRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      )!,
      chipNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chip_number'],
      )!,
      registryProvider: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}registry_provider'],
      ),
      dateImplanted: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date_implanted'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      lastEditedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_edited_at'],
      )!,
    );
  }

  @override
  MicrochipRecords createAlias(String alias) {
    return MicrochipRecords(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class MicrochipRecord extends DataClass implements Insertable<MicrochipRecord> {
  final String id;
  final String petId;
  final String chipNumber;
  final String? registryProvider;
  final String? dateImplanted;
  final String? notes;
  final String createdAt;
  final String lastEditedAt;
  const MicrochipRecord({
    required this.id,
    required this.petId,
    required this.chipNumber,
    this.registryProvider,
    this.dateImplanted,
    this.notes,
    required this.createdAt,
    required this.lastEditedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    map['chip_number'] = Variable<String>(chipNumber);
    if (!nullToAbsent || registryProvider != null) {
      map['registry_provider'] = Variable<String>(registryProvider);
    }
    if (!nullToAbsent || dateImplanted != null) {
      map['date_implanted'] = Variable<String>(dateImplanted);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['last_edited_at'] = Variable<String>(lastEditedAt);
    return map;
  }

  MicrochipRecordsCompanion toCompanion(bool nullToAbsent) {
    return MicrochipRecordsCompanion(
      id: Value(id),
      petId: Value(petId),
      chipNumber: Value(chipNumber),
      registryProvider: registryProvider == null && nullToAbsent
          ? const Value.absent()
          : Value(registryProvider),
      dateImplanted: dateImplanted == null && nullToAbsent
          ? const Value.absent()
          : Value(dateImplanted),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      lastEditedAt: Value(lastEditedAt),
    );
  }

  factory MicrochipRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MicrochipRecord(
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['pet_id']),
      chipNumber: serializer.fromJson<String>(json['chip_number']),
      registryProvider: serializer.fromJson<String?>(json['registry_provider']),
      dateImplanted: serializer.fromJson<String?>(json['date_implanted']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<String>(json['created_at']),
      lastEditedAt: serializer.fromJson<String>(json['last_edited_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pet_id': serializer.toJson<String>(petId),
      'chip_number': serializer.toJson<String>(chipNumber),
      'registry_provider': serializer.toJson<String?>(registryProvider),
      'date_implanted': serializer.toJson<String?>(dateImplanted),
      'notes': serializer.toJson<String?>(notes),
      'created_at': serializer.toJson<String>(createdAt),
      'last_edited_at': serializer.toJson<String>(lastEditedAt),
    };
  }

  MicrochipRecord copyWith({
    String? id,
    String? petId,
    String? chipNumber,
    Value<String?> registryProvider = const Value.absent(),
    Value<String?> dateImplanted = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    String? createdAt,
    String? lastEditedAt,
  }) => MicrochipRecord(
    id: id ?? this.id,
    petId: petId ?? this.petId,
    chipNumber: chipNumber ?? this.chipNumber,
    registryProvider: registryProvider.present
        ? registryProvider.value
        : this.registryProvider,
    dateImplanted: dateImplanted.present
        ? dateImplanted.value
        : this.dateImplanted,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    lastEditedAt: lastEditedAt ?? this.lastEditedAt,
  );
  MicrochipRecord copyWithCompanion(MicrochipRecordsCompanion data) {
    return MicrochipRecord(
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      chipNumber: data.chipNumber.present
          ? data.chipNumber.value
          : this.chipNumber,
      registryProvider: data.registryProvider.present
          ? data.registryProvider.value
          : this.registryProvider,
      dateImplanted: data.dateImplanted.present
          ? data.dateImplanted.value
          : this.dateImplanted,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastEditedAt: data.lastEditedAt.present
          ? data.lastEditedAt.value
          : this.lastEditedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MicrochipRecord(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('chipNumber: $chipNumber, ')
          ..write('registryProvider: $registryProvider, ')
          ..write('dateImplanted: $dateImplanted, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    petId,
    chipNumber,
    registryProvider,
    dateImplanted,
    notes,
    createdAt,
    lastEditedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MicrochipRecord &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.chipNumber == this.chipNumber &&
          other.registryProvider == this.registryProvider &&
          other.dateImplanted == this.dateImplanted &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.lastEditedAt == this.lastEditedAt);
}

class MicrochipRecordsCompanion extends UpdateCompanion<MicrochipRecord> {
  final Value<String> id;
  final Value<String> petId;
  final Value<String> chipNumber;
  final Value<String?> registryProvider;
  final Value<String?> dateImplanted;
  final Value<String?> notes;
  final Value<String> createdAt;
  final Value<String> lastEditedAt;
  final Value<int> rowid;
  const MicrochipRecordsCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.chipNumber = const Value.absent(),
    this.registryProvider = const Value.absent(),
    this.dateImplanted = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastEditedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MicrochipRecordsCompanion.insert({
    required String id,
    required String petId,
    required String chipNumber,
    this.registryProvider = const Value.absent(),
    this.dateImplanted = const Value.absent(),
    this.notes = const Value.absent(),
    required String createdAt,
    required String lastEditedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId),
       chipNumber = Value(chipNumber),
       createdAt = Value(createdAt),
       lastEditedAt = Value(lastEditedAt);
  static Insertable<MicrochipRecord> custom({
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? chipNumber,
    Expression<String>? registryProvider,
    Expression<String>? dateImplanted,
    Expression<String>? notes,
    Expression<String>? createdAt,
    Expression<String>? lastEditedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (chipNumber != null) 'chip_number': chipNumber,
      if (registryProvider != null) 'registry_provider': registryProvider,
      if (dateImplanted != null) 'date_implanted': dateImplanted,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (lastEditedAt != null) 'last_edited_at': lastEditedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MicrochipRecordsCompanion copyWith({
    Value<String>? id,
    Value<String>? petId,
    Value<String>? chipNumber,
    Value<String?>? registryProvider,
    Value<String?>? dateImplanted,
    Value<String?>? notes,
    Value<String>? createdAt,
    Value<String>? lastEditedAt,
    Value<int>? rowid,
  }) {
    return MicrochipRecordsCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      chipNumber: chipNumber ?? this.chipNumber,
      registryProvider: registryProvider ?? this.registryProvider,
      dateImplanted: dateImplanted ?? this.dateImplanted,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      lastEditedAt: lastEditedAt ?? this.lastEditedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (chipNumber.present) {
      map['chip_number'] = Variable<String>(chipNumber.value);
    }
    if (registryProvider.present) {
      map['registry_provider'] = Variable<String>(registryProvider.value);
    }
    if (dateImplanted.present) {
      map['date_implanted'] = Variable<String>(dateImplanted.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (lastEditedAt.present) {
      map['last_edited_at'] = Variable<String>(lastEditedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MicrochipRecordsCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('chipNumber: $chipNumber, ')
          ..write('registryProvider: $registryProvider, ')
          ..write('dateImplanted: $dateImplanted, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Medications extends Table with TableInfo<Medications, Medication> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Medications(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES pets(id)',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _strengthMeta = const VerificationMeta(
    'strength',
  );
  late final GeneratedColumn<String> strength = GeneratedColumn<String>(
    'strength',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _medicationTypeMeta = const VerificationMeta(
    'medicationType',
  );
  late final GeneratedColumn<String> medicationType = GeneratedColumn<String>(
    'medication_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  late final GeneratedColumn<String> startDate = GeneratedColumn<String>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'active\'',
    defaultValue: const CustomExpression('\'active\''),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _handledByPersonIdMeta = const VerificationMeta(
    'handledByPersonId',
  );
  late final GeneratedColumn<String> handledByPersonId =
      GeneratedColumn<String>(
        'handled_by_person_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: 'NULL REFERENCES people(id)',
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _lastEditedAtMeta = const VerificationMeta(
    'lastEditedAt',
  );
  late final GeneratedColumn<String> lastEditedAt = GeneratedColumn<String>(
    'last_edited_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    petId,
    name,
    strength,
    medicationType,
    startDate,
    status,
    notes,
    handledByPersonId,
    createdAt,
    lastEditedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medications';
  @override
  VerificationContext validateIntegrity(
    Insertable<Medication> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('strength')) {
      context.handle(
        _strengthMeta,
        strength.isAcceptableOrUnknown(data['strength']!, _strengthMeta),
      );
    }
    if (data.containsKey('medication_type')) {
      context.handle(
        _medicationTypeMeta,
        medicationType.isAcceptableOrUnknown(
          data['medication_type']!,
          _medicationTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicationTypeMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('handled_by_person_id')) {
      context.handle(
        _handledByPersonIdMeta,
        handledByPersonId.isAcceptableOrUnknown(
          data['handled_by_person_id']!,
          _handledByPersonIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_edited_at')) {
      context.handle(
        _lastEditedAtMeta,
        lastEditedAt.isAcceptableOrUnknown(
          data['last_edited_at']!,
          _lastEditedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastEditedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medication map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Medication(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      strength: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}strength'],
      ),
      medicationType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medication_type'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}start_date'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      handledByPersonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}handled_by_person_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      lastEditedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_edited_at'],
      )!,
    );
  }

  @override
  Medications createAlias(String alias) {
    return Medications(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CHECK(medication_type IN (\'pill\', \'syrup\', \'injection\', \'cream_lotion\'))',
    'CHECK(status IN (\'active\', \'completed\', \'stopped\'))',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class Medication extends DataClass implements Insertable<Medication> {
  final String id;
  final String petId;
  final String name;
  final String? strength;
  final String medicationType;
  final String startDate;
  final String status;
  final String? notes;
  final String? handledByPersonId;
  final String createdAt;
  final String lastEditedAt;
  const Medication({
    required this.id,
    required this.petId,
    required this.name,
    this.strength,
    required this.medicationType,
    required this.startDate,
    required this.status,
    this.notes,
    this.handledByPersonId,
    required this.createdAt,
    required this.lastEditedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || strength != null) {
      map['strength'] = Variable<String>(strength);
    }
    map['medication_type'] = Variable<String>(medicationType);
    map['start_date'] = Variable<String>(startDate);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || handledByPersonId != null) {
      map['handled_by_person_id'] = Variable<String>(handledByPersonId);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['last_edited_at'] = Variable<String>(lastEditedAt);
    return map;
  }

  MedicationsCompanion toCompanion(bool nullToAbsent) {
    return MedicationsCompanion(
      id: Value(id),
      petId: Value(petId),
      name: Value(name),
      strength: strength == null && nullToAbsent
          ? const Value.absent()
          : Value(strength),
      medicationType: Value(medicationType),
      startDate: Value(startDate),
      status: Value(status),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      handledByPersonId: handledByPersonId == null && nullToAbsent
          ? const Value.absent()
          : Value(handledByPersonId),
      createdAt: Value(createdAt),
      lastEditedAt: Value(lastEditedAt),
    );
  }

  factory Medication.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Medication(
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['pet_id']),
      name: serializer.fromJson<String>(json['name']),
      strength: serializer.fromJson<String?>(json['strength']),
      medicationType: serializer.fromJson<String>(json['medication_type']),
      startDate: serializer.fromJson<String>(json['start_date']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String?>(json['notes']),
      handledByPersonId: serializer.fromJson<String?>(
        json['handled_by_person_id'],
      ),
      createdAt: serializer.fromJson<String>(json['created_at']),
      lastEditedAt: serializer.fromJson<String>(json['last_edited_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pet_id': serializer.toJson<String>(petId),
      'name': serializer.toJson<String>(name),
      'strength': serializer.toJson<String?>(strength),
      'medication_type': serializer.toJson<String>(medicationType),
      'start_date': serializer.toJson<String>(startDate),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String?>(notes),
      'handled_by_person_id': serializer.toJson<String?>(handledByPersonId),
      'created_at': serializer.toJson<String>(createdAt),
      'last_edited_at': serializer.toJson<String>(lastEditedAt),
    };
  }

  Medication copyWith({
    String? id,
    String? petId,
    String? name,
    Value<String?> strength = const Value.absent(),
    String? medicationType,
    String? startDate,
    String? status,
    Value<String?> notes = const Value.absent(),
    Value<String?> handledByPersonId = const Value.absent(),
    String? createdAt,
    String? lastEditedAt,
  }) => Medication(
    id: id ?? this.id,
    petId: petId ?? this.petId,
    name: name ?? this.name,
    strength: strength.present ? strength.value : this.strength,
    medicationType: medicationType ?? this.medicationType,
    startDate: startDate ?? this.startDate,
    status: status ?? this.status,
    notes: notes.present ? notes.value : this.notes,
    handledByPersonId: handledByPersonId.present
        ? handledByPersonId.value
        : this.handledByPersonId,
    createdAt: createdAt ?? this.createdAt,
    lastEditedAt: lastEditedAt ?? this.lastEditedAt,
  );
  Medication copyWithCompanion(MedicationsCompanion data) {
    return Medication(
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      name: data.name.present ? data.name.value : this.name,
      strength: data.strength.present ? data.strength.value : this.strength,
      medicationType: data.medicationType.present
          ? data.medicationType.value
          : this.medicationType,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      handledByPersonId: data.handledByPersonId.present
          ? data.handledByPersonId.value
          : this.handledByPersonId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastEditedAt: data.lastEditedAt.present
          ? data.lastEditedAt.value
          : this.lastEditedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Medication(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('name: $name, ')
          ..write('strength: $strength, ')
          ..write('medicationType: $medicationType, ')
          ..write('startDate: $startDate, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('handledByPersonId: $handledByPersonId, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    petId,
    name,
    strength,
    medicationType,
    startDate,
    status,
    notes,
    handledByPersonId,
    createdAt,
    lastEditedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medication &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.name == this.name &&
          other.strength == this.strength &&
          other.medicationType == this.medicationType &&
          other.startDate == this.startDate &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.handledByPersonId == this.handledByPersonId &&
          other.createdAt == this.createdAt &&
          other.lastEditedAt == this.lastEditedAt);
}

class MedicationsCompanion extends UpdateCompanion<Medication> {
  final Value<String> id;
  final Value<String> petId;
  final Value<String> name;
  final Value<String?> strength;
  final Value<String> medicationType;
  final Value<String> startDate;
  final Value<String> status;
  final Value<String?> notes;
  final Value<String?> handledByPersonId;
  final Value<String> createdAt;
  final Value<String> lastEditedAt;
  final Value<int> rowid;
  const MedicationsCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.name = const Value.absent(),
    this.strength = const Value.absent(),
    this.medicationType = const Value.absent(),
    this.startDate = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.handledByPersonId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastEditedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicationsCompanion.insert({
    required String id,
    required String petId,
    required String name,
    this.strength = const Value.absent(),
    required String medicationType,
    required String startDate,
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.handledByPersonId = const Value.absent(),
    required String createdAt,
    required String lastEditedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId),
       name = Value(name),
       medicationType = Value(medicationType),
       startDate = Value(startDate),
       createdAt = Value(createdAt),
       lastEditedAt = Value(lastEditedAt);
  static Insertable<Medication> custom({
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? name,
    Expression<String>? strength,
    Expression<String>? medicationType,
    Expression<String>? startDate,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<String>? handledByPersonId,
    Expression<String>? createdAt,
    Expression<String>? lastEditedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (name != null) 'name': name,
      if (strength != null) 'strength': strength,
      if (medicationType != null) 'medication_type': medicationType,
      if (startDate != null) 'start_date': startDate,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (handledByPersonId != null) 'handled_by_person_id': handledByPersonId,
      if (createdAt != null) 'created_at': createdAt,
      if (lastEditedAt != null) 'last_edited_at': lastEditedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicationsCompanion copyWith({
    Value<String>? id,
    Value<String>? petId,
    Value<String>? name,
    Value<String?>? strength,
    Value<String>? medicationType,
    Value<String>? startDate,
    Value<String>? status,
    Value<String?>? notes,
    Value<String?>? handledByPersonId,
    Value<String>? createdAt,
    Value<String>? lastEditedAt,
    Value<int>? rowid,
  }) {
    return MedicationsCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      name: name ?? this.name,
      strength: strength ?? this.strength,
      medicationType: medicationType ?? this.medicationType,
      startDate: startDate ?? this.startDate,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      handledByPersonId: handledByPersonId ?? this.handledByPersonId,
      createdAt: createdAt ?? this.createdAt,
      lastEditedAt: lastEditedAt ?? this.lastEditedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (strength.present) {
      map['strength'] = Variable<String>(strength.value);
    }
    if (medicationType.present) {
      map['medication_type'] = Variable<String>(medicationType.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<String>(startDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (handledByPersonId.present) {
      map['handled_by_person_id'] = Variable<String>(handledByPersonId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (lastEditedAt.present) {
      map['last_edited_at'] = Variable<String>(lastEditedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationsCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('name: $name, ')
          ..write('strength: $strength, ')
          ..write('medicationType: $medicationType, ')
          ..write('startDate: $startDate, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('handledByPersonId: $handledByPersonId, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class MedicationPhases extends Table
    with TableInfo<MedicationPhases, MedicationPhase> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MedicationPhases(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _medicationIdMeta = const VerificationMeta(
    'medicationId',
  );
  late final GeneratedColumn<String> medicationId = GeneratedColumn<String>(
    'medication_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES medications(id)',
  );
  static const VerificationMeta _phaseOrderMeta = const VerificationMeta(
    'phaseOrder',
  );
  late final GeneratedColumn<int> phaseOrder = GeneratedColumn<int>(
    'phase_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _doseAmountMeta = const VerificationMeta(
    'doseAmount',
  );
  late final GeneratedColumn<String> doseAmount = GeneratedColumn<String>(
    'dose_amount',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _timesPerDayMeta = const VerificationMeta(
    'timesPerDay',
  );
  late final GeneratedColumn<int> timesPerDay = GeneratedColumn<int>(
    'times_per_day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _doseTimesMeta = const VerificationMeta(
    'doseTimes',
  );
  late final GeneratedColumn<String> doseTimes = GeneratedColumn<String>(
    'dose_times',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _durationTypeMeta = const VerificationMeta(
    'durationType',
  );
  late final GeneratedColumn<String> durationType = GeneratedColumn<String>(
    'duration_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _durationDaysMeta = const VerificationMeta(
    'durationDays',
  );
  late final GeneratedColumn<int> durationDays = GeneratedColumn<int>(
    'duration_days',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _durationDoseCountMeta = const VerificationMeta(
    'durationDoseCount',
  );
  late final GeneratedColumn<int> durationDoseCount = GeneratedColumn<int>(
    'duration_dose_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    medicationId,
    phaseOrder,
    doseAmount,
    timesPerDay,
    doseTimes,
    durationType,
    durationDays,
    durationDoseCount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medication_phases';
  @override
  VerificationContext validateIntegrity(
    Insertable<MedicationPhase> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('medication_id')) {
      context.handle(
        _medicationIdMeta,
        medicationId.isAcceptableOrUnknown(
          data['medication_id']!,
          _medicationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicationIdMeta);
    }
    if (data.containsKey('phase_order')) {
      context.handle(
        _phaseOrderMeta,
        phaseOrder.isAcceptableOrUnknown(data['phase_order']!, _phaseOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_phaseOrderMeta);
    }
    if (data.containsKey('dose_amount')) {
      context.handle(
        _doseAmountMeta,
        doseAmount.isAcceptableOrUnknown(data['dose_amount']!, _doseAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_doseAmountMeta);
    }
    if (data.containsKey('times_per_day')) {
      context.handle(
        _timesPerDayMeta,
        timesPerDay.isAcceptableOrUnknown(
          data['times_per_day']!,
          _timesPerDayMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_timesPerDayMeta);
    }
    if (data.containsKey('dose_times')) {
      context.handle(
        _doseTimesMeta,
        doseTimes.isAcceptableOrUnknown(data['dose_times']!, _doseTimesMeta),
      );
    }
    if (data.containsKey('duration_type')) {
      context.handle(
        _durationTypeMeta,
        durationType.isAcceptableOrUnknown(
          data['duration_type']!,
          _durationTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_durationTypeMeta);
    }
    if (data.containsKey('duration_days')) {
      context.handle(
        _durationDaysMeta,
        durationDays.isAcceptableOrUnknown(
          data['duration_days']!,
          _durationDaysMeta,
        ),
      );
    }
    if (data.containsKey('duration_dose_count')) {
      context.handle(
        _durationDoseCountMeta,
        durationDoseCount.isAcceptableOrUnknown(
          data['duration_dose_count']!,
          _durationDoseCountMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicationPhase map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicationPhase(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      medicationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medication_id'],
      )!,
      phaseOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}phase_order'],
      )!,
      doseAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dose_amount'],
      )!,
      timesPerDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}times_per_day'],
      )!,
      doseTimes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dose_times'],
      ),
      durationType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}duration_type'],
      )!,
      durationDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_days'],
      ),
      durationDoseCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_dose_count'],
      ),
    );
  }

  @override
  MedicationPhases createAlias(String alias) {
    return MedicationPhases(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CHECK(duration_type IN (\'time_based\', \'dose_based\'))',
    'CHECK(times_per_day >= 1)',
    'CHECK((duration_type = \'time_based\' AND duration_days IS NOT NULL AND duration_dose_count IS NULL)OR(duration_type = \'dose_based\' AND duration_dose_count IS NOT NULL AND duration_days IS NULL))',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class MedicationPhase extends DataClass implements Insertable<MedicationPhase> {
  final String id;
  final String medicationId;
  final int phaseOrder;
  final String doseAmount;
  final int timesPerDay;
  final String? doseTimes;
  final String durationType;
  final int? durationDays;
  final int? durationDoseCount;
  const MedicationPhase({
    required this.id,
    required this.medicationId,
    required this.phaseOrder,
    required this.doseAmount,
    required this.timesPerDay,
    this.doseTimes,
    required this.durationType,
    this.durationDays,
    this.durationDoseCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['medication_id'] = Variable<String>(medicationId);
    map['phase_order'] = Variable<int>(phaseOrder);
    map['dose_amount'] = Variable<String>(doseAmount);
    map['times_per_day'] = Variable<int>(timesPerDay);
    if (!nullToAbsent || doseTimes != null) {
      map['dose_times'] = Variable<String>(doseTimes);
    }
    map['duration_type'] = Variable<String>(durationType);
    if (!nullToAbsent || durationDays != null) {
      map['duration_days'] = Variable<int>(durationDays);
    }
    if (!nullToAbsent || durationDoseCount != null) {
      map['duration_dose_count'] = Variable<int>(durationDoseCount);
    }
    return map;
  }

  MedicationPhasesCompanion toCompanion(bool nullToAbsent) {
    return MedicationPhasesCompanion(
      id: Value(id),
      medicationId: Value(medicationId),
      phaseOrder: Value(phaseOrder),
      doseAmount: Value(doseAmount),
      timesPerDay: Value(timesPerDay),
      doseTimes: doseTimes == null && nullToAbsent
          ? const Value.absent()
          : Value(doseTimes),
      durationType: Value(durationType),
      durationDays: durationDays == null && nullToAbsent
          ? const Value.absent()
          : Value(durationDays),
      durationDoseCount: durationDoseCount == null && nullToAbsent
          ? const Value.absent()
          : Value(durationDoseCount),
    );
  }

  factory MedicationPhase.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicationPhase(
      id: serializer.fromJson<String>(json['id']),
      medicationId: serializer.fromJson<String>(json['medication_id']),
      phaseOrder: serializer.fromJson<int>(json['phase_order']),
      doseAmount: serializer.fromJson<String>(json['dose_amount']),
      timesPerDay: serializer.fromJson<int>(json['times_per_day']),
      doseTimes: serializer.fromJson<String?>(json['dose_times']),
      durationType: serializer.fromJson<String>(json['duration_type']),
      durationDays: serializer.fromJson<int?>(json['duration_days']),
      durationDoseCount: serializer.fromJson<int?>(json['duration_dose_count']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'medication_id': serializer.toJson<String>(medicationId),
      'phase_order': serializer.toJson<int>(phaseOrder),
      'dose_amount': serializer.toJson<String>(doseAmount),
      'times_per_day': serializer.toJson<int>(timesPerDay),
      'dose_times': serializer.toJson<String?>(doseTimes),
      'duration_type': serializer.toJson<String>(durationType),
      'duration_days': serializer.toJson<int?>(durationDays),
      'duration_dose_count': serializer.toJson<int?>(durationDoseCount),
    };
  }

  MedicationPhase copyWith({
    String? id,
    String? medicationId,
    int? phaseOrder,
    String? doseAmount,
    int? timesPerDay,
    Value<String?> doseTimes = const Value.absent(),
    String? durationType,
    Value<int?> durationDays = const Value.absent(),
    Value<int?> durationDoseCount = const Value.absent(),
  }) => MedicationPhase(
    id: id ?? this.id,
    medicationId: medicationId ?? this.medicationId,
    phaseOrder: phaseOrder ?? this.phaseOrder,
    doseAmount: doseAmount ?? this.doseAmount,
    timesPerDay: timesPerDay ?? this.timesPerDay,
    doseTimes: doseTimes.present ? doseTimes.value : this.doseTimes,
    durationType: durationType ?? this.durationType,
    durationDays: durationDays.present ? durationDays.value : this.durationDays,
    durationDoseCount: durationDoseCount.present
        ? durationDoseCount.value
        : this.durationDoseCount,
  );
  MedicationPhase copyWithCompanion(MedicationPhasesCompanion data) {
    return MedicationPhase(
      id: data.id.present ? data.id.value : this.id,
      medicationId: data.medicationId.present
          ? data.medicationId.value
          : this.medicationId,
      phaseOrder: data.phaseOrder.present
          ? data.phaseOrder.value
          : this.phaseOrder,
      doseAmount: data.doseAmount.present
          ? data.doseAmount.value
          : this.doseAmount,
      timesPerDay: data.timesPerDay.present
          ? data.timesPerDay.value
          : this.timesPerDay,
      doseTimes: data.doseTimes.present ? data.doseTimes.value : this.doseTimes,
      durationType: data.durationType.present
          ? data.durationType.value
          : this.durationType,
      durationDays: data.durationDays.present
          ? data.durationDays.value
          : this.durationDays,
      durationDoseCount: data.durationDoseCount.present
          ? data.durationDoseCount.value
          : this.durationDoseCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedicationPhase(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('phaseOrder: $phaseOrder, ')
          ..write('doseAmount: $doseAmount, ')
          ..write('timesPerDay: $timesPerDay, ')
          ..write('doseTimes: $doseTimes, ')
          ..write('durationType: $durationType, ')
          ..write('durationDays: $durationDays, ')
          ..write('durationDoseCount: $durationDoseCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    medicationId,
    phaseOrder,
    doseAmount,
    timesPerDay,
    doseTimes,
    durationType,
    durationDays,
    durationDoseCount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicationPhase &&
          other.id == this.id &&
          other.medicationId == this.medicationId &&
          other.phaseOrder == this.phaseOrder &&
          other.doseAmount == this.doseAmount &&
          other.timesPerDay == this.timesPerDay &&
          other.doseTimes == this.doseTimes &&
          other.durationType == this.durationType &&
          other.durationDays == this.durationDays &&
          other.durationDoseCount == this.durationDoseCount);
}

class MedicationPhasesCompanion extends UpdateCompanion<MedicationPhase> {
  final Value<String> id;
  final Value<String> medicationId;
  final Value<int> phaseOrder;
  final Value<String> doseAmount;
  final Value<int> timesPerDay;
  final Value<String?> doseTimes;
  final Value<String> durationType;
  final Value<int?> durationDays;
  final Value<int?> durationDoseCount;
  final Value<int> rowid;
  const MedicationPhasesCompanion({
    this.id = const Value.absent(),
    this.medicationId = const Value.absent(),
    this.phaseOrder = const Value.absent(),
    this.doseAmount = const Value.absent(),
    this.timesPerDay = const Value.absent(),
    this.doseTimes = const Value.absent(),
    this.durationType = const Value.absent(),
    this.durationDays = const Value.absent(),
    this.durationDoseCount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicationPhasesCompanion.insert({
    required String id,
    required String medicationId,
    required int phaseOrder,
    required String doseAmount,
    required int timesPerDay,
    this.doseTimes = const Value.absent(),
    required String durationType,
    this.durationDays = const Value.absent(),
    this.durationDoseCount = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       medicationId = Value(medicationId),
       phaseOrder = Value(phaseOrder),
       doseAmount = Value(doseAmount),
       timesPerDay = Value(timesPerDay),
       durationType = Value(durationType);
  static Insertable<MedicationPhase> custom({
    Expression<String>? id,
    Expression<String>? medicationId,
    Expression<int>? phaseOrder,
    Expression<String>? doseAmount,
    Expression<int>? timesPerDay,
    Expression<String>? doseTimes,
    Expression<String>? durationType,
    Expression<int>? durationDays,
    Expression<int>? durationDoseCount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicationId != null) 'medication_id': medicationId,
      if (phaseOrder != null) 'phase_order': phaseOrder,
      if (doseAmount != null) 'dose_amount': doseAmount,
      if (timesPerDay != null) 'times_per_day': timesPerDay,
      if (doseTimes != null) 'dose_times': doseTimes,
      if (durationType != null) 'duration_type': durationType,
      if (durationDays != null) 'duration_days': durationDays,
      if (durationDoseCount != null) 'duration_dose_count': durationDoseCount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicationPhasesCompanion copyWith({
    Value<String>? id,
    Value<String>? medicationId,
    Value<int>? phaseOrder,
    Value<String>? doseAmount,
    Value<int>? timesPerDay,
    Value<String?>? doseTimes,
    Value<String>? durationType,
    Value<int?>? durationDays,
    Value<int?>? durationDoseCount,
    Value<int>? rowid,
  }) {
    return MedicationPhasesCompanion(
      id: id ?? this.id,
      medicationId: medicationId ?? this.medicationId,
      phaseOrder: phaseOrder ?? this.phaseOrder,
      doseAmount: doseAmount ?? this.doseAmount,
      timesPerDay: timesPerDay ?? this.timesPerDay,
      doseTimes: doseTimes ?? this.doseTimes,
      durationType: durationType ?? this.durationType,
      durationDays: durationDays ?? this.durationDays,
      durationDoseCount: durationDoseCount ?? this.durationDoseCount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (medicationId.present) {
      map['medication_id'] = Variable<String>(medicationId.value);
    }
    if (phaseOrder.present) {
      map['phase_order'] = Variable<int>(phaseOrder.value);
    }
    if (doseAmount.present) {
      map['dose_amount'] = Variable<String>(doseAmount.value);
    }
    if (timesPerDay.present) {
      map['times_per_day'] = Variable<int>(timesPerDay.value);
    }
    if (doseTimes.present) {
      map['dose_times'] = Variable<String>(doseTimes.value);
    }
    if (durationType.present) {
      map['duration_type'] = Variable<String>(durationType.value);
    }
    if (durationDays.present) {
      map['duration_days'] = Variable<int>(durationDays.value);
    }
    if (durationDoseCount.present) {
      map['duration_dose_count'] = Variable<int>(durationDoseCount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationPhasesCompanion(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('phaseOrder: $phaseOrder, ')
          ..write('doseAmount: $doseAmount, ')
          ..write('timesPerDay: $timesPerDay, ')
          ..write('doseTimes: $doseTimes, ')
          ..write('durationType: $durationType, ')
          ..write('durationDays: $durationDays, ')
          ..write('durationDoseCount: $durationDoseCount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class MedicationDoses extends Table
    with TableInfo<MedicationDoses, MedicationDose> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MedicationDoses(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _medicationIdMeta = const VerificationMeta(
    'medicationId',
  );
  late final GeneratedColumn<String> medicationId = GeneratedColumn<String>(
    'medication_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES medications(id)',
  );
  static const VerificationMeta _phaseIdMeta = const VerificationMeta(
    'phaseId',
  );
  late final GeneratedColumn<String> phaseId = GeneratedColumn<String>(
    'phase_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES medication_phases(id)',
  );
  static const VerificationMeta _scheduledForMeta = const VerificationMeta(
    'scheduledFor',
  );
  late final GeneratedColumn<String> scheduledFor = GeneratedColumn<String>(
    'scheduled_for',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _givenAtMeta = const VerificationMeta(
    'givenAt',
  );
  late final GeneratedColumn<String> givenAt = GeneratedColumn<String>(
    'given_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    medicationId,
    phaseId,
    scheduledFor,
    givenAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medication_doses';
  @override
  VerificationContext validateIntegrity(
    Insertable<MedicationDose> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('medication_id')) {
      context.handle(
        _medicationIdMeta,
        medicationId.isAcceptableOrUnknown(
          data['medication_id']!,
          _medicationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicationIdMeta);
    }
    if (data.containsKey('phase_id')) {
      context.handle(
        _phaseIdMeta,
        phaseId.isAcceptableOrUnknown(data['phase_id']!, _phaseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_phaseIdMeta);
    }
    if (data.containsKey('scheduled_for')) {
      context.handle(
        _scheduledForMeta,
        scheduledFor.isAcceptableOrUnknown(
          data['scheduled_for']!,
          _scheduledForMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledForMeta);
    }
    if (data.containsKey('given_at')) {
      context.handle(
        _givenAtMeta,
        givenAt.isAcceptableOrUnknown(data['given_at']!, _givenAtMeta),
      );
    } else if (isInserting) {
      context.missing(_givenAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicationDose map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicationDose(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      medicationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medication_id'],
      )!,
      phaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phase_id'],
      )!,
      scheduledFor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scheduled_for'],
      )!,
      givenAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}given_at'],
      )!,
    );
  }

  @override
  MedicationDoses createAlias(String alias) {
    return MedicationDoses(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class MedicationDose extends DataClass implements Insertable<MedicationDose> {
  final String id;
  final String medicationId;
  final String phaseId;
  final String scheduledFor;
  final String givenAt;
  const MedicationDose({
    required this.id,
    required this.medicationId,
    required this.phaseId,
    required this.scheduledFor,
    required this.givenAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['medication_id'] = Variable<String>(medicationId);
    map['phase_id'] = Variable<String>(phaseId);
    map['scheduled_for'] = Variable<String>(scheduledFor);
    map['given_at'] = Variable<String>(givenAt);
    return map;
  }

  MedicationDosesCompanion toCompanion(bool nullToAbsent) {
    return MedicationDosesCompanion(
      id: Value(id),
      medicationId: Value(medicationId),
      phaseId: Value(phaseId),
      scheduledFor: Value(scheduledFor),
      givenAt: Value(givenAt),
    );
  }

  factory MedicationDose.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicationDose(
      id: serializer.fromJson<String>(json['id']),
      medicationId: serializer.fromJson<String>(json['medication_id']),
      phaseId: serializer.fromJson<String>(json['phase_id']),
      scheduledFor: serializer.fromJson<String>(json['scheduled_for']),
      givenAt: serializer.fromJson<String>(json['given_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'medication_id': serializer.toJson<String>(medicationId),
      'phase_id': serializer.toJson<String>(phaseId),
      'scheduled_for': serializer.toJson<String>(scheduledFor),
      'given_at': serializer.toJson<String>(givenAt),
    };
  }

  MedicationDose copyWith({
    String? id,
    String? medicationId,
    String? phaseId,
    String? scheduledFor,
    String? givenAt,
  }) => MedicationDose(
    id: id ?? this.id,
    medicationId: medicationId ?? this.medicationId,
    phaseId: phaseId ?? this.phaseId,
    scheduledFor: scheduledFor ?? this.scheduledFor,
    givenAt: givenAt ?? this.givenAt,
  );
  MedicationDose copyWithCompanion(MedicationDosesCompanion data) {
    return MedicationDose(
      id: data.id.present ? data.id.value : this.id,
      medicationId: data.medicationId.present
          ? data.medicationId.value
          : this.medicationId,
      phaseId: data.phaseId.present ? data.phaseId.value : this.phaseId,
      scheduledFor: data.scheduledFor.present
          ? data.scheduledFor.value
          : this.scheduledFor,
      givenAt: data.givenAt.present ? data.givenAt.value : this.givenAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedicationDose(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('phaseId: $phaseId, ')
          ..write('scheduledFor: $scheduledFor, ')
          ..write('givenAt: $givenAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, medicationId, phaseId, scheduledFor, givenAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicationDose &&
          other.id == this.id &&
          other.medicationId == this.medicationId &&
          other.phaseId == this.phaseId &&
          other.scheduledFor == this.scheduledFor &&
          other.givenAt == this.givenAt);
}

class MedicationDosesCompanion extends UpdateCompanion<MedicationDose> {
  final Value<String> id;
  final Value<String> medicationId;
  final Value<String> phaseId;
  final Value<String> scheduledFor;
  final Value<String> givenAt;
  final Value<int> rowid;
  const MedicationDosesCompanion({
    this.id = const Value.absent(),
    this.medicationId = const Value.absent(),
    this.phaseId = const Value.absent(),
    this.scheduledFor = const Value.absent(),
    this.givenAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicationDosesCompanion.insert({
    required String id,
    required String medicationId,
    required String phaseId,
    required String scheduledFor,
    required String givenAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       medicationId = Value(medicationId),
       phaseId = Value(phaseId),
       scheduledFor = Value(scheduledFor),
       givenAt = Value(givenAt);
  static Insertable<MedicationDose> custom({
    Expression<String>? id,
    Expression<String>? medicationId,
    Expression<String>? phaseId,
    Expression<String>? scheduledFor,
    Expression<String>? givenAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicationId != null) 'medication_id': medicationId,
      if (phaseId != null) 'phase_id': phaseId,
      if (scheduledFor != null) 'scheduled_for': scheduledFor,
      if (givenAt != null) 'given_at': givenAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicationDosesCompanion copyWith({
    Value<String>? id,
    Value<String>? medicationId,
    Value<String>? phaseId,
    Value<String>? scheduledFor,
    Value<String>? givenAt,
    Value<int>? rowid,
  }) {
    return MedicationDosesCompanion(
      id: id ?? this.id,
      medicationId: medicationId ?? this.medicationId,
      phaseId: phaseId ?? this.phaseId,
      scheduledFor: scheduledFor ?? this.scheduledFor,
      givenAt: givenAt ?? this.givenAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (medicationId.present) {
      map['medication_id'] = Variable<String>(medicationId.value);
    }
    if (phaseId.present) {
      map['phase_id'] = Variable<String>(phaseId.value);
    }
    if (scheduledFor.present) {
      map['scheduled_for'] = Variable<String>(scheduledFor.value);
    }
    if (givenAt.present) {
      map['given_at'] = Variable<String>(givenAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationDosesCompanion(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('phaseId: $phaseId, ')
          ..write('scheduledFor: $scheduledFor, ')
          ..write('givenAt: $givenAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Reminders extends Table with TableInfo<Reminders, Reminder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Reminders(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES pets(id)',
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  late final GeneratedColumn<String> dueDate = GeneratedColumn<String>(
    'due_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'active\'',
    defaultValue: const CustomExpression('\'active\''),
  );
  static const VerificationMeta _snoozedUntilMeta = const VerificationMeta(
    'snoozedUntil',
  );
  late final GeneratedColumn<String> snoozedUntil = GeneratedColumn<String>(
    'snoozed_until',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _sourceRecordTypeMeta = const VerificationMeta(
    'sourceRecordType',
  );
  late final GeneratedColumn<String> sourceRecordType = GeneratedColumn<String>(
    'source_record_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _sourceRecordIdMeta = const VerificationMeta(
    'sourceRecordId',
  );
  late final GeneratedColumn<String> sourceRecordId = GeneratedColumn<String>(
    'source_record_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _isManuallyOverriddenMeta =
      const VerificationMeta('isManuallyOverridden');
  late final GeneratedColumn<bool> isManuallyOverridden = GeneratedColumn<bool>(
    'is_manually_overridden',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _lastEditedAtMeta = const VerificationMeta(
    'lastEditedAt',
  );
  late final GeneratedColumn<String> lastEditedAt = GeneratedColumn<String>(
    'last_edited_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    petId,
    title,
    dueDate,
    status,
    snoozedUntil,
    sourceRecordType,
    sourceRecordId,
    isManuallyOverridden,
    createdAt,
    lastEditedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<Reminder> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('snoozed_until')) {
      context.handle(
        _snoozedUntilMeta,
        snoozedUntil.isAcceptableOrUnknown(
          data['snoozed_until']!,
          _snoozedUntilMeta,
        ),
      );
    }
    if (data.containsKey('source_record_type')) {
      context.handle(
        _sourceRecordTypeMeta,
        sourceRecordType.isAcceptableOrUnknown(
          data['source_record_type']!,
          _sourceRecordTypeMeta,
        ),
      );
    }
    if (data.containsKey('source_record_id')) {
      context.handle(
        _sourceRecordIdMeta,
        sourceRecordId.isAcceptableOrUnknown(
          data['source_record_id']!,
          _sourceRecordIdMeta,
        ),
      );
    }
    if (data.containsKey('is_manually_overridden')) {
      context.handle(
        _isManuallyOverriddenMeta,
        isManuallyOverridden.isAcceptableOrUnknown(
          data['is_manually_overridden']!,
          _isManuallyOverriddenMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_edited_at')) {
      context.handle(
        _lastEditedAtMeta,
        lastEditedAt.isAcceptableOrUnknown(
          data['last_edited_at']!,
          _lastEditedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastEditedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Reminder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reminder(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}due_date'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      snoozedUntil: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}snoozed_until'],
      ),
      sourceRecordType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_record_type'],
      ),
      sourceRecordId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_record_id'],
      ),
      isManuallyOverridden: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_manually_overridden'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      lastEditedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_edited_at'],
      )!,
    );
  }

  @override
  Reminders createAlias(String alias) {
    return Reminders(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CHECK((source_record_type IS NULL)=(source_record_id IS NULL))',
    'CHECK(status IN (\'active\', \'snoozed\', \'done\', \'dismissed\'))',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class Reminder extends DataClass implements Insertable<Reminder> {
  final String id;
  final String petId;
  final String title;
  final String dueDate;
  final String status;
  final String? snoozedUntil;
  final String? sourceRecordType;
  final String? sourceRecordId;
  final bool isManuallyOverridden;
  final String createdAt;
  final String lastEditedAt;
  const Reminder({
    required this.id,
    required this.petId,
    required this.title,
    required this.dueDate,
    required this.status,
    this.snoozedUntil,
    this.sourceRecordType,
    this.sourceRecordId,
    required this.isManuallyOverridden,
    required this.createdAt,
    required this.lastEditedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    map['title'] = Variable<String>(title);
    map['due_date'] = Variable<String>(dueDate);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || snoozedUntil != null) {
      map['snoozed_until'] = Variable<String>(snoozedUntil);
    }
    if (!nullToAbsent || sourceRecordType != null) {
      map['source_record_type'] = Variable<String>(sourceRecordType);
    }
    if (!nullToAbsent || sourceRecordId != null) {
      map['source_record_id'] = Variable<String>(sourceRecordId);
    }
    map['is_manually_overridden'] = Variable<bool>(isManuallyOverridden);
    map['created_at'] = Variable<String>(createdAt);
    map['last_edited_at'] = Variable<String>(lastEditedAt);
    return map;
  }

  RemindersCompanion toCompanion(bool nullToAbsent) {
    return RemindersCompanion(
      id: Value(id),
      petId: Value(petId),
      title: Value(title),
      dueDate: Value(dueDate),
      status: Value(status),
      snoozedUntil: snoozedUntil == null && nullToAbsent
          ? const Value.absent()
          : Value(snoozedUntil),
      sourceRecordType: sourceRecordType == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceRecordType),
      sourceRecordId: sourceRecordId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceRecordId),
      isManuallyOverridden: Value(isManuallyOverridden),
      createdAt: Value(createdAt),
      lastEditedAt: Value(lastEditedAt),
    );
  }

  factory Reminder.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reminder(
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['pet_id']),
      title: serializer.fromJson<String>(json['title']),
      dueDate: serializer.fromJson<String>(json['due_date']),
      status: serializer.fromJson<String>(json['status']),
      snoozedUntil: serializer.fromJson<String?>(json['snoozed_until']),
      sourceRecordType: serializer.fromJson<String?>(
        json['source_record_type'],
      ),
      sourceRecordId: serializer.fromJson<String?>(json['source_record_id']),
      isManuallyOverridden: serializer.fromJson<bool>(
        json['is_manually_overridden'],
      ),
      createdAt: serializer.fromJson<String>(json['created_at']),
      lastEditedAt: serializer.fromJson<String>(json['last_edited_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pet_id': serializer.toJson<String>(petId),
      'title': serializer.toJson<String>(title),
      'due_date': serializer.toJson<String>(dueDate),
      'status': serializer.toJson<String>(status),
      'snoozed_until': serializer.toJson<String?>(snoozedUntil),
      'source_record_type': serializer.toJson<String?>(sourceRecordType),
      'source_record_id': serializer.toJson<String?>(sourceRecordId),
      'is_manually_overridden': serializer.toJson<bool>(isManuallyOverridden),
      'created_at': serializer.toJson<String>(createdAt),
      'last_edited_at': serializer.toJson<String>(lastEditedAt),
    };
  }

  Reminder copyWith({
    String? id,
    String? petId,
    String? title,
    String? dueDate,
    String? status,
    Value<String?> snoozedUntil = const Value.absent(),
    Value<String?> sourceRecordType = const Value.absent(),
    Value<String?> sourceRecordId = const Value.absent(),
    bool? isManuallyOverridden,
    String? createdAt,
    String? lastEditedAt,
  }) => Reminder(
    id: id ?? this.id,
    petId: petId ?? this.petId,
    title: title ?? this.title,
    dueDate: dueDate ?? this.dueDate,
    status: status ?? this.status,
    snoozedUntil: snoozedUntil.present ? snoozedUntil.value : this.snoozedUntil,
    sourceRecordType: sourceRecordType.present
        ? sourceRecordType.value
        : this.sourceRecordType,
    sourceRecordId: sourceRecordId.present
        ? sourceRecordId.value
        : this.sourceRecordId,
    isManuallyOverridden: isManuallyOverridden ?? this.isManuallyOverridden,
    createdAt: createdAt ?? this.createdAt,
    lastEditedAt: lastEditedAt ?? this.lastEditedAt,
  );
  Reminder copyWithCompanion(RemindersCompanion data) {
    return Reminder(
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      title: data.title.present ? data.title.value : this.title,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      status: data.status.present ? data.status.value : this.status,
      snoozedUntil: data.snoozedUntil.present
          ? data.snoozedUntil.value
          : this.snoozedUntil,
      sourceRecordType: data.sourceRecordType.present
          ? data.sourceRecordType.value
          : this.sourceRecordType,
      sourceRecordId: data.sourceRecordId.present
          ? data.sourceRecordId.value
          : this.sourceRecordId,
      isManuallyOverridden: data.isManuallyOverridden.present
          ? data.isManuallyOverridden.value
          : this.isManuallyOverridden,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastEditedAt: data.lastEditedAt.present
          ? data.lastEditedAt.value
          : this.lastEditedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reminder(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('title: $title, ')
          ..write('dueDate: $dueDate, ')
          ..write('status: $status, ')
          ..write('snoozedUntil: $snoozedUntil, ')
          ..write('sourceRecordType: $sourceRecordType, ')
          ..write('sourceRecordId: $sourceRecordId, ')
          ..write('isManuallyOverridden: $isManuallyOverridden, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    petId,
    title,
    dueDate,
    status,
    snoozedUntil,
    sourceRecordType,
    sourceRecordId,
    isManuallyOverridden,
    createdAt,
    lastEditedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reminder &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.title == this.title &&
          other.dueDate == this.dueDate &&
          other.status == this.status &&
          other.snoozedUntil == this.snoozedUntil &&
          other.sourceRecordType == this.sourceRecordType &&
          other.sourceRecordId == this.sourceRecordId &&
          other.isManuallyOverridden == this.isManuallyOverridden &&
          other.createdAt == this.createdAt &&
          other.lastEditedAt == this.lastEditedAt);
}

class RemindersCompanion extends UpdateCompanion<Reminder> {
  final Value<String> id;
  final Value<String> petId;
  final Value<String> title;
  final Value<String> dueDate;
  final Value<String> status;
  final Value<String?> snoozedUntil;
  final Value<String?> sourceRecordType;
  final Value<String?> sourceRecordId;
  final Value<bool> isManuallyOverridden;
  final Value<String> createdAt;
  final Value<String> lastEditedAt;
  final Value<int> rowid;
  const RemindersCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.title = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.status = const Value.absent(),
    this.snoozedUntil = const Value.absent(),
    this.sourceRecordType = const Value.absent(),
    this.sourceRecordId = const Value.absent(),
    this.isManuallyOverridden = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastEditedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RemindersCompanion.insert({
    required String id,
    required String petId,
    required String title,
    required String dueDate,
    this.status = const Value.absent(),
    this.snoozedUntil = const Value.absent(),
    this.sourceRecordType = const Value.absent(),
    this.sourceRecordId = const Value.absent(),
    this.isManuallyOverridden = const Value.absent(),
    required String createdAt,
    required String lastEditedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId),
       title = Value(title),
       dueDate = Value(dueDate),
       createdAt = Value(createdAt),
       lastEditedAt = Value(lastEditedAt);
  static Insertable<Reminder> custom({
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? title,
    Expression<String>? dueDate,
    Expression<String>? status,
    Expression<String>? snoozedUntil,
    Expression<String>? sourceRecordType,
    Expression<String>? sourceRecordId,
    Expression<bool>? isManuallyOverridden,
    Expression<String>? createdAt,
    Expression<String>? lastEditedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (title != null) 'title': title,
      if (dueDate != null) 'due_date': dueDate,
      if (status != null) 'status': status,
      if (snoozedUntil != null) 'snoozed_until': snoozedUntil,
      if (sourceRecordType != null) 'source_record_type': sourceRecordType,
      if (sourceRecordId != null) 'source_record_id': sourceRecordId,
      if (isManuallyOverridden != null)
        'is_manually_overridden': isManuallyOverridden,
      if (createdAt != null) 'created_at': createdAt,
      if (lastEditedAt != null) 'last_edited_at': lastEditedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RemindersCompanion copyWith({
    Value<String>? id,
    Value<String>? petId,
    Value<String>? title,
    Value<String>? dueDate,
    Value<String>? status,
    Value<String?>? snoozedUntil,
    Value<String?>? sourceRecordType,
    Value<String?>? sourceRecordId,
    Value<bool>? isManuallyOverridden,
    Value<String>? createdAt,
    Value<String>? lastEditedAt,
    Value<int>? rowid,
  }) {
    return RemindersCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      title: title ?? this.title,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
      snoozedUntil: snoozedUntil ?? this.snoozedUntil,
      sourceRecordType: sourceRecordType ?? this.sourceRecordType,
      sourceRecordId: sourceRecordId ?? this.sourceRecordId,
      isManuallyOverridden: isManuallyOverridden ?? this.isManuallyOverridden,
      createdAt: createdAt ?? this.createdAt,
      lastEditedAt: lastEditedAt ?? this.lastEditedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<String>(dueDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (snoozedUntil.present) {
      map['snoozed_until'] = Variable<String>(snoozedUntil.value);
    }
    if (sourceRecordType.present) {
      map['source_record_type'] = Variable<String>(sourceRecordType.value);
    }
    if (sourceRecordId.present) {
      map['source_record_id'] = Variable<String>(sourceRecordId.value);
    }
    if (isManuallyOverridden.present) {
      map['is_manually_overridden'] = Variable<bool>(
        isManuallyOverridden.value,
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (lastEditedAt.present) {
      map['last_edited_at'] = Variable<String>(lastEditedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemindersCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('title: $title, ')
          ..write('dueDate: $dueDate, ')
          ..write('status: $status, ')
          ..write('snoozedUntil: $snoozedUntil, ')
          ..write('sourceRecordType: $sourceRecordType, ')
          ..write('sourceRecordId: $sourceRecordId, ')
          ..write('isManuallyOverridden: $isManuallyOverridden, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Attachments extends Table with TableInfo<Attachments, Attachment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Attachments(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES pets(id)',
  );
  static const VerificationMeta _linkedRecordTypeMeta = const VerificationMeta(
    'linkedRecordType',
  );
  late final GeneratedColumn<String> linkedRecordType = GeneratedColumn<String>(
    'linked_record_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _linkedRecordIdMeta = const VerificationMeta(
    'linkedRecordId',
  );
  late final GeneratedColumn<String> linkedRecordId = GeneratedColumn<String>(
    'linked_record_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _fileNameMeta = const VerificationMeta(
    'fileName',
  );
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
    'file_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _fileTypeMeta = const VerificationMeta(
    'fileType',
  );
  late final GeneratedColumn<String> fileType = GeneratedColumn<String>(
    'file_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _uploadedAtMeta = const VerificationMeta(
    'uploadedAt',
  );
  late final GeneratedColumn<String> uploadedAt = GeneratedColumn<String>(
    'uploaded_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    petId,
    linkedRecordType,
    linkedRecordId,
    fileName,
    filePath,
    fileType,
    description,
    uploadedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attachments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Attachment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('linked_record_type')) {
      context.handle(
        _linkedRecordTypeMeta,
        linkedRecordType.isAcceptableOrUnknown(
          data['linked_record_type']!,
          _linkedRecordTypeMeta,
        ),
      );
    }
    if (data.containsKey('linked_record_id')) {
      context.handle(
        _linkedRecordIdMeta,
        linkedRecordId.isAcceptableOrUnknown(
          data['linked_record_id']!,
          _linkedRecordIdMeta,
        ),
      );
    }
    if (data.containsKey('file_name')) {
      context.handle(
        _fileNameMeta,
        fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('file_type')) {
      context.handle(
        _fileTypeMeta,
        fileType.isAcceptableOrUnknown(data['file_type']!, _fileTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_fileTypeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('uploaded_at')) {
      context.handle(
        _uploadedAtMeta,
        uploadedAt.isAcceptableOrUnknown(data['uploaded_at']!, _uploadedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_uploadedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Attachment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Attachment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      )!,
      linkedRecordType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}linked_record_type'],
      ),
      linkedRecordId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}linked_record_id'],
      ),
      fileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_name'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      fileType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      uploadedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uploaded_at'],
      )!,
    );
  }

  @override
  Attachments createAlias(String alias) {
    return Attachments(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CHECK((linked_record_type IS NULL)=(linked_record_id IS NULL))',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class Attachment extends DataClass implements Insertable<Attachment> {
  final String id;
  final String petId;
  final String? linkedRecordType;
  final String? linkedRecordId;
  final String fileName;
  final String filePath;
  final String fileType;
  final String? description;
  final String uploadedAt;
  const Attachment({
    required this.id,
    required this.petId,
    this.linkedRecordType,
    this.linkedRecordId,
    required this.fileName,
    required this.filePath,
    required this.fileType,
    this.description,
    required this.uploadedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    if (!nullToAbsent || linkedRecordType != null) {
      map['linked_record_type'] = Variable<String>(linkedRecordType);
    }
    if (!nullToAbsent || linkedRecordId != null) {
      map['linked_record_id'] = Variable<String>(linkedRecordId);
    }
    map['file_name'] = Variable<String>(fileName);
    map['file_path'] = Variable<String>(filePath);
    map['file_type'] = Variable<String>(fileType);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['uploaded_at'] = Variable<String>(uploadedAt);
    return map;
  }

  AttachmentsCompanion toCompanion(bool nullToAbsent) {
    return AttachmentsCompanion(
      id: Value(id),
      petId: Value(petId),
      linkedRecordType: linkedRecordType == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedRecordType),
      linkedRecordId: linkedRecordId == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedRecordId),
      fileName: Value(fileName),
      filePath: Value(filePath),
      fileType: Value(fileType),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      uploadedAt: Value(uploadedAt),
    );
  }

  factory Attachment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Attachment(
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['pet_id']),
      linkedRecordType: serializer.fromJson<String?>(
        json['linked_record_type'],
      ),
      linkedRecordId: serializer.fromJson<String?>(json['linked_record_id']),
      fileName: serializer.fromJson<String>(json['file_name']),
      filePath: serializer.fromJson<String>(json['file_path']),
      fileType: serializer.fromJson<String>(json['file_type']),
      description: serializer.fromJson<String?>(json['description']),
      uploadedAt: serializer.fromJson<String>(json['uploaded_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pet_id': serializer.toJson<String>(petId),
      'linked_record_type': serializer.toJson<String?>(linkedRecordType),
      'linked_record_id': serializer.toJson<String?>(linkedRecordId),
      'file_name': serializer.toJson<String>(fileName),
      'file_path': serializer.toJson<String>(filePath),
      'file_type': serializer.toJson<String>(fileType),
      'description': serializer.toJson<String?>(description),
      'uploaded_at': serializer.toJson<String>(uploadedAt),
    };
  }

  Attachment copyWith({
    String? id,
    String? petId,
    Value<String?> linkedRecordType = const Value.absent(),
    Value<String?> linkedRecordId = const Value.absent(),
    String? fileName,
    String? filePath,
    String? fileType,
    Value<String?> description = const Value.absent(),
    String? uploadedAt,
  }) => Attachment(
    id: id ?? this.id,
    petId: petId ?? this.petId,
    linkedRecordType: linkedRecordType.present
        ? linkedRecordType.value
        : this.linkedRecordType,
    linkedRecordId: linkedRecordId.present
        ? linkedRecordId.value
        : this.linkedRecordId,
    fileName: fileName ?? this.fileName,
    filePath: filePath ?? this.filePath,
    fileType: fileType ?? this.fileType,
    description: description.present ? description.value : this.description,
    uploadedAt: uploadedAt ?? this.uploadedAt,
  );
  Attachment copyWithCompanion(AttachmentsCompanion data) {
    return Attachment(
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      linkedRecordType: data.linkedRecordType.present
          ? data.linkedRecordType.value
          : this.linkedRecordType,
      linkedRecordId: data.linkedRecordId.present
          ? data.linkedRecordId.value
          : this.linkedRecordId,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      fileType: data.fileType.present ? data.fileType.value : this.fileType,
      description: data.description.present
          ? data.description.value
          : this.description,
      uploadedAt: data.uploadedAt.present
          ? data.uploadedAt.value
          : this.uploadedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Attachment(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('linkedRecordType: $linkedRecordType, ')
          ..write('linkedRecordId: $linkedRecordId, ')
          ..write('fileName: $fileName, ')
          ..write('filePath: $filePath, ')
          ..write('fileType: $fileType, ')
          ..write('description: $description, ')
          ..write('uploadedAt: $uploadedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    petId,
    linkedRecordType,
    linkedRecordId,
    fileName,
    filePath,
    fileType,
    description,
    uploadedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Attachment &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.linkedRecordType == this.linkedRecordType &&
          other.linkedRecordId == this.linkedRecordId &&
          other.fileName == this.fileName &&
          other.filePath == this.filePath &&
          other.fileType == this.fileType &&
          other.description == this.description &&
          other.uploadedAt == this.uploadedAt);
}

class AttachmentsCompanion extends UpdateCompanion<Attachment> {
  final Value<String> id;
  final Value<String> petId;
  final Value<String?> linkedRecordType;
  final Value<String?> linkedRecordId;
  final Value<String> fileName;
  final Value<String> filePath;
  final Value<String> fileType;
  final Value<String?> description;
  final Value<String> uploadedAt;
  final Value<int> rowid;
  const AttachmentsCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.linkedRecordType = const Value.absent(),
    this.linkedRecordId = const Value.absent(),
    this.fileName = const Value.absent(),
    this.filePath = const Value.absent(),
    this.fileType = const Value.absent(),
    this.description = const Value.absent(),
    this.uploadedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AttachmentsCompanion.insert({
    required String id,
    required String petId,
    this.linkedRecordType = const Value.absent(),
    this.linkedRecordId = const Value.absent(),
    required String fileName,
    required String filePath,
    required String fileType,
    this.description = const Value.absent(),
    required String uploadedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId),
       fileName = Value(fileName),
       filePath = Value(filePath),
       fileType = Value(fileType),
       uploadedAt = Value(uploadedAt);
  static Insertable<Attachment> custom({
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? linkedRecordType,
    Expression<String>? linkedRecordId,
    Expression<String>? fileName,
    Expression<String>? filePath,
    Expression<String>? fileType,
    Expression<String>? description,
    Expression<String>? uploadedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (linkedRecordType != null) 'linked_record_type': linkedRecordType,
      if (linkedRecordId != null) 'linked_record_id': linkedRecordId,
      if (fileName != null) 'file_name': fileName,
      if (filePath != null) 'file_path': filePath,
      if (fileType != null) 'file_type': fileType,
      if (description != null) 'description': description,
      if (uploadedAt != null) 'uploaded_at': uploadedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AttachmentsCompanion copyWith({
    Value<String>? id,
    Value<String>? petId,
    Value<String?>? linkedRecordType,
    Value<String?>? linkedRecordId,
    Value<String>? fileName,
    Value<String>? filePath,
    Value<String>? fileType,
    Value<String?>? description,
    Value<String>? uploadedAt,
    Value<int>? rowid,
  }) {
    return AttachmentsCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      linkedRecordType: linkedRecordType ?? this.linkedRecordType,
      linkedRecordId: linkedRecordId ?? this.linkedRecordId,
      fileName: fileName ?? this.fileName,
      filePath: filePath ?? this.filePath,
      fileType: fileType ?? this.fileType,
      description: description ?? this.description,
      uploadedAt: uploadedAt ?? this.uploadedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (linkedRecordType.present) {
      map['linked_record_type'] = Variable<String>(linkedRecordType.value);
    }
    if (linkedRecordId.present) {
      map['linked_record_id'] = Variable<String>(linkedRecordId.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (fileType.present) {
      map['file_type'] = Variable<String>(fileType.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (uploadedAt.present) {
      map['uploaded_at'] = Variable<String>(uploadedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentsCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('linkedRecordType: $linkedRecordType, ')
          ..write('linkedRecordId: $linkedRecordId, ')
          ..write('fileName: $fileName, ')
          ..write('filePath: $filePath, ')
          ..write('fileType: $fileType, ')
          ..write('description: $description, ')
          ..write('uploadedAt: $uploadedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Notes extends Table with TableInfo<Notes, Note> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Notes(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES pets(id)',
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _noteTextMeta = const VerificationMeta(
    'noteText',
  );
  late final GeneratedColumn<String> noteText = GeneratedColumn<String>(
    'text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _linkedRecordTypeMeta = const VerificationMeta(
    'linkedRecordType',
  );
  late final GeneratedColumn<String> linkedRecordType = GeneratedColumn<String>(
    'linked_record_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _linkedRecordIdMeta = const VerificationMeta(
    'linkedRecordId',
  );
  late final GeneratedColumn<String> linkedRecordId = GeneratedColumn<String>(
    'linked_record_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  static const VerificationMeta _handledByPersonIdMeta = const VerificationMeta(
    'handledByPersonId',
  );
  late final GeneratedColumn<String> handledByPersonId =
      GeneratedColumn<String>(
        'handled_by_person_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        $customConstraints: 'NULL REFERENCES people(id)',
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _lastEditedAtMeta = const VerificationMeta(
    'lastEditedAt',
  );
  late final GeneratedColumn<String> lastEditedAt = GeneratedColumn<String>(
    'last_edited_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    petId,
    date,
    noteText,
    linkedRecordType,
    linkedRecordId,
    handledByPersonId,
    createdAt,
    lastEditedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Note> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('text')) {
      context.handle(
        _noteTextMeta,
        noteText.isAcceptableOrUnknown(data['text']!, _noteTextMeta),
      );
    } else if (isInserting) {
      context.missing(_noteTextMeta);
    }
    if (data.containsKey('linked_record_type')) {
      context.handle(
        _linkedRecordTypeMeta,
        linkedRecordType.isAcceptableOrUnknown(
          data['linked_record_type']!,
          _linkedRecordTypeMeta,
        ),
      );
    }
    if (data.containsKey('linked_record_id')) {
      context.handle(
        _linkedRecordIdMeta,
        linkedRecordId.isAcceptableOrUnknown(
          data['linked_record_id']!,
          _linkedRecordIdMeta,
        ),
      );
    }
    if (data.containsKey('handled_by_person_id')) {
      context.handle(
        _handledByPersonIdMeta,
        handledByPersonId.isAcceptableOrUnknown(
          data['handled_by_person_id']!,
          _handledByPersonIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_edited_at')) {
      context.handle(
        _lastEditedAtMeta,
        lastEditedAt.isAcceptableOrUnknown(
          data['last_edited_at']!,
          _lastEditedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastEditedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Note(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      noteText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text'],
      )!,
      linkedRecordType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}linked_record_type'],
      ),
      linkedRecordId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}linked_record_id'],
      ),
      handledByPersonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}handled_by_person_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      lastEditedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_edited_at'],
      )!,
    );
  }

  @override
  Notes createAlias(String alias) {
    return Notes(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'CHECK((linked_record_type IS NULL)=(linked_record_id IS NULL))',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class Note extends DataClass implements Insertable<Note> {
  final String id;
  final String petId;
  final String date;

  /// Column stays named "text" in SQL (matches core/db.py's schema exactly),
  /// but drift's Table base class has its own inherited text() builder
  /// method, so the generated Dart getter for this column needs renaming
  /// via "AS" — caught live: codegen failed with "Can't declare a member
  /// that conflicts with an inherited one" before this was added.
  final String noteText;
  final String? linkedRecordType;
  final String? linkedRecordId;
  final String? handledByPersonId;
  final String createdAt;
  final String lastEditedAt;
  const Note({
    required this.id,
    required this.petId,
    required this.date,
    required this.noteText,
    this.linkedRecordType,
    this.linkedRecordId,
    this.handledByPersonId,
    required this.createdAt,
    required this.lastEditedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    map['date'] = Variable<String>(date);
    map['text'] = Variable<String>(noteText);
    if (!nullToAbsent || linkedRecordType != null) {
      map['linked_record_type'] = Variable<String>(linkedRecordType);
    }
    if (!nullToAbsent || linkedRecordId != null) {
      map['linked_record_id'] = Variable<String>(linkedRecordId);
    }
    if (!nullToAbsent || handledByPersonId != null) {
      map['handled_by_person_id'] = Variable<String>(handledByPersonId);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['last_edited_at'] = Variable<String>(lastEditedAt);
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      petId: Value(petId),
      date: Value(date),
      noteText: Value(noteText),
      linkedRecordType: linkedRecordType == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedRecordType),
      linkedRecordId: linkedRecordId == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedRecordId),
      handledByPersonId: handledByPersonId == null && nullToAbsent
          ? const Value.absent()
          : Value(handledByPersonId),
      createdAt: Value(createdAt),
      lastEditedAt: Value(lastEditedAt),
    );
  }

  factory Note.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['pet_id']),
      date: serializer.fromJson<String>(json['date']),
      noteText: serializer.fromJson<String>(json['text']),
      linkedRecordType: serializer.fromJson<String?>(
        json['linked_record_type'],
      ),
      linkedRecordId: serializer.fromJson<String?>(json['linked_record_id']),
      handledByPersonId: serializer.fromJson<String?>(
        json['handled_by_person_id'],
      ),
      createdAt: serializer.fromJson<String>(json['created_at']),
      lastEditedAt: serializer.fromJson<String>(json['last_edited_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pet_id': serializer.toJson<String>(petId),
      'date': serializer.toJson<String>(date),
      'text': serializer.toJson<String>(noteText),
      'linked_record_type': serializer.toJson<String?>(linkedRecordType),
      'linked_record_id': serializer.toJson<String?>(linkedRecordId),
      'handled_by_person_id': serializer.toJson<String?>(handledByPersonId),
      'created_at': serializer.toJson<String>(createdAt),
      'last_edited_at': serializer.toJson<String>(lastEditedAt),
    };
  }

  Note copyWith({
    String? id,
    String? petId,
    String? date,
    String? noteText,
    Value<String?> linkedRecordType = const Value.absent(),
    Value<String?> linkedRecordId = const Value.absent(),
    Value<String?> handledByPersonId = const Value.absent(),
    String? createdAt,
    String? lastEditedAt,
  }) => Note(
    id: id ?? this.id,
    petId: petId ?? this.petId,
    date: date ?? this.date,
    noteText: noteText ?? this.noteText,
    linkedRecordType: linkedRecordType.present
        ? linkedRecordType.value
        : this.linkedRecordType,
    linkedRecordId: linkedRecordId.present
        ? linkedRecordId.value
        : this.linkedRecordId,
    handledByPersonId: handledByPersonId.present
        ? handledByPersonId.value
        : this.handledByPersonId,
    createdAt: createdAt ?? this.createdAt,
    lastEditedAt: lastEditedAt ?? this.lastEditedAt,
  );
  Note copyWithCompanion(NotesCompanion data) {
    return Note(
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      date: data.date.present ? data.date.value : this.date,
      noteText: data.noteText.present ? data.noteText.value : this.noteText,
      linkedRecordType: data.linkedRecordType.present
          ? data.linkedRecordType.value
          : this.linkedRecordType,
      linkedRecordId: data.linkedRecordId.present
          ? data.linkedRecordId.value
          : this.linkedRecordId,
      handledByPersonId: data.handledByPersonId.present
          ? data.handledByPersonId.value
          : this.handledByPersonId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastEditedAt: data.lastEditedAt.present
          ? data.lastEditedAt.value
          : this.lastEditedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('date: $date, ')
          ..write('noteText: $noteText, ')
          ..write('linkedRecordType: $linkedRecordType, ')
          ..write('linkedRecordId: $linkedRecordId, ')
          ..write('handledByPersonId: $handledByPersonId, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    petId,
    date,
    noteText,
    linkedRecordType,
    linkedRecordId,
    handledByPersonId,
    createdAt,
    lastEditedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.date == this.date &&
          other.noteText == this.noteText &&
          other.linkedRecordType == this.linkedRecordType &&
          other.linkedRecordId == this.linkedRecordId &&
          other.handledByPersonId == this.handledByPersonId &&
          other.createdAt == this.createdAt &&
          other.lastEditedAt == this.lastEditedAt);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<String> id;
  final Value<String> petId;
  final Value<String> date;
  final Value<String> noteText;
  final Value<String?> linkedRecordType;
  final Value<String?> linkedRecordId;
  final Value<String?> handledByPersonId;
  final Value<String> createdAt;
  final Value<String> lastEditedAt;
  final Value<int> rowid;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.date = const Value.absent(),
    this.noteText = const Value.absent(),
    this.linkedRecordType = const Value.absent(),
    this.linkedRecordId = const Value.absent(),
    this.handledByPersonId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastEditedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotesCompanion.insert({
    required String id,
    required String petId,
    required String date,
    required String noteText,
    this.linkedRecordType = const Value.absent(),
    this.linkedRecordId = const Value.absent(),
    this.handledByPersonId = const Value.absent(),
    required String createdAt,
    required String lastEditedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId),
       date = Value(date),
       noteText = Value(noteText),
       createdAt = Value(createdAt),
       lastEditedAt = Value(lastEditedAt);
  static Insertable<Note> custom({
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? date,
    Expression<String>? noteText,
    Expression<String>? linkedRecordType,
    Expression<String>? linkedRecordId,
    Expression<String>? handledByPersonId,
    Expression<String>? createdAt,
    Expression<String>? lastEditedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (date != null) 'date': date,
      if (noteText != null) 'text': noteText,
      if (linkedRecordType != null) 'linked_record_type': linkedRecordType,
      if (linkedRecordId != null) 'linked_record_id': linkedRecordId,
      if (handledByPersonId != null) 'handled_by_person_id': handledByPersonId,
      if (createdAt != null) 'created_at': createdAt,
      if (lastEditedAt != null) 'last_edited_at': lastEditedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotesCompanion copyWith({
    Value<String>? id,
    Value<String>? petId,
    Value<String>? date,
    Value<String>? noteText,
    Value<String?>? linkedRecordType,
    Value<String?>? linkedRecordId,
    Value<String?>? handledByPersonId,
    Value<String>? createdAt,
    Value<String>? lastEditedAt,
    Value<int>? rowid,
  }) {
    return NotesCompanion(
      id: id ?? this.id,
      petId: petId ?? this.petId,
      date: date ?? this.date,
      noteText: noteText ?? this.noteText,
      linkedRecordType: linkedRecordType ?? this.linkedRecordType,
      linkedRecordId: linkedRecordId ?? this.linkedRecordId,
      handledByPersonId: handledByPersonId ?? this.handledByPersonId,
      createdAt: createdAt ?? this.createdAt,
      lastEditedAt: lastEditedAt ?? this.lastEditedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (noteText.present) {
      map['text'] = Variable<String>(noteText.value);
    }
    if (linkedRecordType.present) {
      map['linked_record_type'] = Variable<String>(linkedRecordType.value);
    }
    if (linkedRecordId.present) {
      map['linked_record_id'] = Variable<String>(linkedRecordId.value);
    }
    if (handledByPersonId.present) {
      map['handled_by_person_id'] = Variable<String>(handledByPersonId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (lastEditedAt.present) {
      map['last_edited_at'] = Variable<String>(lastEditedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('date: $date, ')
          ..write('noteText: $noteText, ')
          ..write('linkedRecordType: $linkedRecordType, ')
          ..write('linkedRecordId: $linkedRecordId, ')
          ..write('handledByPersonId: $handledByPersonId, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastEditedAt: $lastEditedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class AppSettings extends Table with TableInfo<AppSettings, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  AppSettings(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY CHECK (id = 1)',
  );
  static const VerificationMeta _themeMeta = const VerificationMeta('theme');
  late final GeneratedColumn<String> theme = GeneratedColumn<String>(
    'theme',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'dark\'',
    defaultValue: const CustomExpression('\'dark\''),
  );
  static const VerificationMeta _lastEditedAtMeta = const VerificationMeta(
    'lastEditedAt',
  );
  late final GeneratedColumn<String> lastEditedAt = GeneratedColumn<String>(
    'last_edited_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [id, theme, lastEditedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('theme')) {
      context.handle(
        _themeMeta,
        theme.isAcceptableOrUnknown(data['theme']!, _themeMeta),
      );
    }
    if (data.containsKey('last_edited_at')) {
      context.handle(
        _lastEditedAtMeta,
        lastEditedAt.isAcceptableOrUnknown(
          data['last_edited_at']!,
          _lastEditedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastEditedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      theme: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}theme'],
      )!,
      lastEditedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_edited_at'],
      )!,
    );
  }

  @override
  AppSettings createAlias(String alias) {
    return AppSettings(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final int id;
  final String theme;
  final String lastEditedAt;
  const AppSetting({
    required this.id,
    required this.theme,
    required this.lastEditedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['theme'] = Variable<String>(theme);
    map['last_edited_at'] = Variable<String>(lastEditedAt);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      id: Value(id),
      theme: Value(theme),
      lastEditedAt: Value(lastEditedAt),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      id: serializer.fromJson<int>(json['id']),
      theme: serializer.fromJson<String>(json['theme']),
      lastEditedAt: serializer.fromJson<String>(json['last_edited_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'theme': serializer.toJson<String>(theme),
      'last_edited_at': serializer.toJson<String>(lastEditedAt),
    };
  }

  AppSetting copyWith({int? id, String? theme, String? lastEditedAt}) =>
      AppSetting(
        id: id ?? this.id,
        theme: theme ?? this.theme,
        lastEditedAt: lastEditedAt ?? this.lastEditedAt,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      id: data.id.present ? data.id.value : this.id,
      theme: data.theme.present ? data.theme.value : this.theme,
      lastEditedAt: data.lastEditedAt.present
          ? data.lastEditedAt.value
          : this.lastEditedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('id: $id, ')
          ..write('theme: $theme, ')
          ..write('lastEditedAt: $lastEditedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, theme, lastEditedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.id == this.id &&
          other.theme == this.theme &&
          other.lastEditedAt == this.lastEditedAt);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<int> id;
  final Value<String> theme;
  final Value<String> lastEditedAt;
  const AppSettingsCompanion({
    this.id = const Value.absent(),
    this.theme = const Value.absent(),
    this.lastEditedAt = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    this.id = const Value.absent(),
    this.theme = const Value.absent(),
    required String lastEditedAt,
  }) : lastEditedAt = Value(lastEditedAt);
  static Insertable<AppSetting> custom({
    Expression<int>? id,
    Expression<String>? theme,
    Expression<String>? lastEditedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (theme != null) 'theme': theme,
      if (lastEditedAt != null) 'last_edited_at': lastEditedAt,
    });
  }

  AppSettingsCompanion copyWith({
    Value<int>? id,
    Value<String>? theme,
    Value<String>? lastEditedAt,
  }) {
    return AppSettingsCompanion(
      id: id ?? this.id,
      theme: theme ?? this.theme,
      lastEditedAt: lastEditedAt ?? this.lastEditedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (theme.present) {
      map['theme'] = Variable<String>(theme.value);
    }
    if (lastEditedAt.present) {
      map['last_edited_at'] = Variable<String>(lastEditedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('id: $id, ')
          ..write('theme: $theme, ')
          ..write('lastEditedAt: $lastEditedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final Pets pets = Pets(this);
  late final People people = People(this);
  late final VetAppointments vetAppointments = VetAppointments(this);
  late final Hospitalizations hospitalizations = Hospitalizations(this);
  late final ProceduresSurgeries proceduresSurgeries = ProceduresSurgeries(
    this,
  );
  late final IllnessCustomEvents illnessCustomEvents = IllnessCustomEvents(
    this,
  );
  late final Vaccinations vaccinations = Vaccinations(this);
  late final MicrochipRecords microchipRecords = MicrochipRecords(this);
  late final Medications medications = Medications(this);
  late final MedicationPhases medicationPhases = MedicationPhases(this);
  late final MedicationDoses medicationDoses = MedicationDoses(this);
  late final Reminders reminders = Reminders(this);
  late final Attachments attachments = Attachments(this);
  late final Notes notes = Notes(this);
  late final AppSettings appSettings = AppSettings(this);
  late final Index idxVetAppointmentsPet = Index(
    'idx_vet_appointments_pet',
    'CREATE INDEX idx_vet_appointments_pet ON vet_appointments (pet_id)',
  );
  late final Index idxHospitalizationsPet = Index(
    'idx_hospitalizations_pet',
    'CREATE INDEX idx_hospitalizations_pet ON hospitalizations (pet_id)',
  );
  late final Index idxProceduresPet = Index(
    'idx_procedures_pet',
    'CREATE INDEX idx_procedures_pet ON procedures_surgeries (pet_id)',
  );
  late final Index idxIllnessEventsPet = Index(
    'idx_illness_events_pet',
    'CREATE INDEX idx_illness_events_pet ON illness_custom_events (pet_id)',
  );
  late final Index idxVaccinationsPet = Index(
    'idx_vaccinations_pet',
    'CREATE INDEX idx_vaccinations_pet ON vaccinations (pet_id)',
  );
  late final Index idxMicrochipPet = Index(
    'idx_microchip_pet',
    'CREATE INDEX idx_microchip_pet ON microchip_records (pet_id)',
  );
  late final Index idxMedicationsPet = Index(
    'idx_medications_pet',
    'CREATE INDEX idx_medications_pet ON medications (pet_id)',
  );
  late final Index idxMedicationPhasesMedication = Index(
    'idx_medication_phases_medication',
    'CREATE INDEX idx_medication_phases_medication ON medication_phases (medication_id)',
  );
  late final Index idxMedicationDosesMedication = Index(
    'idx_medication_doses_medication',
    'CREATE INDEX idx_medication_doses_medication ON medication_doses (medication_id)',
  );
  late final Index idxRemindersPet = Index(
    'idx_reminders_pet',
    'CREATE INDEX idx_reminders_pet ON reminders (pet_id)',
  );
  late final Index idxRemindersStatusDue = Index(
    'idx_reminders_status_due',
    'CREATE INDEX idx_reminders_status_due ON reminders (status, due_date)',
  );
  late final Index idxAttachmentsPet = Index(
    'idx_attachments_pet',
    'CREATE INDEX idx_attachments_pet ON attachments (pet_id)',
  );
  late final Index idxNotesPet = Index(
    'idx_notes_pet',
    'CREATE INDEX idx_notes_pet ON notes (pet_id)',
  );
  late final Trigger remindersPetMatchInsert = Trigger(
    'CREATE TRIGGER reminders_pet_match_insert BEFORE INSERT ON reminders WHEN NEW.source_record_type IS NOT NULL BEGIN SELECT CASE WHEN NEW.source_record_type = \'vet_appointment\' AND NOT EXISTS (SELECT 1 FROM vet_appointments WHERE id = NEW.source_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'reminders.source_record_type record does not belong to the selected pet\') WHEN NEW.source_record_type = \'vaccination\' AND NOT EXISTS (SELECT 1 FROM vaccinations WHERE id = NEW.source_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'reminders.source_record_type record does not belong to the selected pet\') WHEN NEW.source_record_type = \'procedure\' AND NOT EXISTS (SELECT 1 FROM procedures_surgeries WHERE id = NEW.source_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'reminders.source_record_type record does not belong to the selected pet\') WHEN NEW.source_record_type = \'hospitalization\' AND NOT EXISTS (SELECT 1 FROM hospitalizations WHERE id = NEW.source_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'reminders.source_record_type record does not belong to the selected pet\') WHEN NEW.source_record_type = \'illness_custom_event\' AND NOT EXISTS (SELECT 1 FROM illness_custom_events WHERE id = NEW.source_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'reminders.source_record_type record does not belong to the selected pet\') WHEN NEW.source_record_type = \'medication\' AND NOT EXISTS (SELECT 1 FROM medications WHERE id = NEW.source_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'reminders.source_record_type record does not belong to the selected pet\') END;END',
    'reminders_pet_match_insert',
  );
  late final Trigger remindersPetMatchUpdate = Trigger(
    'CREATE TRIGGER reminders_pet_match_update BEFORE UPDATE ON reminders WHEN NEW.source_record_type IS NOT NULL BEGIN SELECT CASE WHEN NEW.source_record_type = \'vet_appointment\' AND NOT EXISTS (SELECT 1 FROM vet_appointments WHERE id = NEW.source_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'reminders.source_record_type record does not belong to the selected pet\') WHEN NEW.source_record_type = \'vaccination\' AND NOT EXISTS (SELECT 1 FROM vaccinations WHERE id = NEW.source_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'reminders.source_record_type record does not belong to the selected pet\') WHEN NEW.source_record_type = \'procedure\' AND NOT EXISTS (SELECT 1 FROM procedures_surgeries WHERE id = NEW.source_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'reminders.source_record_type record does not belong to the selected pet\') WHEN NEW.source_record_type = \'hospitalization\' AND NOT EXISTS (SELECT 1 FROM hospitalizations WHERE id = NEW.source_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'reminders.source_record_type record does not belong to the selected pet\') WHEN NEW.source_record_type = \'illness_custom_event\' AND NOT EXISTS (SELECT 1 FROM illness_custom_events WHERE id = NEW.source_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'reminders.source_record_type record does not belong to the selected pet\') WHEN NEW.source_record_type = \'medication\' AND NOT EXISTS (SELECT 1 FROM medications WHERE id = NEW.source_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'reminders.source_record_type record does not belong to the selected pet\') END;END',
    'reminders_pet_match_update',
  );
  late final Trigger attachmentsPetMatchInsert = Trigger(
    'CREATE TRIGGER attachments_pet_match_insert BEFORE INSERT ON attachments WHEN NEW.linked_record_type IS NOT NULL BEGIN SELECT CASE WHEN NEW.linked_record_type = \'vet_appointment\' AND NOT EXISTS (SELECT 1 FROM vet_appointments WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'attachments.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'vaccination\' AND NOT EXISTS (SELECT 1 FROM vaccinations WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'attachments.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'procedure\' AND NOT EXISTS (SELECT 1 FROM procedures_surgeries WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'attachments.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'hospitalization\' AND NOT EXISTS (SELECT 1 FROM hospitalizations WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'attachments.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'illness_custom_event\' AND NOT EXISTS (SELECT 1 FROM illness_custom_events WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'attachments.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'microchip_record\' AND NOT EXISTS (SELECT 1 FROM microchip_records WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'attachments.linked_record_type record does not belong to the selected pet\') END;END',
    'attachments_pet_match_insert',
  );
  late final Trigger attachmentsPetMatchUpdate = Trigger(
    'CREATE TRIGGER attachments_pet_match_update BEFORE UPDATE ON attachments WHEN NEW.linked_record_type IS NOT NULL BEGIN SELECT CASE WHEN NEW.linked_record_type = \'vet_appointment\' AND NOT EXISTS (SELECT 1 FROM vet_appointments WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'attachments.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'vaccination\' AND NOT EXISTS (SELECT 1 FROM vaccinations WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'attachments.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'procedure\' AND NOT EXISTS (SELECT 1 FROM procedures_surgeries WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'attachments.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'hospitalization\' AND NOT EXISTS (SELECT 1 FROM hospitalizations WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'attachments.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'illness_custom_event\' AND NOT EXISTS (SELECT 1 FROM illness_custom_events WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'attachments.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'microchip_record\' AND NOT EXISTS (SELECT 1 FROM microchip_records WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'attachments.linked_record_type record does not belong to the selected pet\') END;END',
    'attachments_pet_match_update',
  );
  late final Trigger notesPetMatchInsert = Trigger(
    'CREATE TRIGGER notes_pet_match_insert BEFORE INSERT ON notes WHEN NEW.linked_record_type IS NOT NULL BEGIN SELECT CASE WHEN NEW.linked_record_type = \'vet_appointment\' AND NOT EXISTS (SELECT 1 FROM vet_appointments WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'notes.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'vaccination\' AND NOT EXISTS (SELECT 1 FROM vaccinations WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'notes.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'procedure\' AND NOT EXISTS (SELECT 1 FROM procedures_surgeries WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'notes.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'hospitalization\' AND NOT EXISTS (SELECT 1 FROM hospitalizations WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'notes.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'illness_custom_event\' AND NOT EXISTS (SELECT 1 FROM illness_custom_events WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'notes.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'microchip_record\' AND NOT EXISTS (SELECT 1 FROM microchip_records WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'notes.linked_record_type record does not belong to the selected pet\') END;END',
    'notes_pet_match_insert',
  );
  late final Trigger notesPetMatchUpdate = Trigger(
    'CREATE TRIGGER notes_pet_match_update BEFORE UPDATE ON notes WHEN NEW.linked_record_type IS NOT NULL BEGIN SELECT CASE WHEN NEW.linked_record_type = \'vet_appointment\' AND NOT EXISTS (SELECT 1 FROM vet_appointments WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'notes.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'vaccination\' AND NOT EXISTS (SELECT 1 FROM vaccinations WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'notes.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'procedure\' AND NOT EXISTS (SELECT 1 FROM procedures_surgeries WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'notes.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'hospitalization\' AND NOT EXISTS (SELECT 1 FROM hospitalizations WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'notes.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'illness_custom_event\' AND NOT EXISTS (SELECT 1 FROM illness_custom_events WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'notes.linked_record_type record does not belong to the selected pet\') WHEN NEW.linked_record_type = \'microchip_record\' AND NOT EXISTS (SELECT 1 FROM microchip_records WHERE id = NEW.linked_record_id AND pet_id = NEW.pet_id) THEN RAISE (ABORT, \'notes.linked_record_type record does not belong to the selected pet\') END;END',
    'notes_pet_match_update',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    pets,
    people,
    vetAppointments,
    hospitalizations,
    proceduresSurgeries,
    illnessCustomEvents,
    vaccinations,
    microchipRecords,
    medications,
    medicationPhases,
    medicationDoses,
    reminders,
    attachments,
    notes,
    appSettings,
    idxVetAppointmentsPet,
    idxHospitalizationsPet,
    idxProceduresPet,
    idxIllnessEventsPet,
    idxVaccinationsPet,
    idxMicrochipPet,
    idxMedicationsPet,
    idxMedicationPhasesMedication,
    idxMedicationDosesMedication,
    idxRemindersPet,
    idxRemindersStatusDue,
    idxAttachmentsPet,
    idxNotesPet,
    remindersPetMatchInsert,
    remindersPetMatchUpdate,
    attachmentsPetMatchInsert,
    attachmentsPetMatchUpdate,
    notesPetMatchInsert,
    notesPetMatchUpdate,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'reminders',
        limitUpdateKind: UpdateKind.insert,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'reminders',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'attachments',
        limitUpdateKind: UpdateKind.insert,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'attachments',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'notes',
        limitUpdateKind: UpdateKind.insert,
      ),
      result: [],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'notes',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [],
    ),
  ]);
}

typedef $PetsCreateCompanionBuilder =
    PetsCompanion Function({
      required String id,
      required String name,
      required String species,
      Value<String?> breed,
      Value<String?> sex,
      Value<String?> dateOfBirth,
      Value<int?> approximateAgeValue,
      Value<String?> approximateAgeSetAt,
      Value<String?> colorMarkings,
      Value<String?> sterilizationStatus,
      Value<String> lifeStatus,
      required String createdAt,
      required String lastEditedAt,
      Value<int> rowid,
    });
typedef $PetsUpdateCompanionBuilder =
    PetsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> species,
      Value<String?> breed,
      Value<String?> sex,
      Value<String?> dateOfBirth,
      Value<int?> approximateAgeValue,
      Value<String?> approximateAgeSetAt,
      Value<String?> colorMarkings,
      Value<String?> sterilizationStatus,
      Value<String> lifeStatus,
      Value<String> createdAt,
      Value<String> lastEditedAt,
      Value<int> rowid,
    });

final class $PetsReferences extends BaseReferences<_$AppDatabase, Pets, Pet> {
  $PetsReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<VetAppointments, List<VetAppointment>>
  _vetAppointmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.vetAppointments,
    aliasName: 'pets__id__vet_appointments__pet_id',
  );

  $VetAppointmentsProcessedTableManager get vetAppointmentsRefs {
    final manager = $VetAppointmentsTableManager(
      $_db,
      $_db.vetAppointments,
    ).filter((f) => f.petId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _vetAppointmentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<Hospitalizations, List<Hospitalization>>
  _hospitalizationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.hospitalizations,
    aliasName: 'pets__id__hospitalizations__pet_id',
  );

  $HospitalizationsProcessedTableManager get hospitalizationsRefs {
    final manager = $HospitalizationsTableManager(
      $_db,
      $_db.hospitalizations,
    ).filter((f) => f.petId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _hospitalizationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<ProceduresSurgeries, List<ProceduresSurgery>>
  _proceduresSurgeriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.proceduresSurgeries,
        aliasName: 'pets__id__procedures_surgeries__pet_id',
      );

  $ProceduresSurgeriesProcessedTableManager get proceduresSurgeriesRefs {
    final manager = $ProceduresSurgeriesTableManager(
      $_db,
      $_db.proceduresSurgeries,
    ).filter((f) => f.petId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _proceduresSurgeriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<IllnessCustomEvents, List<IllnessCustomEvent>>
  _illnessCustomEventsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.illnessCustomEvents,
        aliasName: 'pets__id__illness_custom_events__pet_id',
      );

  $IllnessCustomEventsProcessedTableManager get illnessCustomEventsRefs {
    final manager = $IllnessCustomEventsTableManager(
      $_db,
      $_db.illnessCustomEvents,
    ).filter((f) => f.petId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _illnessCustomEventsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<Vaccinations, List<Vaccination>>
  _vaccinationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.vaccinations,
    aliasName: 'pets__id__vaccinations__pet_id',
  );

  $VaccinationsProcessedTableManager get vaccinationsRefs {
    final manager = $VaccinationsTableManager(
      $_db,
      $_db.vaccinations,
    ).filter((f) => f.petId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_vaccinationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<MicrochipRecords, List<MicrochipRecord>>
  _microchipRecordsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.microchipRecords,
    aliasName: 'pets__id__microchip_records__pet_id',
  );

  $MicrochipRecordsProcessedTableManager get microchipRecordsRefs {
    final manager = $MicrochipRecordsTableManager(
      $_db,
      $_db.microchipRecords,
    ).filter((f) => f.petId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _microchipRecordsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<Medications, List<Medication>>
  _medicationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.medications,
    aliasName: 'pets__id__medications__pet_id',
  );

  $MedicationsProcessedTableManager get medicationsRefs {
    final manager = $MedicationsTableManager(
      $_db,
      $_db.medications,
    ).filter((f) => f.petId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_medicationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<Reminders, List<Reminder>> _remindersRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.reminders,
    aliasName: 'pets__id__reminders__pet_id',
  );

  $RemindersProcessedTableManager get remindersRefs {
    final manager = $RemindersTableManager(
      $_db,
      $_db.reminders,
    ).filter((f) => f.petId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_remindersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<Attachments, List<Attachment>>
  _attachmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.attachments,
    aliasName: 'pets__id__attachments__pet_id',
  );

  $AttachmentsProcessedTableManager get attachmentsRefs {
    final manager = $AttachmentsTableManager(
      $_db,
      $_db.attachments,
    ).filter((f) => f.petId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_attachmentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<Notes, List<Note>> _notesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.notes,
    aliasName: 'pets__id__notes__pet_id',
  );

  $NotesProcessedTableManager get notesRefs {
    final manager = $NotesTableManager(
      $_db,
      $_db.notes,
    ).filter((f) => f.petId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_notesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $PetsFilterComposer extends Composer<_$AppDatabase, Pets> {
  $PetsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breed => $composableBuilder(
    column: $table.breed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get approximateAgeValue => $composableBuilder(
    column: $table.approximateAgeValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get approximateAgeSetAt => $composableBuilder(
    column: $table.approximateAgeSetAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorMarkings => $composableBuilder(
    column: $table.colorMarkings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sterilizationStatus => $composableBuilder(
    column: $table.sterilizationStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lifeStatus => $composableBuilder(
    column: $table.lifeStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> vetAppointmentsRefs(
    Expression<bool> Function($VetAppointmentsFilterComposer f) f,
  ) {
    final $VetAppointmentsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vetAppointments,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $VetAppointmentsFilterComposer(
            $db: $db,
            $table: $db.vetAppointments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> hospitalizationsRefs(
    Expression<bool> Function($HospitalizationsFilterComposer f) f,
  ) {
    final $HospitalizationsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.hospitalizations,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $HospitalizationsFilterComposer(
            $db: $db,
            $table: $db.hospitalizations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> proceduresSurgeriesRefs(
    Expression<bool> Function($ProceduresSurgeriesFilterComposer f) f,
  ) {
    final $ProceduresSurgeriesFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.proceduresSurgeries,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $ProceduresSurgeriesFilterComposer(
            $db: $db,
            $table: $db.proceduresSurgeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> illnessCustomEventsRefs(
    Expression<bool> Function($IllnessCustomEventsFilterComposer f) f,
  ) {
    final $IllnessCustomEventsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.illnessCustomEvents,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $IllnessCustomEventsFilterComposer(
            $db: $db,
            $table: $db.illnessCustomEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> vaccinationsRefs(
    Expression<bool> Function($VaccinationsFilterComposer f) f,
  ) {
    final $VaccinationsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vaccinations,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $VaccinationsFilterComposer(
            $db: $db,
            $table: $db.vaccinations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> microchipRecordsRefs(
    Expression<bool> Function($MicrochipRecordsFilterComposer f) f,
  ) {
    final $MicrochipRecordsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.microchipRecords,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MicrochipRecordsFilterComposer(
            $db: $db,
            $table: $db.microchipRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> medicationsRefs(
    Expression<bool> Function($MedicationsFilterComposer f) f,
  ) {
    final $MedicationsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MedicationsFilterComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> remindersRefs(
    Expression<bool> Function($RemindersFilterComposer f) f,
  ) {
    final $RemindersFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminders,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $RemindersFilterComposer(
            $db: $db,
            $table: $db.reminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> attachmentsRefs(
    Expression<bool> Function($AttachmentsFilterComposer f) f,
  ) {
    final $AttachmentsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.attachments,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $AttachmentsFilterComposer(
            $db: $db,
            $table: $db.attachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> notesRefs(
    Expression<bool> Function($NotesFilterComposer f) f,
  ) {
    final $NotesFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $NotesFilterComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $PetsOrderingComposer extends Composer<_$AppDatabase, Pets> {
  $PetsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breed => $composableBuilder(
    column: $table.breed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get approximateAgeValue => $composableBuilder(
    column: $table.approximateAgeValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get approximateAgeSetAt => $composableBuilder(
    column: $table.approximateAgeSetAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorMarkings => $composableBuilder(
    column: $table.colorMarkings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sterilizationStatus => $composableBuilder(
    column: $table.sterilizationStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lifeStatus => $composableBuilder(
    column: $table.lifeStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $PetsAnnotationComposer extends Composer<_$AppDatabase, Pets> {
  $PetsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get species =>
      $composableBuilder(column: $table.species, builder: (column) => column);

  GeneratedColumn<String> get breed =>
      $composableBuilder(column: $table.breed, builder: (column) => column);

  GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<String> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => column,
  );

  GeneratedColumn<int> get approximateAgeValue => $composableBuilder(
    column: $table.approximateAgeValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get approximateAgeSetAt => $composableBuilder(
    column: $table.approximateAgeSetAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get colorMarkings => $composableBuilder(
    column: $table.colorMarkings,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sterilizationStatus => $composableBuilder(
    column: $table.sterilizationStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lifeStatus => $composableBuilder(
    column: $table.lifeStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => column,
  );

  Expression<T> vetAppointmentsRefs<T extends Object>(
    Expression<T> Function($VetAppointmentsAnnotationComposer a) f,
  ) {
    final $VetAppointmentsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vetAppointments,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $VetAppointmentsAnnotationComposer(
            $db: $db,
            $table: $db.vetAppointments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> hospitalizationsRefs<T extends Object>(
    Expression<T> Function($HospitalizationsAnnotationComposer a) f,
  ) {
    final $HospitalizationsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.hospitalizations,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $HospitalizationsAnnotationComposer(
            $db: $db,
            $table: $db.hospitalizations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> proceduresSurgeriesRefs<T extends Object>(
    Expression<T> Function($ProceduresSurgeriesAnnotationComposer a) f,
  ) {
    final $ProceduresSurgeriesAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.proceduresSurgeries,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $ProceduresSurgeriesAnnotationComposer(
            $db: $db,
            $table: $db.proceduresSurgeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> illnessCustomEventsRefs<T extends Object>(
    Expression<T> Function($IllnessCustomEventsAnnotationComposer a) f,
  ) {
    final $IllnessCustomEventsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.illnessCustomEvents,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $IllnessCustomEventsAnnotationComposer(
            $db: $db,
            $table: $db.illnessCustomEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> vaccinationsRefs<T extends Object>(
    Expression<T> Function($VaccinationsAnnotationComposer a) f,
  ) {
    final $VaccinationsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vaccinations,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $VaccinationsAnnotationComposer(
            $db: $db,
            $table: $db.vaccinations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> microchipRecordsRefs<T extends Object>(
    Expression<T> Function($MicrochipRecordsAnnotationComposer a) f,
  ) {
    final $MicrochipRecordsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.microchipRecords,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MicrochipRecordsAnnotationComposer(
            $db: $db,
            $table: $db.microchipRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> medicationsRefs<T extends Object>(
    Expression<T> Function($MedicationsAnnotationComposer a) f,
  ) {
    final $MedicationsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MedicationsAnnotationComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> remindersRefs<T extends Object>(
    Expression<T> Function($RemindersAnnotationComposer a) f,
  ) {
    final $RemindersAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminders,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $RemindersAnnotationComposer(
            $db: $db,
            $table: $db.reminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> attachmentsRefs<T extends Object>(
    Expression<T> Function($AttachmentsAnnotationComposer a) f,
  ) {
    final $AttachmentsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.attachments,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $AttachmentsAnnotationComposer(
            $db: $db,
            $table: $db.attachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> notesRefs<T extends Object>(
    Expression<T> Function($NotesAnnotationComposer a) f,
  ) {
    final $NotesAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.petId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $NotesAnnotationComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $PetsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Pets,
          Pet,
          $PetsFilterComposer,
          $PetsOrderingComposer,
          $PetsAnnotationComposer,
          $PetsCreateCompanionBuilder,
          $PetsUpdateCompanionBuilder,
          (Pet, $PetsReferences),
          Pet,
          PrefetchHooks Function({
            bool vetAppointmentsRefs,
            bool hospitalizationsRefs,
            bool proceduresSurgeriesRefs,
            bool illnessCustomEventsRefs,
            bool vaccinationsRefs,
            bool microchipRecordsRefs,
            bool medicationsRefs,
            bool remindersRefs,
            bool attachmentsRefs,
            bool notesRefs,
          })
        > {
  $PetsTableManager(_$AppDatabase db, Pets table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $PetsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $PetsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $PetsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> species = const Value.absent(),
                Value<String?> breed = const Value.absent(),
                Value<String?> sex = const Value.absent(),
                Value<String?> dateOfBirth = const Value.absent(),
                Value<int?> approximateAgeValue = const Value.absent(),
                Value<String?> approximateAgeSetAt = const Value.absent(),
                Value<String?> colorMarkings = const Value.absent(),
                Value<String?> sterilizationStatus = const Value.absent(),
                Value<String> lifeStatus = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> lastEditedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PetsCompanion(
                id: id,
                name: name,
                species: species,
                breed: breed,
                sex: sex,
                dateOfBirth: dateOfBirth,
                approximateAgeValue: approximateAgeValue,
                approximateAgeSetAt: approximateAgeSetAt,
                colorMarkings: colorMarkings,
                sterilizationStatus: sterilizationStatus,
                lifeStatus: lifeStatus,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String species,
                Value<String?> breed = const Value.absent(),
                Value<String?> sex = const Value.absent(),
                Value<String?> dateOfBirth = const Value.absent(),
                Value<int?> approximateAgeValue = const Value.absent(),
                Value<String?> approximateAgeSetAt = const Value.absent(),
                Value<String?> colorMarkings = const Value.absent(),
                Value<String?> sterilizationStatus = const Value.absent(),
                Value<String> lifeStatus = const Value.absent(),
                required String createdAt,
                required String lastEditedAt,
                Value<int> rowid = const Value.absent(),
              }) => PetsCompanion.insert(
                id: id,
                name: name,
                species: species,
                breed: breed,
                sex: sex,
                dateOfBirth: dateOfBirth,
                approximateAgeValue: approximateAgeValue,
                approximateAgeSetAt: approximateAgeSetAt,
                colorMarkings: colorMarkings,
                sterilizationStatus: sterilizationStatus,
                lifeStatus: lifeStatus,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), $PetsReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback:
              ({
                vetAppointmentsRefs = false,
                hospitalizationsRefs = false,
                proceduresSurgeriesRefs = false,
                illnessCustomEventsRefs = false,
                vaccinationsRefs = false,
                microchipRecordsRefs = false,
                medicationsRefs = false,
                remindersRefs = false,
                attachmentsRefs = false,
                notesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (vetAppointmentsRefs) db.vetAppointments,
                    if (hospitalizationsRefs) db.hospitalizations,
                    if (proceduresSurgeriesRefs) db.proceduresSurgeries,
                    if (illnessCustomEventsRefs) db.illnessCustomEvents,
                    if (vaccinationsRefs) db.vaccinations,
                    if (microchipRecordsRefs) db.microchipRecords,
                    if (medicationsRefs) db.medications,
                    if (remindersRefs) db.reminders,
                    if (attachmentsRefs) db.attachments,
                    if (notesRefs) db.notes,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (vetAppointmentsRefs)
                        await $_getPrefetchedData<Pet, Pets, VetAppointment>(
                          currentTable: table,
                          referencedTable: $PetsReferences
                              ._vetAppointmentsRefsTable(db),
                          managerFromTypedResult: (p0) => $PetsReferences(
                            db,
                            table,
                            p0,
                          ).vetAppointmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.petId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (hospitalizationsRefs)
                        await $_getPrefetchedData<Pet, Pets, Hospitalization>(
                          currentTable: table,
                          referencedTable: $PetsReferences
                              ._hospitalizationsRefsTable(db),
                          managerFromTypedResult: (p0) => $PetsReferences(
                            db,
                            table,
                            p0,
                          ).hospitalizationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.petId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (proceduresSurgeriesRefs)
                        await $_getPrefetchedData<Pet, Pets, ProceduresSurgery>(
                          currentTable: table,
                          referencedTable: $PetsReferences
                              ._proceduresSurgeriesRefsTable(db),
                          managerFromTypedResult: (p0) => $PetsReferences(
                            db,
                            table,
                            p0,
                          ).proceduresSurgeriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.petId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (illnessCustomEventsRefs)
                        await $_getPrefetchedData<
                          Pet,
                          Pets,
                          IllnessCustomEvent
                        >(
                          currentTable: table,
                          referencedTable: $PetsReferences
                              ._illnessCustomEventsRefsTable(db),
                          managerFromTypedResult: (p0) => $PetsReferences(
                            db,
                            table,
                            p0,
                          ).illnessCustomEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.petId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (vaccinationsRefs)
                        await $_getPrefetchedData<Pet, Pets, Vaccination>(
                          currentTable: table,
                          referencedTable: $PetsReferences
                              ._vaccinationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $PetsReferences(db, table, p0).vaccinationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.petId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (microchipRecordsRefs)
                        await $_getPrefetchedData<Pet, Pets, MicrochipRecord>(
                          currentTable: table,
                          referencedTable: $PetsReferences
                              ._microchipRecordsRefsTable(db),
                          managerFromTypedResult: (p0) => $PetsReferences(
                            db,
                            table,
                            p0,
                          ).microchipRecordsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.petId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (medicationsRefs)
                        await $_getPrefetchedData<Pet, Pets, Medication>(
                          currentTable: table,
                          referencedTable: $PetsReferences
                              ._medicationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $PetsReferences(db, table, p0).medicationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.petId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (remindersRefs)
                        await $_getPrefetchedData<Pet, Pets, Reminder>(
                          currentTable: table,
                          referencedTable: $PetsReferences._remindersRefsTable(
                            db,
                          ),
                          managerFromTypedResult: (p0) =>
                              $PetsReferences(db, table, p0).remindersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.petId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (attachmentsRefs)
                        await $_getPrefetchedData<Pet, Pets, Attachment>(
                          currentTable: table,
                          referencedTable: $PetsReferences
                              ._attachmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $PetsReferences(db, table, p0).attachmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.petId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (notesRefs)
                        await $_getPrefetchedData<Pet, Pets, Note>(
                          currentTable: table,
                          referencedTable: $PetsReferences._notesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $PetsReferences(db, table, p0).notesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.petId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $PetsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Pets,
      Pet,
      $PetsFilterComposer,
      $PetsOrderingComposer,
      $PetsAnnotationComposer,
      $PetsCreateCompanionBuilder,
      $PetsUpdateCompanionBuilder,
      (Pet, $PetsReferences),
      Pet,
      PrefetchHooks Function({
        bool vetAppointmentsRefs,
        bool hospitalizationsRefs,
        bool proceduresSurgeriesRefs,
        bool illnessCustomEventsRefs,
        bool vaccinationsRefs,
        bool microchipRecordsRefs,
        bool medicationsRefs,
        bool remindersRefs,
        bool attachmentsRefs,
        bool notesRefs,
      })
    >;
typedef $PeopleCreateCompanionBuilder =
    PeopleCompanion Function({
      required String id,
      required String name,
      Value<String?> relationshipLabel,
      Value<String?> contactInfo,
      Value<bool> isArchived,
      required String createdAt,
      required String lastEditedAt,
      Value<int> rowid,
    });
typedef $PeopleUpdateCompanionBuilder =
    PeopleCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> relationshipLabel,
      Value<String?> contactInfo,
      Value<bool> isArchived,
      Value<String> createdAt,
      Value<String> lastEditedAt,
      Value<int> rowid,
    });

final class $PeopleReferences
    extends BaseReferences<_$AppDatabase, People, PeopleData> {
  $PeopleReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<VetAppointments, List<VetAppointment>>
  _vetAppointmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.vetAppointments,
    aliasName: 'people__id__vet_appointments__handled_by_person_id',
  );

  $VetAppointmentsProcessedTableManager get vetAppointmentsRefs {
    final manager = $VetAppointmentsTableManager($_db, $_db.vetAppointments)
        .filter(
          (f) => f.handledByPersonId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _vetAppointmentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<Hospitalizations, List<Hospitalization>>
  _hospitalizationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.hospitalizations,
    aliasName: 'people__id__hospitalizations__handled_by_person_id',
  );

  $HospitalizationsProcessedTableManager get hospitalizationsRefs {
    final manager = $HospitalizationsTableManager($_db, $_db.hospitalizations)
        .filter(
          (f) => f.handledByPersonId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _hospitalizationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<ProceduresSurgeries, List<ProceduresSurgery>>
  _proceduresSurgeriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.proceduresSurgeries,
        aliasName: 'people__id__procedures_surgeries__handled_by_person_id',
      );

  $ProceduresSurgeriesProcessedTableManager get proceduresSurgeriesRefs {
    final manager =
        $ProceduresSurgeriesTableManager($_db, $_db.proceduresSurgeries).filter(
          (f) => f.handledByPersonId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _proceduresSurgeriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<IllnessCustomEvents, List<IllnessCustomEvent>>
  _illnessCustomEventsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.illnessCustomEvents,
        aliasName: 'people__id__illness_custom_events__handled_by_person_id',
      );

  $IllnessCustomEventsProcessedTableManager get illnessCustomEventsRefs {
    final manager =
        $IllnessCustomEventsTableManager($_db, $_db.illnessCustomEvents).filter(
          (f) => f.handledByPersonId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _illnessCustomEventsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<Vaccinations, List<Vaccination>>
  _vaccinationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.vaccinations,
    aliasName: 'people__id__vaccinations__handled_by_person_id',
  );

  $VaccinationsProcessedTableManager get vaccinationsRefs {
    final manager = $VaccinationsTableManager($_db, $_db.vaccinations).filter(
      (f) => f.handledByPersonId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_vaccinationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<Medications, List<Medication>>
  _medicationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.medications,
    aliasName: 'people__id__medications__handled_by_person_id',
  );

  $MedicationsProcessedTableManager get medicationsRefs {
    final manager = $MedicationsTableManager($_db, $_db.medications).filter(
      (f) => f.handledByPersonId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_medicationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<Notes, List<Note>> _notesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.notes,
    aliasName: 'people__id__notes__handled_by_person_id',
  );

  $NotesProcessedTableManager get notesRefs {
    final manager = $NotesTableManager($_db, $_db.notes).filter(
      (f) => f.handledByPersonId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_notesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $PeopleFilterComposer extends Composer<_$AppDatabase, People> {
  $PeopleFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relationshipLabel => $composableBuilder(
    column: $table.relationshipLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contactInfo => $composableBuilder(
    column: $table.contactInfo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> vetAppointmentsRefs(
    Expression<bool> Function($VetAppointmentsFilterComposer f) f,
  ) {
    final $VetAppointmentsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vetAppointments,
      getReferencedColumn: (t) => t.handledByPersonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $VetAppointmentsFilterComposer(
            $db: $db,
            $table: $db.vetAppointments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> hospitalizationsRefs(
    Expression<bool> Function($HospitalizationsFilterComposer f) f,
  ) {
    final $HospitalizationsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.hospitalizations,
      getReferencedColumn: (t) => t.handledByPersonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $HospitalizationsFilterComposer(
            $db: $db,
            $table: $db.hospitalizations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> proceduresSurgeriesRefs(
    Expression<bool> Function($ProceduresSurgeriesFilterComposer f) f,
  ) {
    final $ProceduresSurgeriesFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.proceduresSurgeries,
      getReferencedColumn: (t) => t.handledByPersonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $ProceduresSurgeriesFilterComposer(
            $db: $db,
            $table: $db.proceduresSurgeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> illnessCustomEventsRefs(
    Expression<bool> Function($IllnessCustomEventsFilterComposer f) f,
  ) {
    final $IllnessCustomEventsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.illnessCustomEvents,
      getReferencedColumn: (t) => t.handledByPersonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $IllnessCustomEventsFilterComposer(
            $db: $db,
            $table: $db.illnessCustomEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> vaccinationsRefs(
    Expression<bool> Function($VaccinationsFilterComposer f) f,
  ) {
    final $VaccinationsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vaccinations,
      getReferencedColumn: (t) => t.handledByPersonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $VaccinationsFilterComposer(
            $db: $db,
            $table: $db.vaccinations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> medicationsRefs(
    Expression<bool> Function($MedicationsFilterComposer f) f,
  ) {
    final $MedicationsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.handledByPersonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MedicationsFilterComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> notesRefs(
    Expression<bool> Function($NotesFilterComposer f) f,
  ) {
    final $NotesFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.handledByPersonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $NotesFilterComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $PeopleOrderingComposer extends Composer<_$AppDatabase, People> {
  $PeopleOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relationshipLabel => $composableBuilder(
    column: $table.relationshipLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contactInfo => $composableBuilder(
    column: $table.contactInfo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $PeopleAnnotationComposer extends Composer<_$AppDatabase, People> {
  $PeopleAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get relationshipLabel => $composableBuilder(
    column: $table.relationshipLabel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contactInfo => $composableBuilder(
    column: $table.contactInfo,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => column,
  );

  Expression<T> vetAppointmentsRefs<T extends Object>(
    Expression<T> Function($VetAppointmentsAnnotationComposer a) f,
  ) {
    final $VetAppointmentsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vetAppointments,
      getReferencedColumn: (t) => t.handledByPersonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $VetAppointmentsAnnotationComposer(
            $db: $db,
            $table: $db.vetAppointments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> hospitalizationsRefs<T extends Object>(
    Expression<T> Function($HospitalizationsAnnotationComposer a) f,
  ) {
    final $HospitalizationsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.hospitalizations,
      getReferencedColumn: (t) => t.handledByPersonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $HospitalizationsAnnotationComposer(
            $db: $db,
            $table: $db.hospitalizations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> proceduresSurgeriesRefs<T extends Object>(
    Expression<T> Function($ProceduresSurgeriesAnnotationComposer a) f,
  ) {
    final $ProceduresSurgeriesAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.proceduresSurgeries,
      getReferencedColumn: (t) => t.handledByPersonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $ProceduresSurgeriesAnnotationComposer(
            $db: $db,
            $table: $db.proceduresSurgeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> illnessCustomEventsRefs<T extends Object>(
    Expression<T> Function($IllnessCustomEventsAnnotationComposer a) f,
  ) {
    final $IllnessCustomEventsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.illnessCustomEvents,
      getReferencedColumn: (t) => t.handledByPersonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $IllnessCustomEventsAnnotationComposer(
            $db: $db,
            $table: $db.illnessCustomEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> vaccinationsRefs<T extends Object>(
    Expression<T> Function($VaccinationsAnnotationComposer a) f,
  ) {
    final $VaccinationsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vaccinations,
      getReferencedColumn: (t) => t.handledByPersonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $VaccinationsAnnotationComposer(
            $db: $db,
            $table: $db.vaccinations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> medicationsRefs<T extends Object>(
    Expression<T> Function($MedicationsAnnotationComposer a) f,
  ) {
    final $MedicationsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.handledByPersonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MedicationsAnnotationComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> notesRefs<T extends Object>(
    Expression<T> Function($NotesAnnotationComposer a) f,
  ) {
    final $NotesAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.handledByPersonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $NotesAnnotationComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $PeopleTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          People,
          PeopleData,
          $PeopleFilterComposer,
          $PeopleOrderingComposer,
          $PeopleAnnotationComposer,
          $PeopleCreateCompanionBuilder,
          $PeopleUpdateCompanionBuilder,
          (PeopleData, $PeopleReferences),
          PeopleData,
          PrefetchHooks Function({
            bool vetAppointmentsRefs,
            bool hospitalizationsRefs,
            bool proceduresSurgeriesRefs,
            bool illnessCustomEventsRefs,
            bool vaccinationsRefs,
            bool medicationsRefs,
            bool notesRefs,
          })
        > {
  $PeopleTableManager(_$AppDatabase db, People table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $PeopleFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $PeopleOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $PeopleAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> relationshipLabel = const Value.absent(),
                Value<String?> contactInfo = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> lastEditedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PeopleCompanion(
                id: id,
                name: name,
                relationshipLabel: relationshipLabel,
                contactInfo: contactInfo,
                isArchived: isArchived,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> relationshipLabel = const Value.absent(),
                Value<String?> contactInfo = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                required String createdAt,
                required String lastEditedAt,
                Value<int> rowid = const Value.absent(),
              }) => PeopleCompanion.insert(
                id: id,
                name: name,
                relationshipLabel: relationshipLabel,
                contactInfo: contactInfo,
                isArchived: isArchived,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), $PeopleReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback:
              ({
                vetAppointmentsRefs = false,
                hospitalizationsRefs = false,
                proceduresSurgeriesRefs = false,
                illnessCustomEventsRefs = false,
                vaccinationsRefs = false,
                medicationsRefs = false,
                notesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (vetAppointmentsRefs) db.vetAppointments,
                    if (hospitalizationsRefs) db.hospitalizations,
                    if (proceduresSurgeriesRefs) db.proceduresSurgeries,
                    if (illnessCustomEventsRefs) db.illnessCustomEvents,
                    if (vaccinationsRefs) db.vaccinations,
                    if (medicationsRefs) db.medications,
                    if (notesRefs) db.notes,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (vetAppointmentsRefs)
                        await $_getPrefetchedData<
                          PeopleData,
                          People,
                          VetAppointment
                        >(
                          currentTable: table,
                          referencedTable: $PeopleReferences
                              ._vetAppointmentsRefsTable(db),
                          managerFromTypedResult: (p0) => $PeopleReferences(
                            db,
                            table,
                            p0,
                          ).vetAppointmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.handledByPersonId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (hospitalizationsRefs)
                        await $_getPrefetchedData<
                          PeopleData,
                          People,
                          Hospitalization
                        >(
                          currentTable: table,
                          referencedTable: $PeopleReferences
                              ._hospitalizationsRefsTable(db),
                          managerFromTypedResult: (p0) => $PeopleReferences(
                            db,
                            table,
                            p0,
                          ).hospitalizationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.handledByPersonId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (proceduresSurgeriesRefs)
                        await $_getPrefetchedData<
                          PeopleData,
                          People,
                          ProceduresSurgery
                        >(
                          currentTable: table,
                          referencedTable: $PeopleReferences
                              ._proceduresSurgeriesRefsTable(db),
                          managerFromTypedResult: (p0) => $PeopleReferences(
                            db,
                            table,
                            p0,
                          ).proceduresSurgeriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.handledByPersonId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (illnessCustomEventsRefs)
                        await $_getPrefetchedData<
                          PeopleData,
                          People,
                          IllnessCustomEvent
                        >(
                          currentTable: table,
                          referencedTable: $PeopleReferences
                              ._illnessCustomEventsRefsTable(db),
                          managerFromTypedResult: (p0) => $PeopleReferences(
                            db,
                            table,
                            p0,
                          ).illnessCustomEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.handledByPersonId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (vaccinationsRefs)
                        await $_getPrefetchedData<
                          PeopleData,
                          People,
                          Vaccination
                        >(
                          currentTable: table,
                          referencedTable: $PeopleReferences
                              ._vaccinationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $PeopleReferences(db, table, p0).vaccinationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.handledByPersonId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (medicationsRefs)
                        await $_getPrefetchedData<
                          PeopleData,
                          People,
                          Medication
                        >(
                          currentTable: table,
                          referencedTable: $PeopleReferences
                              ._medicationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $PeopleReferences(db, table, p0).medicationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.handledByPersonId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (notesRefs)
                        await $_getPrefetchedData<PeopleData, People, Note>(
                          currentTable: table,
                          referencedTable: $PeopleReferences._notesRefsTable(
                            db,
                          ),
                          managerFromTypedResult: (p0) =>
                              $PeopleReferences(db, table, p0).notesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.handledByPersonId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $PeopleProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      People,
      PeopleData,
      $PeopleFilterComposer,
      $PeopleOrderingComposer,
      $PeopleAnnotationComposer,
      $PeopleCreateCompanionBuilder,
      $PeopleUpdateCompanionBuilder,
      (PeopleData, $PeopleReferences),
      PeopleData,
      PrefetchHooks Function({
        bool vetAppointmentsRefs,
        bool hospitalizationsRefs,
        bool proceduresSurgeriesRefs,
        bool illnessCustomEventsRefs,
        bool vaccinationsRefs,
        bool medicationsRefs,
        bool notesRefs,
      })
    >;
typedef $VetAppointmentsCreateCompanionBuilder =
    VetAppointmentsCompanion Function({
      required String id,
      required String petId,
      required String date,
      required String reason,
      Value<String?> clinicName,
      Value<String?> outcomeNotes,
      Value<String> status,
      Value<String?> handledByPersonId,
      required String createdAt,
      required String lastEditedAt,
      Value<int> rowid,
    });
typedef $VetAppointmentsUpdateCompanionBuilder =
    VetAppointmentsCompanion Function({
      Value<String> id,
      Value<String> petId,
      Value<String> date,
      Value<String> reason,
      Value<String?> clinicName,
      Value<String?> outcomeNotes,
      Value<String> status,
      Value<String?> handledByPersonId,
      Value<String> createdAt,
      Value<String> lastEditedAt,
      Value<int> rowid,
    });

final class $VetAppointmentsReferences
    extends BaseReferences<_$AppDatabase, VetAppointments, VetAppointment> {
  $VetAppointmentsReferences(super.$_db, super.$_table, super.$_typedResult);

  static Pets _petIdTable(_$AppDatabase db) =>
      db.pets.createAlias('vet_appointments__pet_id__pets__id');

  $PetsProcessedTableManager get petId {
    final $_column = $_itemColumn<String>('pet_id')!;

    final manager = $PetsTableManager(
      $_db,
      $_db.pets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static People _handledByPersonIdTable(_$AppDatabase db) => db.people
      .createAlias('vet_appointments__handled_by_person_id__people__id');

  $PeopleProcessedTableManager? get handledByPersonId {
    final $_column = $_itemColumn<String>('handled_by_person_id');
    if ($_column == null) return null;
    final manager = $PeopleTableManager(
      $_db,
      $_db.people,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_handledByPersonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<IllnessCustomEvents, List<IllnessCustomEvent>>
  _illnessCustomEventsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.illnessCustomEvents,
    aliasName:
        'vet_appointments__id__illness_custom_events__related_appointment_id',
  );

  $IllnessCustomEventsProcessedTableManager get illnessCustomEventsRefs {
    final manager =
        $IllnessCustomEventsTableManager($_db, $_db.illnessCustomEvents).filter(
          (f) =>
              f.relatedAppointmentId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _illnessCustomEventsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $VetAppointmentsFilterComposer
    extends Composer<_$AppDatabase, VetAppointments> {
  $VetAppointmentsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clinicName => $composableBuilder(
    column: $table.clinicName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get outcomeNotes => $composableBuilder(
    column: $table.outcomeNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnFilters(column),
  );

  $PetsFilterComposer get petId {
    final $PetsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsFilterComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleFilterComposer get handledByPersonId {
    final $PeopleFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> illnessCustomEventsRefs(
    Expression<bool> Function($IllnessCustomEventsFilterComposer f) f,
  ) {
    final $IllnessCustomEventsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.illnessCustomEvents,
      getReferencedColumn: (t) => t.relatedAppointmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $IllnessCustomEventsFilterComposer(
            $db: $db,
            $table: $db.illnessCustomEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $VetAppointmentsOrderingComposer
    extends Composer<_$AppDatabase, VetAppointments> {
  $VetAppointmentsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clinicName => $composableBuilder(
    column: $table.clinicName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get outcomeNotes => $composableBuilder(
    column: $table.outcomeNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $PetsOrderingComposer get petId {
    final $PetsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsOrderingComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleOrderingComposer get handledByPersonId {
    final $PeopleOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleOrderingComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $VetAppointmentsAnnotationComposer
    extends Composer<_$AppDatabase, VetAppointments> {
  $VetAppointmentsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<String> get clinicName => $composableBuilder(
    column: $table.clinicName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get outcomeNotes => $composableBuilder(
    column: $table.outcomeNotes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => column,
  );

  $PetsAnnotationComposer get petId {
    final $PetsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsAnnotationComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleAnnotationComposer get handledByPersonId {
    final $PeopleAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> illnessCustomEventsRefs<T extends Object>(
    Expression<T> Function($IllnessCustomEventsAnnotationComposer a) f,
  ) {
    final $IllnessCustomEventsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.illnessCustomEvents,
      getReferencedColumn: (t) => t.relatedAppointmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $IllnessCustomEventsAnnotationComposer(
            $db: $db,
            $table: $db.illnessCustomEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $VetAppointmentsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          VetAppointments,
          VetAppointment,
          $VetAppointmentsFilterComposer,
          $VetAppointmentsOrderingComposer,
          $VetAppointmentsAnnotationComposer,
          $VetAppointmentsCreateCompanionBuilder,
          $VetAppointmentsUpdateCompanionBuilder,
          (VetAppointment, $VetAppointmentsReferences),
          VetAppointment,
          PrefetchHooks Function({
            bool petId,
            bool handledByPersonId,
            bool illnessCustomEventsRefs,
          })
        > {
  $VetAppointmentsTableManager(_$AppDatabase db, VetAppointments table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $VetAppointmentsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $VetAppointmentsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $VetAppointmentsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> reason = const Value.absent(),
                Value<String?> clinicName = const Value.absent(),
                Value<String?> outcomeNotes = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> handledByPersonId = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> lastEditedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VetAppointmentsCompanion(
                id: id,
                petId: petId,
                date: date,
                reason: reason,
                clinicName: clinicName,
                outcomeNotes: outcomeNotes,
                status: status,
                handledByPersonId: handledByPersonId,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String petId,
                required String date,
                required String reason,
                Value<String?> clinicName = const Value.absent(),
                Value<String?> outcomeNotes = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> handledByPersonId = const Value.absent(),
                required String createdAt,
                required String lastEditedAt,
                Value<int> rowid = const Value.absent(),
              }) => VetAppointmentsCompanion.insert(
                id: id,
                petId: petId,
                date: date,
                reason: reason,
                clinicName: clinicName,
                outcomeNotes: outcomeNotes,
                status: status,
                handledByPersonId: handledByPersonId,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $VetAppointmentsReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                petId = false,
                handledByPersonId = false,
                illnessCustomEventsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (illnessCustomEventsRefs) db.illnessCustomEvents,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (petId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.petId,
                                    referencedTable: $VetAppointmentsReferences
                                        ._petIdTable(db),
                                    referencedColumn: $VetAppointmentsReferences
                                        ._petIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (handledByPersonId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.handledByPersonId,
                                    referencedTable: $VetAppointmentsReferences
                                        ._handledByPersonIdTable(db),
                                    referencedColumn: $VetAppointmentsReferences
                                        ._handledByPersonIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (illnessCustomEventsRefs)
                        await $_getPrefetchedData<
                          VetAppointment,
                          VetAppointments,
                          IllnessCustomEvent
                        >(
                          currentTable: table,
                          referencedTable: $VetAppointmentsReferences
                              ._illnessCustomEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $VetAppointmentsReferences(
                                db,
                                table,
                                p0,
                              ).illnessCustomEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.relatedAppointmentId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $VetAppointmentsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      VetAppointments,
      VetAppointment,
      $VetAppointmentsFilterComposer,
      $VetAppointmentsOrderingComposer,
      $VetAppointmentsAnnotationComposer,
      $VetAppointmentsCreateCompanionBuilder,
      $VetAppointmentsUpdateCompanionBuilder,
      (VetAppointment, $VetAppointmentsReferences),
      VetAppointment,
      PrefetchHooks Function({
        bool petId,
        bool handledByPersonId,
        bool illnessCustomEventsRefs,
      })
    >;
typedef $HospitalizationsCreateCompanionBuilder =
    HospitalizationsCompanion Function({
      required String id,
      required String petId,
      required String admissionDate,
      Value<String?> dischargeDate,
      required String reason,
      Value<String?> provider,
      Value<String?> outcomeNotes,
      Value<String?> handledByPersonId,
      required String createdAt,
      required String lastEditedAt,
      Value<int> rowid,
    });
typedef $HospitalizationsUpdateCompanionBuilder =
    HospitalizationsCompanion Function({
      Value<String> id,
      Value<String> petId,
      Value<String> admissionDate,
      Value<String?> dischargeDate,
      Value<String> reason,
      Value<String?> provider,
      Value<String?> outcomeNotes,
      Value<String?> handledByPersonId,
      Value<String> createdAt,
      Value<String> lastEditedAt,
      Value<int> rowid,
    });

final class $HospitalizationsReferences
    extends BaseReferences<_$AppDatabase, Hospitalizations, Hospitalization> {
  $HospitalizationsReferences(super.$_db, super.$_table, super.$_typedResult);

  static Pets _petIdTable(_$AppDatabase db) =>
      db.pets.createAlias('hospitalizations__pet_id__pets__id');

  $PetsProcessedTableManager get petId {
    final $_column = $_itemColumn<String>('pet_id')!;

    final manager = $PetsTableManager(
      $_db,
      $_db.pets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static People _handledByPersonIdTable(_$AppDatabase db) => db.people
      .createAlias('hospitalizations__handled_by_person_id__people__id');

  $PeopleProcessedTableManager? get handledByPersonId {
    final $_column = $_itemColumn<String>('handled_by_person_id');
    if ($_column == null) return null;
    final manager = $PeopleTableManager(
      $_db,
      $_db.people,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_handledByPersonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<ProceduresSurgeries, List<ProceduresSurgery>>
  _proceduresSurgeriesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.proceduresSurgeries,
    aliasName:
        'hospitalizations__id__procedures_surgeries__related_hospitalization_id',
  );

  $ProceduresSurgeriesProcessedTableManager get proceduresSurgeriesRefs {
    final manager =
        $ProceduresSurgeriesTableManager($_db, $_db.proceduresSurgeries).filter(
          (f) => f.relatedHospitalizationId.id.sqlEquals(
            $_itemColumn<String>('id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _proceduresSurgeriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $HospitalizationsFilterComposer
    extends Composer<_$AppDatabase, Hospitalizations> {
  $HospitalizationsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get admissionDate => $composableBuilder(
    column: $table.admissionDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dischargeDate => $composableBuilder(
    column: $table.dischargeDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get outcomeNotes => $composableBuilder(
    column: $table.outcomeNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnFilters(column),
  );

  $PetsFilterComposer get petId {
    final $PetsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsFilterComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleFilterComposer get handledByPersonId {
    final $PeopleFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> proceduresSurgeriesRefs(
    Expression<bool> Function($ProceduresSurgeriesFilterComposer f) f,
  ) {
    final $ProceduresSurgeriesFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.proceduresSurgeries,
      getReferencedColumn: (t) => t.relatedHospitalizationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $ProceduresSurgeriesFilterComposer(
            $db: $db,
            $table: $db.proceduresSurgeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $HospitalizationsOrderingComposer
    extends Composer<_$AppDatabase, Hospitalizations> {
  $HospitalizationsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get admissionDate => $composableBuilder(
    column: $table.admissionDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dischargeDate => $composableBuilder(
    column: $table.dischargeDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get outcomeNotes => $composableBuilder(
    column: $table.outcomeNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $PetsOrderingComposer get petId {
    final $PetsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsOrderingComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleOrderingComposer get handledByPersonId {
    final $PeopleOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleOrderingComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $HospitalizationsAnnotationComposer
    extends Composer<_$AppDatabase, Hospitalizations> {
  $HospitalizationsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get admissionDate => $composableBuilder(
    column: $table.admissionDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dischargeDate => $composableBuilder(
    column: $table.dischargeDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<String> get provider =>
      $composableBuilder(column: $table.provider, builder: (column) => column);

  GeneratedColumn<String> get outcomeNotes => $composableBuilder(
    column: $table.outcomeNotes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => column,
  );

  $PetsAnnotationComposer get petId {
    final $PetsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsAnnotationComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleAnnotationComposer get handledByPersonId {
    final $PeopleAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> proceduresSurgeriesRefs<T extends Object>(
    Expression<T> Function($ProceduresSurgeriesAnnotationComposer a) f,
  ) {
    final $ProceduresSurgeriesAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.proceduresSurgeries,
      getReferencedColumn: (t) => t.relatedHospitalizationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $ProceduresSurgeriesAnnotationComposer(
            $db: $db,
            $table: $db.proceduresSurgeries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $HospitalizationsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Hospitalizations,
          Hospitalization,
          $HospitalizationsFilterComposer,
          $HospitalizationsOrderingComposer,
          $HospitalizationsAnnotationComposer,
          $HospitalizationsCreateCompanionBuilder,
          $HospitalizationsUpdateCompanionBuilder,
          (Hospitalization, $HospitalizationsReferences),
          Hospitalization,
          PrefetchHooks Function({
            bool petId,
            bool handledByPersonId,
            bool proceduresSurgeriesRefs,
          })
        > {
  $HospitalizationsTableManager(_$AppDatabase db, Hospitalizations table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $HospitalizationsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $HospitalizationsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $HospitalizationsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<String> admissionDate = const Value.absent(),
                Value<String?> dischargeDate = const Value.absent(),
                Value<String> reason = const Value.absent(),
                Value<String?> provider = const Value.absent(),
                Value<String?> outcomeNotes = const Value.absent(),
                Value<String?> handledByPersonId = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> lastEditedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HospitalizationsCompanion(
                id: id,
                petId: petId,
                admissionDate: admissionDate,
                dischargeDate: dischargeDate,
                reason: reason,
                provider: provider,
                outcomeNotes: outcomeNotes,
                handledByPersonId: handledByPersonId,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String petId,
                required String admissionDate,
                Value<String?> dischargeDate = const Value.absent(),
                required String reason,
                Value<String?> provider = const Value.absent(),
                Value<String?> outcomeNotes = const Value.absent(),
                Value<String?> handledByPersonId = const Value.absent(),
                required String createdAt,
                required String lastEditedAt,
                Value<int> rowid = const Value.absent(),
              }) => HospitalizationsCompanion.insert(
                id: id,
                petId: petId,
                admissionDate: admissionDate,
                dischargeDate: dischargeDate,
                reason: reason,
                provider: provider,
                outcomeNotes: outcomeNotes,
                handledByPersonId: handledByPersonId,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $HospitalizationsReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                petId = false,
                handledByPersonId = false,
                proceduresSurgeriesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (proceduresSurgeriesRefs) db.proceduresSurgeries,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (petId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.petId,
                                    referencedTable: $HospitalizationsReferences
                                        ._petIdTable(db),
                                    referencedColumn:
                                        $HospitalizationsReferences
                                            ._petIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (handledByPersonId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.handledByPersonId,
                                    referencedTable: $HospitalizationsReferences
                                        ._handledByPersonIdTable(db),
                                    referencedColumn:
                                        $HospitalizationsReferences
                                            ._handledByPersonIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (proceduresSurgeriesRefs)
                        await $_getPrefetchedData<
                          Hospitalization,
                          Hospitalizations,
                          ProceduresSurgery
                        >(
                          currentTable: table,
                          referencedTable: $HospitalizationsReferences
                              ._proceduresSurgeriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $HospitalizationsReferences(
                                db,
                                table,
                                p0,
                              ).proceduresSurgeriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.relatedHospitalizationId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $HospitalizationsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Hospitalizations,
      Hospitalization,
      $HospitalizationsFilterComposer,
      $HospitalizationsOrderingComposer,
      $HospitalizationsAnnotationComposer,
      $HospitalizationsCreateCompanionBuilder,
      $HospitalizationsUpdateCompanionBuilder,
      (Hospitalization, $HospitalizationsReferences),
      Hospitalization,
      PrefetchHooks Function({
        bool petId,
        bool handledByPersonId,
        bool proceduresSurgeriesRefs,
      })
    >;
typedef $ProceduresSurgeriesCreateCompanionBuilder =
    ProceduresSurgeriesCompanion Function({
      required String id,
      required String petId,
      required String procedureName,
      required String date,
      Value<String?> provider,
      Value<String?> outcomeNotes,
      Value<String?> anesthesiaInfo,
      Value<String?> relatedHospitalizationId,
      Value<String?> handledByPersonId,
      required String createdAt,
      required String lastEditedAt,
      Value<int> rowid,
    });
typedef $ProceduresSurgeriesUpdateCompanionBuilder =
    ProceduresSurgeriesCompanion Function({
      Value<String> id,
      Value<String> petId,
      Value<String> procedureName,
      Value<String> date,
      Value<String?> provider,
      Value<String?> outcomeNotes,
      Value<String?> anesthesiaInfo,
      Value<String?> relatedHospitalizationId,
      Value<String?> handledByPersonId,
      Value<String> createdAt,
      Value<String> lastEditedAt,
      Value<int> rowid,
    });

final class $ProceduresSurgeriesReferences
    extends
        BaseReferences<_$AppDatabase, ProceduresSurgeries, ProceduresSurgery> {
  $ProceduresSurgeriesReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static Pets _petIdTable(_$AppDatabase db) =>
      db.pets.createAlias('procedures_surgeries__pet_id__pets__id');

  $PetsProcessedTableManager get petId {
    final $_column = $_itemColumn<String>('pet_id')!;

    final manager = $PetsTableManager(
      $_db,
      $_db.pets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static Hospitalizations _relatedHospitalizationIdTable(
    _$AppDatabase db,
  ) => db.hospitalizations.createAlias(
    'procedures_surgeries__related_hospitalization_id__hospitalizations__id',
  );

  $HospitalizationsProcessedTableManager? get relatedHospitalizationId {
    final $_column = $_itemColumn<String>('related_hospitalization_id');
    if ($_column == null) return null;
    final manager = $HospitalizationsTableManager(
      $_db,
      $_db.hospitalizations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _relatedHospitalizationIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static People _handledByPersonIdTable(_$AppDatabase db) => db.people
      .createAlias('procedures_surgeries__handled_by_person_id__people__id');

  $PeopleProcessedTableManager? get handledByPersonId {
    final $_column = $_itemColumn<String>('handled_by_person_id');
    if ($_column == null) return null;
    final manager = $PeopleTableManager(
      $_db,
      $_db.people,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_handledByPersonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $ProceduresSurgeriesFilterComposer
    extends Composer<_$AppDatabase, ProceduresSurgeries> {
  $ProceduresSurgeriesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get procedureName => $composableBuilder(
    column: $table.procedureName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get outcomeNotes => $composableBuilder(
    column: $table.outcomeNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get anesthesiaInfo => $composableBuilder(
    column: $table.anesthesiaInfo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnFilters(column),
  );

  $PetsFilterComposer get petId {
    final $PetsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsFilterComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $HospitalizationsFilterComposer get relatedHospitalizationId {
    final $HospitalizationsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relatedHospitalizationId,
      referencedTable: $db.hospitalizations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $HospitalizationsFilterComposer(
            $db: $db,
            $table: $db.hospitalizations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleFilterComposer get handledByPersonId {
    final $PeopleFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $ProceduresSurgeriesOrderingComposer
    extends Composer<_$AppDatabase, ProceduresSurgeries> {
  $ProceduresSurgeriesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get procedureName => $composableBuilder(
    column: $table.procedureName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get outcomeNotes => $composableBuilder(
    column: $table.outcomeNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get anesthesiaInfo => $composableBuilder(
    column: $table.anesthesiaInfo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $PetsOrderingComposer get petId {
    final $PetsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsOrderingComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $HospitalizationsOrderingComposer get relatedHospitalizationId {
    final $HospitalizationsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relatedHospitalizationId,
      referencedTable: $db.hospitalizations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $HospitalizationsOrderingComposer(
            $db: $db,
            $table: $db.hospitalizations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleOrderingComposer get handledByPersonId {
    final $PeopleOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleOrderingComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $ProceduresSurgeriesAnnotationComposer
    extends Composer<_$AppDatabase, ProceduresSurgeries> {
  $ProceduresSurgeriesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get procedureName => $composableBuilder(
    column: $table.procedureName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get provider =>
      $composableBuilder(column: $table.provider, builder: (column) => column);

  GeneratedColumn<String> get outcomeNotes => $composableBuilder(
    column: $table.outcomeNotes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get anesthesiaInfo => $composableBuilder(
    column: $table.anesthesiaInfo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => column,
  );

  $PetsAnnotationComposer get petId {
    final $PetsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsAnnotationComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $HospitalizationsAnnotationComposer get relatedHospitalizationId {
    final $HospitalizationsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relatedHospitalizationId,
      referencedTable: $db.hospitalizations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $HospitalizationsAnnotationComposer(
            $db: $db,
            $table: $db.hospitalizations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleAnnotationComposer get handledByPersonId {
    final $PeopleAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $ProceduresSurgeriesTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          ProceduresSurgeries,
          ProceduresSurgery,
          $ProceduresSurgeriesFilterComposer,
          $ProceduresSurgeriesOrderingComposer,
          $ProceduresSurgeriesAnnotationComposer,
          $ProceduresSurgeriesCreateCompanionBuilder,
          $ProceduresSurgeriesUpdateCompanionBuilder,
          (ProceduresSurgery, $ProceduresSurgeriesReferences),
          ProceduresSurgery,
          PrefetchHooks Function({
            bool petId,
            bool relatedHospitalizationId,
            bool handledByPersonId,
          })
        > {
  $ProceduresSurgeriesTableManager(_$AppDatabase db, ProceduresSurgeries table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $ProceduresSurgeriesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $ProceduresSurgeriesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $ProceduresSurgeriesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<String> procedureName = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String?> provider = const Value.absent(),
                Value<String?> outcomeNotes = const Value.absent(),
                Value<String?> anesthesiaInfo = const Value.absent(),
                Value<String?> relatedHospitalizationId = const Value.absent(),
                Value<String?> handledByPersonId = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> lastEditedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProceduresSurgeriesCompanion(
                id: id,
                petId: petId,
                procedureName: procedureName,
                date: date,
                provider: provider,
                outcomeNotes: outcomeNotes,
                anesthesiaInfo: anesthesiaInfo,
                relatedHospitalizationId: relatedHospitalizationId,
                handledByPersonId: handledByPersonId,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String petId,
                required String procedureName,
                required String date,
                Value<String?> provider = const Value.absent(),
                Value<String?> outcomeNotes = const Value.absent(),
                Value<String?> anesthesiaInfo = const Value.absent(),
                Value<String?> relatedHospitalizationId = const Value.absent(),
                Value<String?> handledByPersonId = const Value.absent(),
                required String createdAt,
                required String lastEditedAt,
                Value<int> rowid = const Value.absent(),
              }) => ProceduresSurgeriesCompanion.insert(
                id: id,
                petId: petId,
                procedureName: procedureName,
                date: date,
                provider: provider,
                outcomeNotes: outcomeNotes,
                anesthesiaInfo: anesthesiaInfo,
                relatedHospitalizationId: relatedHospitalizationId,
                handledByPersonId: handledByPersonId,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $ProceduresSurgeriesReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                petId = false,
                relatedHospitalizationId = false,
                handledByPersonId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (petId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.petId,
                                    referencedTable:
                                        $ProceduresSurgeriesReferences
                                            ._petIdTable(db),
                                    referencedColumn:
                                        $ProceduresSurgeriesReferences
                                            ._petIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (relatedHospitalizationId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn:
                                        table.relatedHospitalizationId,
                                    referencedTable:
                                        $ProceduresSurgeriesReferences
                                            ._relatedHospitalizationIdTable(db),
                                    referencedColumn:
                                        $ProceduresSurgeriesReferences
                                            ._relatedHospitalizationIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (handledByPersonId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.handledByPersonId,
                                    referencedTable:
                                        $ProceduresSurgeriesReferences
                                            ._handledByPersonIdTable(db),
                                    referencedColumn:
                                        $ProceduresSurgeriesReferences
                                            ._handledByPersonIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $ProceduresSurgeriesProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      ProceduresSurgeries,
      ProceduresSurgery,
      $ProceduresSurgeriesFilterComposer,
      $ProceduresSurgeriesOrderingComposer,
      $ProceduresSurgeriesAnnotationComposer,
      $ProceduresSurgeriesCreateCompanionBuilder,
      $ProceduresSurgeriesUpdateCompanionBuilder,
      (ProceduresSurgery, $ProceduresSurgeriesReferences),
      ProceduresSurgery,
      PrefetchHooks Function({
        bool petId,
        bool relatedHospitalizationId,
        bool handledByPersonId,
      })
    >;
typedef $IllnessCustomEventsCreateCompanionBuilder =
    IllnessCustomEventsCompanion Function({
      required String id,
      required String petId,
      required String title,
      required String date,
      Value<String?> description,
      Value<String?> provider,
      Value<String?> status,
      Value<String?> relatedAppointmentId,
      Value<String?> handledByPersonId,
      required String createdAt,
      required String lastEditedAt,
      Value<int> rowid,
    });
typedef $IllnessCustomEventsUpdateCompanionBuilder =
    IllnessCustomEventsCompanion Function({
      Value<String> id,
      Value<String> petId,
      Value<String> title,
      Value<String> date,
      Value<String?> description,
      Value<String?> provider,
      Value<String?> status,
      Value<String?> relatedAppointmentId,
      Value<String?> handledByPersonId,
      Value<String> createdAt,
      Value<String> lastEditedAt,
      Value<int> rowid,
    });

final class $IllnessCustomEventsReferences
    extends
        BaseReferences<_$AppDatabase, IllnessCustomEvents, IllnessCustomEvent> {
  $IllnessCustomEventsReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static Pets _petIdTable(_$AppDatabase db) =>
      db.pets.createAlias('illness_custom_events__pet_id__pets__id');

  $PetsProcessedTableManager get petId {
    final $_column = $_itemColumn<String>('pet_id')!;

    final manager = $PetsTableManager(
      $_db,
      $_db.pets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static VetAppointments _relatedAppointmentIdTable(_$AppDatabase db) =>
      db.vetAppointments.createAlias(
        'illness_custom_events__related_appointment_id__vet_appointments__id',
      );

  $VetAppointmentsProcessedTableManager? get relatedAppointmentId {
    final $_column = $_itemColumn<String>('related_appointment_id');
    if ($_column == null) return null;
    final manager = $VetAppointmentsTableManager(
      $_db,
      $_db.vetAppointments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _relatedAppointmentIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static People _handledByPersonIdTable(_$AppDatabase db) => db.people
      .createAlias('illness_custom_events__handled_by_person_id__people__id');

  $PeopleProcessedTableManager? get handledByPersonId {
    final $_column = $_itemColumn<String>('handled_by_person_id');
    if ($_column == null) return null;
    final manager = $PeopleTableManager(
      $_db,
      $_db.people,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_handledByPersonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $IllnessCustomEventsFilterComposer
    extends Composer<_$AppDatabase, IllnessCustomEvents> {
  $IllnessCustomEventsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnFilters(column),
  );

  $PetsFilterComposer get petId {
    final $PetsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsFilterComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $VetAppointmentsFilterComposer get relatedAppointmentId {
    final $VetAppointmentsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relatedAppointmentId,
      referencedTable: $db.vetAppointments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $VetAppointmentsFilterComposer(
            $db: $db,
            $table: $db.vetAppointments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleFilterComposer get handledByPersonId {
    final $PeopleFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $IllnessCustomEventsOrderingComposer
    extends Composer<_$AppDatabase, IllnessCustomEvents> {
  $IllnessCustomEventsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $PetsOrderingComposer get petId {
    final $PetsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsOrderingComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $VetAppointmentsOrderingComposer get relatedAppointmentId {
    final $VetAppointmentsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relatedAppointmentId,
      referencedTable: $db.vetAppointments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $VetAppointmentsOrderingComposer(
            $db: $db,
            $table: $db.vetAppointments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleOrderingComposer get handledByPersonId {
    final $PeopleOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleOrderingComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $IllnessCustomEventsAnnotationComposer
    extends Composer<_$AppDatabase, IllnessCustomEvents> {
  $IllnessCustomEventsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get provider =>
      $composableBuilder(column: $table.provider, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => column,
  );

  $PetsAnnotationComposer get petId {
    final $PetsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsAnnotationComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $VetAppointmentsAnnotationComposer get relatedAppointmentId {
    final $VetAppointmentsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relatedAppointmentId,
      referencedTable: $db.vetAppointments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $VetAppointmentsAnnotationComposer(
            $db: $db,
            $table: $db.vetAppointments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleAnnotationComposer get handledByPersonId {
    final $PeopleAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $IllnessCustomEventsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          IllnessCustomEvents,
          IllnessCustomEvent,
          $IllnessCustomEventsFilterComposer,
          $IllnessCustomEventsOrderingComposer,
          $IllnessCustomEventsAnnotationComposer,
          $IllnessCustomEventsCreateCompanionBuilder,
          $IllnessCustomEventsUpdateCompanionBuilder,
          (IllnessCustomEvent, $IllnessCustomEventsReferences),
          IllnessCustomEvent,
          PrefetchHooks Function({
            bool petId,
            bool relatedAppointmentId,
            bool handledByPersonId,
          })
        > {
  $IllnessCustomEventsTableManager(_$AppDatabase db, IllnessCustomEvents table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $IllnessCustomEventsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $IllnessCustomEventsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $IllnessCustomEventsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> provider = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> relatedAppointmentId = const Value.absent(),
                Value<String?> handledByPersonId = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> lastEditedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IllnessCustomEventsCompanion(
                id: id,
                petId: petId,
                title: title,
                date: date,
                description: description,
                provider: provider,
                status: status,
                relatedAppointmentId: relatedAppointmentId,
                handledByPersonId: handledByPersonId,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String petId,
                required String title,
                required String date,
                Value<String?> description = const Value.absent(),
                Value<String?> provider = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> relatedAppointmentId = const Value.absent(),
                Value<String?> handledByPersonId = const Value.absent(),
                required String createdAt,
                required String lastEditedAt,
                Value<int> rowid = const Value.absent(),
              }) => IllnessCustomEventsCompanion.insert(
                id: id,
                petId: petId,
                title: title,
                date: date,
                description: description,
                provider: provider,
                status: status,
                relatedAppointmentId: relatedAppointmentId,
                handledByPersonId: handledByPersonId,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $IllnessCustomEventsReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                petId = false,
                relatedAppointmentId = false,
                handledByPersonId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (petId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.petId,
                                    referencedTable:
                                        $IllnessCustomEventsReferences
                                            ._petIdTable(db),
                                    referencedColumn:
                                        $IllnessCustomEventsReferences
                                            ._petIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (relatedAppointmentId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.relatedAppointmentId,
                                    referencedTable:
                                        $IllnessCustomEventsReferences
                                            ._relatedAppointmentIdTable(db),
                                    referencedColumn:
                                        $IllnessCustomEventsReferences
                                            ._relatedAppointmentIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (handledByPersonId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.handledByPersonId,
                                    referencedTable:
                                        $IllnessCustomEventsReferences
                                            ._handledByPersonIdTable(db),
                                    referencedColumn:
                                        $IllnessCustomEventsReferences
                                            ._handledByPersonIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $IllnessCustomEventsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      IllnessCustomEvents,
      IllnessCustomEvent,
      $IllnessCustomEventsFilterComposer,
      $IllnessCustomEventsOrderingComposer,
      $IllnessCustomEventsAnnotationComposer,
      $IllnessCustomEventsCreateCompanionBuilder,
      $IllnessCustomEventsUpdateCompanionBuilder,
      (IllnessCustomEvent, $IllnessCustomEventsReferences),
      IllnessCustomEvent,
      PrefetchHooks Function({
        bool petId,
        bool relatedAppointmentId,
        bool handledByPersonId,
      })
    >;
typedef $VaccinationsCreateCompanionBuilder =
    VaccinationsCompanion Function({
      required String id,
      required String petId,
      required String vaccineName,
      required String dateAdministered,
      Value<String?> provider,
      Value<String?> lotNumber,
      Value<String?> nextDueDate,
      Value<String?> notes,
      Value<String?> handledByPersonId,
      required String createdAt,
      required String lastEditedAt,
      Value<int> rowid,
    });
typedef $VaccinationsUpdateCompanionBuilder =
    VaccinationsCompanion Function({
      Value<String> id,
      Value<String> petId,
      Value<String> vaccineName,
      Value<String> dateAdministered,
      Value<String?> provider,
      Value<String?> lotNumber,
      Value<String?> nextDueDate,
      Value<String?> notes,
      Value<String?> handledByPersonId,
      Value<String> createdAt,
      Value<String> lastEditedAt,
      Value<int> rowid,
    });

final class $VaccinationsReferences
    extends BaseReferences<_$AppDatabase, Vaccinations, Vaccination> {
  $VaccinationsReferences(super.$_db, super.$_table, super.$_typedResult);

  static Pets _petIdTable(_$AppDatabase db) =>
      db.pets.createAlias('vaccinations__pet_id__pets__id');

  $PetsProcessedTableManager get petId {
    final $_column = $_itemColumn<String>('pet_id')!;

    final manager = $PetsTableManager(
      $_db,
      $_db.pets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static People _handledByPersonIdTable(_$AppDatabase db) =>
      db.people.createAlias('vaccinations__handled_by_person_id__people__id');

  $PeopleProcessedTableManager? get handledByPersonId {
    final $_column = $_itemColumn<String>('handled_by_person_id');
    if ($_column == null) return null;
    final manager = $PeopleTableManager(
      $_db,
      $_db.people,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_handledByPersonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $VaccinationsFilterComposer
    extends Composer<_$AppDatabase, Vaccinations> {
  $VaccinationsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vaccineName => $composableBuilder(
    column: $table.vaccineName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dateAdministered => $composableBuilder(
    column: $table.dateAdministered,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lotNumber => $composableBuilder(
    column: $table.lotNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nextDueDate => $composableBuilder(
    column: $table.nextDueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnFilters(column),
  );

  $PetsFilterComposer get petId {
    final $PetsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsFilterComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleFilterComposer get handledByPersonId {
    final $PeopleFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $VaccinationsOrderingComposer
    extends Composer<_$AppDatabase, Vaccinations> {
  $VaccinationsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vaccineName => $composableBuilder(
    column: $table.vaccineName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dateAdministered => $composableBuilder(
    column: $table.dateAdministered,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get provider => $composableBuilder(
    column: $table.provider,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lotNumber => $composableBuilder(
    column: $table.lotNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nextDueDate => $composableBuilder(
    column: $table.nextDueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $PetsOrderingComposer get petId {
    final $PetsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsOrderingComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleOrderingComposer get handledByPersonId {
    final $PeopleOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleOrderingComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $VaccinationsAnnotationComposer
    extends Composer<_$AppDatabase, Vaccinations> {
  $VaccinationsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get vaccineName => $composableBuilder(
    column: $table.vaccineName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dateAdministered => $composableBuilder(
    column: $table.dateAdministered,
    builder: (column) => column,
  );

  GeneratedColumn<String> get provider =>
      $composableBuilder(column: $table.provider, builder: (column) => column);

  GeneratedColumn<String> get lotNumber =>
      $composableBuilder(column: $table.lotNumber, builder: (column) => column);

  GeneratedColumn<String> get nextDueDate => $composableBuilder(
    column: $table.nextDueDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => column,
  );

  $PetsAnnotationComposer get petId {
    final $PetsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsAnnotationComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleAnnotationComposer get handledByPersonId {
    final $PeopleAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $VaccinationsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Vaccinations,
          Vaccination,
          $VaccinationsFilterComposer,
          $VaccinationsOrderingComposer,
          $VaccinationsAnnotationComposer,
          $VaccinationsCreateCompanionBuilder,
          $VaccinationsUpdateCompanionBuilder,
          (Vaccination, $VaccinationsReferences),
          Vaccination,
          PrefetchHooks Function({bool petId, bool handledByPersonId})
        > {
  $VaccinationsTableManager(_$AppDatabase db, Vaccinations table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $VaccinationsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $VaccinationsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $VaccinationsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<String> vaccineName = const Value.absent(),
                Value<String> dateAdministered = const Value.absent(),
                Value<String?> provider = const Value.absent(),
                Value<String?> lotNumber = const Value.absent(),
                Value<String?> nextDueDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> handledByPersonId = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> lastEditedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VaccinationsCompanion(
                id: id,
                petId: petId,
                vaccineName: vaccineName,
                dateAdministered: dateAdministered,
                provider: provider,
                lotNumber: lotNumber,
                nextDueDate: nextDueDate,
                notes: notes,
                handledByPersonId: handledByPersonId,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String petId,
                required String vaccineName,
                required String dateAdministered,
                Value<String?> provider = const Value.absent(),
                Value<String?> lotNumber = const Value.absent(),
                Value<String?> nextDueDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> handledByPersonId = const Value.absent(),
                required String createdAt,
                required String lastEditedAt,
                Value<int> rowid = const Value.absent(),
              }) => VaccinationsCompanion.insert(
                id: id,
                petId: petId,
                vaccineName: vaccineName,
                dateAdministered: dateAdministered,
                provider: provider,
                lotNumber: lotNumber,
                nextDueDate: nextDueDate,
                notes: notes,
                handledByPersonId: handledByPersonId,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $VaccinationsReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({petId = false, handledByPersonId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (petId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.petId,
                                referencedTable: $VaccinationsReferences
                                    ._petIdTable(db),
                                referencedColumn: $VaccinationsReferences
                                    ._petIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (handledByPersonId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.handledByPersonId,
                                referencedTable: $VaccinationsReferences
                                    ._handledByPersonIdTable(db),
                                referencedColumn: $VaccinationsReferences
                                    ._handledByPersonIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $VaccinationsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Vaccinations,
      Vaccination,
      $VaccinationsFilterComposer,
      $VaccinationsOrderingComposer,
      $VaccinationsAnnotationComposer,
      $VaccinationsCreateCompanionBuilder,
      $VaccinationsUpdateCompanionBuilder,
      (Vaccination, $VaccinationsReferences),
      Vaccination,
      PrefetchHooks Function({bool petId, bool handledByPersonId})
    >;
typedef $MicrochipRecordsCreateCompanionBuilder =
    MicrochipRecordsCompanion Function({
      required String id,
      required String petId,
      required String chipNumber,
      Value<String?> registryProvider,
      Value<String?> dateImplanted,
      Value<String?> notes,
      required String createdAt,
      required String lastEditedAt,
      Value<int> rowid,
    });
typedef $MicrochipRecordsUpdateCompanionBuilder =
    MicrochipRecordsCompanion Function({
      Value<String> id,
      Value<String> petId,
      Value<String> chipNumber,
      Value<String?> registryProvider,
      Value<String?> dateImplanted,
      Value<String?> notes,
      Value<String> createdAt,
      Value<String> lastEditedAt,
      Value<int> rowid,
    });

final class $MicrochipRecordsReferences
    extends BaseReferences<_$AppDatabase, MicrochipRecords, MicrochipRecord> {
  $MicrochipRecordsReferences(super.$_db, super.$_table, super.$_typedResult);

  static Pets _petIdTable(_$AppDatabase db) =>
      db.pets.createAlias('microchip_records__pet_id__pets__id');

  $PetsProcessedTableManager get petId {
    final $_column = $_itemColumn<String>('pet_id')!;

    final manager = $PetsTableManager(
      $_db,
      $_db.pets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $MicrochipRecordsFilterComposer
    extends Composer<_$AppDatabase, MicrochipRecords> {
  $MicrochipRecordsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get chipNumber => $composableBuilder(
    column: $table.chipNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get registryProvider => $composableBuilder(
    column: $table.registryProvider,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dateImplanted => $composableBuilder(
    column: $table.dateImplanted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnFilters(column),
  );

  $PetsFilterComposer get petId {
    final $PetsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsFilterComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $MicrochipRecordsOrderingComposer
    extends Composer<_$AppDatabase, MicrochipRecords> {
  $MicrochipRecordsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chipNumber => $composableBuilder(
    column: $table.chipNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get registryProvider => $composableBuilder(
    column: $table.registryProvider,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dateImplanted => $composableBuilder(
    column: $table.dateImplanted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $PetsOrderingComposer get petId {
    final $PetsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsOrderingComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $MicrochipRecordsAnnotationComposer
    extends Composer<_$AppDatabase, MicrochipRecords> {
  $MicrochipRecordsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get chipNumber => $composableBuilder(
    column: $table.chipNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get registryProvider => $composableBuilder(
    column: $table.registryProvider,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dateImplanted => $composableBuilder(
    column: $table.dateImplanted,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => column,
  );

  $PetsAnnotationComposer get petId {
    final $PetsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsAnnotationComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $MicrochipRecordsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          MicrochipRecords,
          MicrochipRecord,
          $MicrochipRecordsFilterComposer,
          $MicrochipRecordsOrderingComposer,
          $MicrochipRecordsAnnotationComposer,
          $MicrochipRecordsCreateCompanionBuilder,
          $MicrochipRecordsUpdateCompanionBuilder,
          (MicrochipRecord, $MicrochipRecordsReferences),
          MicrochipRecord,
          PrefetchHooks Function({bool petId})
        > {
  $MicrochipRecordsTableManager(_$AppDatabase db, MicrochipRecords table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $MicrochipRecordsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $MicrochipRecordsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $MicrochipRecordsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<String> chipNumber = const Value.absent(),
                Value<String?> registryProvider = const Value.absent(),
                Value<String?> dateImplanted = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> lastEditedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MicrochipRecordsCompanion(
                id: id,
                petId: petId,
                chipNumber: chipNumber,
                registryProvider: registryProvider,
                dateImplanted: dateImplanted,
                notes: notes,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String petId,
                required String chipNumber,
                Value<String?> registryProvider = const Value.absent(),
                Value<String?> dateImplanted = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required String createdAt,
                required String lastEditedAt,
                Value<int> rowid = const Value.absent(),
              }) => MicrochipRecordsCompanion.insert(
                id: id,
                petId: petId,
                chipNumber: chipNumber,
                registryProvider: registryProvider,
                dateImplanted: dateImplanted,
                notes: notes,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $MicrochipRecordsReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({petId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (petId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.petId,
                                referencedTable: $MicrochipRecordsReferences
                                    ._petIdTable(db),
                                referencedColumn: $MicrochipRecordsReferences
                                    ._petIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $MicrochipRecordsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      MicrochipRecords,
      MicrochipRecord,
      $MicrochipRecordsFilterComposer,
      $MicrochipRecordsOrderingComposer,
      $MicrochipRecordsAnnotationComposer,
      $MicrochipRecordsCreateCompanionBuilder,
      $MicrochipRecordsUpdateCompanionBuilder,
      (MicrochipRecord, $MicrochipRecordsReferences),
      MicrochipRecord,
      PrefetchHooks Function({bool petId})
    >;
typedef $MedicationsCreateCompanionBuilder =
    MedicationsCompanion Function({
      required String id,
      required String petId,
      required String name,
      Value<String?> strength,
      required String medicationType,
      required String startDate,
      Value<String> status,
      Value<String?> notes,
      Value<String?> handledByPersonId,
      required String createdAt,
      required String lastEditedAt,
      Value<int> rowid,
    });
typedef $MedicationsUpdateCompanionBuilder =
    MedicationsCompanion Function({
      Value<String> id,
      Value<String> petId,
      Value<String> name,
      Value<String?> strength,
      Value<String> medicationType,
      Value<String> startDate,
      Value<String> status,
      Value<String?> notes,
      Value<String?> handledByPersonId,
      Value<String> createdAt,
      Value<String> lastEditedAt,
      Value<int> rowid,
    });

final class $MedicationsReferences
    extends BaseReferences<_$AppDatabase, Medications, Medication> {
  $MedicationsReferences(super.$_db, super.$_table, super.$_typedResult);

  static Pets _petIdTable(_$AppDatabase db) =>
      db.pets.createAlias('medications__pet_id__pets__id');

  $PetsProcessedTableManager get petId {
    final $_column = $_itemColumn<String>('pet_id')!;

    final manager = $PetsTableManager(
      $_db,
      $_db.pets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static People _handledByPersonIdTable(_$AppDatabase db) =>
      db.people.createAlias('medications__handled_by_person_id__people__id');

  $PeopleProcessedTableManager? get handledByPersonId {
    final $_column = $_itemColumn<String>('handled_by_person_id');
    if ($_column == null) return null;
    final manager = $PeopleTableManager(
      $_db,
      $_db.people,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_handledByPersonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<MedicationPhases, List<MedicationPhase>>
  _medicationPhasesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.medicationPhases,
    aliasName: 'medications__id__medication_phases__medication_id',
  );

  $MedicationPhasesProcessedTableManager get medicationPhasesRefs {
    final manager = $MedicationPhasesTableManager(
      $_db,
      $_db.medicationPhases,
    ).filter((f) => f.medicationId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _medicationPhasesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<MedicationDoses, List<MedicationDose>>
  _medicationDosesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.medicationDoses,
    aliasName: 'medications__id__medication_doses__medication_id',
  );

  $MedicationDosesProcessedTableManager get medicationDosesRefs {
    final manager = $MedicationDosesTableManager(
      $_db,
      $_db.medicationDoses,
    ).filter((f) => f.medicationId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _medicationDosesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $MedicationsFilterComposer extends Composer<_$AppDatabase, Medications> {
  $MedicationsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strength => $composableBuilder(
    column: $table.strength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get medicationType => $composableBuilder(
    column: $table.medicationType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnFilters(column),
  );

  $PetsFilterComposer get petId {
    final $PetsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsFilterComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleFilterComposer get handledByPersonId {
    final $PeopleFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> medicationPhasesRefs(
    Expression<bool> Function($MedicationPhasesFilterComposer f) f,
  ) {
    final $MedicationPhasesFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medicationPhases,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MedicationPhasesFilterComposer(
            $db: $db,
            $table: $db.medicationPhases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> medicationDosesRefs(
    Expression<bool> Function($MedicationDosesFilterComposer f) f,
  ) {
    final $MedicationDosesFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medicationDoses,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MedicationDosesFilterComposer(
            $db: $db,
            $table: $db.medicationDoses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $MedicationsOrderingComposer
    extends Composer<_$AppDatabase, Medications> {
  $MedicationsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strength => $composableBuilder(
    column: $table.strength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get medicationType => $composableBuilder(
    column: $table.medicationType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $PetsOrderingComposer get petId {
    final $PetsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsOrderingComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleOrderingComposer get handledByPersonId {
    final $PeopleOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleOrderingComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $MedicationsAnnotationComposer
    extends Composer<_$AppDatabase, Medications> {
  $MedicationsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get strength =>
      $composableBuilder(column: $table.strength, builder: (column) => column);

  GeneratedColumn<String> get medicationType => $composableBuilder(
    column: $table.medicationType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => column,
  );

  $PetsAnnotationComposer get petId {
    final $PetsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsAnnotationComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleAnnotationComposer get handledByPersonId {
    final $PeopleAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> medicationPhasesRefs<T extends Object>(
    Expression<T> Function($MedicationPhasesAnnotationComposer a) f,
  ) {
    final $MedicationPhasesAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medicationPhases,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MedicationPhasesAnnotationComposer(
            $db: $db,
            $table: $db.medicationPhases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> medicationDosesRefs<T extends Object>(
    Expression<T> Function($MedicationDosesAnnotationComposer a) f,
  ) {
    final $MedicationDosesAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medicationDoses,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MedicationDosesAnnotationComposer(
            $db: $db,
            $table: $db.medicationDoses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $MedicationsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Medications,
          Medication,
          $MedicationsFilterComposer,
          $MedicationsOrderingComposer,
          $MedicationsAnnotationComposer,
          $MedicationsCreateCompanionBuilder,
          $MedicationsUpdateCompanionBuilder,
          (Medication, $MedicationsReferences),
          Medication,
          PrefetchHooks Function({
            bool petId,
            bool handledByPersonId,
            bool medicationPhasesRefs,
            bool medicationDosesRefs,
          })
        > {
  $MedicationsTableManager(_$AppDatabase db, Medications table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $MedicationsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $MedicationsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $MedicationsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> strength = const Value.absent(),
                Value<String> medicationType = const Value.absent(),
                Value<String> startDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> handledByPersonId = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> lastEditedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicationsCompanion(
                id: id,
                petId: petId,
                name: name,
                strength: strength,
                medicationType: medicationType,
                startDate: startDate,
                status: status,
                notes: notes,
                handledByPersonId: handledByPersonId,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String petId,
                required String name,
                Value<String?> strength = const Value.absent(),
                required String medicationType,
                required String startDate,
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> handledByPersonId = const Value.absent(),
                required String createdAt,
                required String lastEditedAt,
                Value<int> rowid = const Value.absent(),
              }) => MedicationsCompanion.insert(
                id: id,
                petId: petId,
                name: name,
                strength: strength,
                medicationType: medicationType,
                startDate: startDate,
                status: status,
                notes: notes,
                handledByPersonId: handledByPersonId,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $MedicationsReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                petId = false,
                handledByPersonId = false,
                medicationPhasesRefs = false,
                medicationDosesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (medicationPhasesRefs) db.medicationPhases,
                    if (medicationDosesRefs) db.medicationDoses,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (petId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.petId,
                                    referencedTable: $MedicationsReferences
                                        ._petIdTable(db),
                                    referencedColumn: $MedicationsReferences
                                        ._petIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (handledByPersonId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.handledByPersonId,
                                    referencedTable: $MedicationsReferences
                                        ._handledByPersonIdTable(db),
                                    referencedColumn: $MedicationsReferences
                                        ._handledByPersonIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (medicationPhasesRefs)
                        await $_getPrefetchedData<
                          Medication,
                          Medications,
                          MedicationPhase
                        >(
                          currentTable: table,
                          referencedTable: $MedicationsReferences
                              ._medicationPhasesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $MedicationsReferences(
                                db,
                                table,
                                p0,
                              ).medicationPhasesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.medicationId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (medicationDosesRefs)
                        await $_getPrefetchedData<
                          Medication,
                          Medications,
                          MedicationDose
                        >(
                          currentTable: table,
                          referencedTable: $MedicationsReferences
                              ._medicationDosesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $MedicationsReferences(
                                db,
                                table,
                                p0,
                              ).medicationDosesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.medicationId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $MedicationsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Medications,
      Medication,
      $MedicationsFilterComposer,
      $MedicationsOrderingComposer,
      $MedicationsAnnotationComposer,
      $MedicationsCreateCompanionBuilder,
      $MedicationsUpdateCompanionBuilder,
      (Medication, $MedicationsReferences),
      Medication,
      PrefetchHooks Function({
        bool petId,
        bool handledByPersonId,
        bool medicationPhasesRefs,
        bool medicationDosesRefs,
      })
    >;
typedef $MedicationPhasesCreateCompanionBuilder =
    MedicationPhasesCompanion Function({
      required String id,
      required String medicationId,
      required int phaseOrder,
      required String doseAmount,
      required int timesPerDay,
      Value<String?> doseTimes,
      required String durationType,
      Value<int?> durationDays,
      Value<int?> durationDoseCount,
      Value<int> rowid,
    });
typedef $MedicationPhasesUpdateCompanionBuilder =
    MedicationPhasesCompanion Function({
      Value<String> id,
      Value<String> medicationId,
      Value<int> phaseOrder,
      Value<String> doseAmount,
      Value<int> timesPerDay,
      Value<String?> doseTimes,
      Value<String> durationType,
      Value<int?> durationDays,
      Value<int?> durationDoseCount,
      Value<int> rowid,
    });

final class $MedicationPhasesReferences
    extends BaseReferences<_$AppDatabase, MedicationPhases, MedicationPhase> {
  $MedicationPhasesReferences(super.$_db, super.$_table, super.$_typedResult);

  static Medications _medicationIdTable(_$AppDatabase db) => db.medications
      .createAlias('medication_phases__medication_id__medications__id');

  $MedicationsProcessedTableManager get medicationId {
    final $_column = $_itemColumn<String>('medication_id')!;

    final manager = $MedicationsTableManager(
      $_db,
      $_db.medications,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<MedicationDoses, List<MedicationDose>>
  _medicationDosesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.medicationDoses,
    aliasName: 'medication_phases__id__medication_doses__phase_id',
  );

  $MedicationDosesProcessedTableManager get medicationDosesRefs {
    final manager = $MedicationDosesTableManager(
      $_db,
      $_db.medicationDoses,
    ).filter((f) => f.phaseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _medicationDosesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $MedicationPhasesFilterComposer
    extends Composer<_$AppDatabase, MedicationPhases> {
  $MedicationPhasesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get phaseOrder => $composableBuilder(
    column: $table.phaseOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get doseAmount => $composableBuilder(
    column: $table.doseAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timesPerDay => $composableBuilder(
    column: $table.timesPerDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get doseTimes => $composableBuilder(
    column: $table.doseTimes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get durationType => $composableBuilder(
    column: $table.durationType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationDays => $composableBuilder(
    column: $table.durationDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationDoseCount => $composableBuilder(
    column: $table.durationDoseCount,
    builder: (column) => ColumnFilters(column),
  );

  $MedicationsFilterComposer get medicationId {
    final $MedicationsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MedicationsFilterComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> medicationDosesRefs(
    Expression<bool> Function($MedicationDosesFilterComposer f) f,
  ) {
    final $MedicationDosesFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medicationDoses,
      getReferencedColumn: (t) => t.phaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MedicationDosesFilterComposer(
            $db: $db,
            $table: $db.medicationDoses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $MedicationPhasesOrderingComposer
    extends Composer<_$AppDatabase, MedicationPhases> {
  $MedicationPhasesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get phaseOrder => $composableBuilder(
    column: $table.phaseOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get doseAmount => $composableBuilder(
    column: $table.doseAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timesPerDay => $composableBuilder(
    column: $table.timesPerDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get doseTimes => $composableBuilder(
    column: $table.doseTimes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get durationType => $composableBuilder(
    column: $table.durationType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationDays => $composableBuilder(
    column: $table.durationDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationDoseCount => $composableBuilder(
    column: $table.durationDoseCount,
    builder: (column) => ColumnOrderings(column),
  );

  $MedicationsOrderingComposer get medicationId {
    final $MedicationsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MedicationsOrderingComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $MedicationPhasesAnnotationComposer
    extends Composer<_$AppDatabase, MedicationPhases> {
  $MedicationPhasesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get phaseOrder => $composableBuilder(
    column: $table.phaseOrder,
    builder: (column) => column,
  );

  GeneratedColumn<String> get doseAmount => $composableBuilder(
    column: $table.doseAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get timesPerDay => $composableBuilder(
    column: $table.timesPerDay,
    builder: (column) => column,
  );

  GeneratedColumn<String> get doseTimes =>
      $composableBuilder(column: $table.doseTimes, builder: (column) => column);

  GeneratedColumn<String> get durationType => $composableBuilder(
    column: $table.durationType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationDays => $composableBuilder(
    column: $table.durationDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationDoseCount => $composableBuilder(
    column: $table.durationDoseCount,
    builder: (column) => column,
  );

  $MedicationsAnnotationComposer get medicationId {
    final $MedicationsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MedicationsAnnotationComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> medicationDosesRefs<T extends Object>(
    Expression<T> Function($MedicationDosesAnnotationComposer a) f,
  ) {
    final $MedicationDosesAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medicationDoses,
      getReferencedColumn: (t) => t.phaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MedicationDosesAnnotationComposer(
            $db: $db,
            $table: $db.medicationDoses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $MedicationPhasesTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          MedicationPhases,
          MedicationPhase,
          $MedicationPhasesFilterComposer,
          $MedicationPhasesOrderingComposer,
          $MedicationPhasesAnnotationComposer,
          $MedicationPhasesCreateCompanionBuilder,
          $MedicationPhasesUpdateCompanionBuilder,
          (MedicationPhase, $MedicationPhasesReferences),
          MedicationPhase,
          PrefetchHooks Function({bool medicationId, bool medicationDosesRefs})
        > {
  $MedicationPhasesTableManager(_$AppDatabase db, MedicationPhases table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $MedicationPhasesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $MedicationPhasesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $MedicationPhasesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> medicationId = const Value.absent(),
                Value<int> phaseOrder = const Value.absent(),
                Value<String> doseAmount = const Value.absent(),
                Value<int> timesPerDay = const Value.absent(),
                Value<String?> doseTimes = const Value.absent(),
                Value<String> durationType = const Value.absent(),
                Value<int?> durationDays = const Value.absent(),
                Value<int?> durationDoseCount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicationPhasesCompanion(
                id: id,
                medicationId: medicationId,
                phaseOrder: phaseOrder,
                doseAmount: doseAmount,
                timesPerDay: timesPerDay,
                doseTimes: doseTimes,
                durationType: durationType,
                durationDays: durationDays,
                durationDoseCount: durationDoseCount,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String medicationId,
                required int phaseOrder,
                required String doseAmount,
                required int timesPerDay,
                Value<String?> doseTimes = const Value.absent(),
                required String durationType,
                Value<int?> durationDays = const Value.absent(),
                Value<int?> durationDoseCount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicationPhasesCompanion.insert(
                id: id,
                medicationId: medicationId,
                phaseOrder: phaseOrder,
                doseAmount: doseAmount,
                timesPerDay: timesPerDay,
                doseTimes: doseTimes,
                durationType: durationType,
                durationDays: durationDays,
                durationDoseCount: durationDoseCount,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $MedicationPhasesReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({medicationId = false, medicationDosesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (medicationDosesRefs) db.medicationDoses,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (medicationId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.medicationId,
                                    referencedTable: $MedicationPhasesReferences
                                        ._medicationIdTable(db),
                                    referencedColumn:
                                        $MedicationPhasesReferences
                                            ._medicationIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (medicationDosesRefs)
                        await $_getPrefetchedData<
                          MedicationPhase,
                          MedicationPhases,
                          MedicationDose
                        >(
                          currentTable: table,
                          referencedTable: $MedicationPhasesReferences
                              ._medicationDosesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $MedicationPhasesReferences(
                                db,
                                table,
                                p0,
                              ).medicationDosesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.phaseId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $MedicationPhasesProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      MedicationPhases,
      MedicationPhase,
      $MedicationPhasesFilterComposer,
      $MedicationPhasesOrderingComposer,
      $MedicationPhasesAnnotationComposer,
      $MedicationPhasesCreateCompanionBuilder,
      $MedicationPhasesUpdateCompanionBuilder,
      (MedicationPhase, $MedicationPhasesReferences),
      MedicationPhase,
      PrefetchHooks Function({bool medicationId, bool medicationDosesRefs})
    >;
typedef $MedicationDosesCreateCompanionBuilder =
    MedicationDosesCompanion Function({
      required String id,
      required String medicationId,
      required String phaseId,
      required String scheduledFor,
      required String givenAt,
      Value<int> rowid,
    });
typedef $MedicationDosesUpdateCompanionBuilder =
    MedicationDosesCompanion Function({
      Value<String> id,
      Value<String> medicationId,
      Value<String> phaseId,
      Value<String> scheduledFor,
      Value<String> givenAt,
      Value<int> rowid,
    });

final class $MedicationDosesReferences
    extends BaseReferences<_$AppDatabase, MedicationDoses, MedicationDose> {
  $MedicationDosesReferences(super.$_db, super.$_table, super.$_typedResult);

  static Medications _medicationIdTable(_$AppDatabase db) => db.medications
      .createAlias('medication_doses__medication_id__medications__id');

  $MedicationsProcessedTableManager get medicationId {
    final $_column = $_itemColumn<String>('medication_id')!;

    final manager = $MedicationsTableManager(
      $_db,
      $_db.medications,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MedicationPhases _phaseIdTable(_$AppDatabase db) => db.medicationPhases
      .createAlias('medication_doses__phase_id__medication_phases__id');

  $MedicationPhasesProcessedTableManager get phaseId {
    final $_column = $_itemColumn<String>('phase_id')!;

    final manager = $MedicationPhasesTableManager(
      $_db,
      $_db.medicationPhases,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_phaseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $MedicationDosesFilterComposer
    extends Composer<_$AppDatabase, MedicationDoses> {
  $MedicationDosesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get givenAt => $composableBuilder(
    column: $table.givenAt,
    builder: (column) => ColumnFilters(column),
  );

  $MedicationsFilterComposer get medicationId {
    final $MedicationsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MedicationsFilterComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $MedicationPhasesFilterComposer get phaseId {
    final $MedicationPhasesFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.phaseId,
      referencedTable: $db.medicationPhases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MedicationPhasesFilterComposer(
            $db: $db,
            $table: $db.medicationPhases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $MedicationDosesOrderingComposer
    extends Composer<_$AppDatabase, MedicationDoses> {
  $MedicationDosesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get givenAt => $composableBuilder(
    column: $table.givenAt,
    builder: (column) => ColumnOrderings(column),
  );

  $MedicationsOrderingComposer get medicationId {
    final $MedicationsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MedicationsOrderingComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $MedicationPhasesOrderingComposer get phaseId {
    final $MedicationPhasesOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.phaseId,
      referencedTable: $db.medicationPhases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MedicationPhasesOrderingComposer(
            $db: $db,
            $table: $db.medicationPhases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $MedicationDosesAnnotationComposer
    extends Composer<_$AppDatabase, MedicationDoses> {
  $MedicationDosesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get givenAt =>
      $composableBuilder(column: $table.givenAt, builder: (column) => column);

  $MedicationsAnnotationComposer get medicationId {
    final $MedicationsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MedicationsAnnotationComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $MedicationPhasesAnnotationComposer get phaseId {
    final $MedicationPhasesAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.phaseId,
      referencedTable: $db.medicationPhases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $MedicationPhasesAnnotationComposer(
            $db: $db,
            $table: $db.medicationPhases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $MedicationDosesTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          MedicationDoses,
          MedicationDose,
          $MedicationDosesFilterComposer,
          $MedicationDosesOrderingComposer,
          $MedicationDosesAnnotationComposer,
          $MedicationDosesCreateCompanionBuilder,
          $MedicationDosesUpdateCompanionBuilder,
          (MedicationDose, $MedicationDosesReferences),
          MedicationDose,
          PrefetchHooks Function({bool medicationId, bool phaseId})
        > {
  $MedicationDosesTableManager(_$AppDatabase db, MedicationDoses table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $MedicationDosesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $MedicationDosesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $MedicationDosesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> medicationId = const Value.absent(),
                Value<String> phaseId = const Value.absent(),
                Value<String> scheduledFor = const Value.absent(),
                Value<String> givenAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicationDosesCompanion(
                id: id,
                medicationId: medicationId,
                phaseId: phaseId,
                scheduledFor: scheduledFor,
                givenAt: givenAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String medicationId,
                required String phaseId,
                required String scheduledFor,
                required String givenAt,
                Value<int> rowid = const Value.absent(),
              }) => MedicationDosesCompanion.insert(
                id: id,
                medicationId: medicationId,
                phaseId: phaseId,
                scheduledFor: scheduledFor,
                givenAt: givenAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $MedicationDosesReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({medicationId = false, phaseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (medicationId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.medicationId,
                                referencedTable: $MedicationDosesReferences
                                    ._medicationIdTable(db),
                                referencedColumn: $MedicationDosesReferences
                                    ._medicationIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (phaseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.phaseId,
                                referencedTable: $MedicationDosesReferences
                                    ._phaseIdTable(db),
                                referencedColumn: $MedicationDosesReferences
                                    ._phaseIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $MedicationDosesProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      MedicationDoses,
      MedicationDose,
      $MedicationDosesFilterComposer,
      $MedicationDosesOrderingComposer,
      $MedicationDosesAnnotationComposer,
      $MedicationDosesCreateCompanionBuilder,
      $MedicationDosesUpdateCompanionBuilder,
      (MedicationDose, $MedicationDosesReferences),
      MedicationDose,
      PrefetchHooks Function({bool medicationId, bool phaseId})
    >;
typedef $RemindersCreateCompanionBuilder =
    RemindersCompanion Function({
      required String id,
      required String petId,
      required String title,
      required String dueDate,
      Value<String> status,
      Value<String?> snoozedUntil,
      Value<String?> sourceRecordType,
      Value<String?> sourceRecordId,
      Value<bool> isManuallyOverridden,
      required String createdAt,
      required String lastEditedAt,
      Value<int> rowid,
    });
typedef $RemindersUpdateCompanionBuilder =
    RemindersCompanion Function({
      Value<String> id,
      Value<String> petId,
      Value<String> title,
      Value<String> dueDate,
      Value<String> status,
      Value<String?> snoozedUntil,
      Value<String?> sourceRecordType,
      Value<String?> sourceRecordId,
      Value<bool> isManuallyOverridden,
      Value<String> createdAt,
      Value<String> lastEditedAt,
      Value<int> rowid,
    });

final class $RemindersReferences
    extends BaseReferences<_$AppDatabase, Reminders, Reminder> {
  $RemindersReferences(super.$_db, super.$_table, super.$_typedResult);

  static Pets _petIdTable(_$AppDatabase db) =>
      db.pets.createAlias('reminders__pet_id__pets__id');

  $PetsProcessedTableManager get petId {
    final $_column = $_itemColumn<String>('pet_id')!;

    final manager = $PetsTableManager(
      $_db,
      $_db.pets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $RemindersFilterComposer extends Composer<_$AppDatabase, Reminders> {
  $RemindersFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get snoozedUntil => $composableBuilder(
    column: $table.snoozedUntil,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceRecordType => $composableBuilder(
    column: $table.sourceRecordType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceRecordId => $composableBuilder(
    column: $table.sourceRecordId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isManuallyOverridden => $composableBuilder(
    column: $table.isManuallyOverridden,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnFilters(column),
  );

  $PetsFilterComposer get petId {
    final $PetsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsFilterComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $RemindersOrderingComposer extends Composer<_$AppDatabase, Reminders> {
  $RemindersOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get snoozedUntil => $composableBuilder(
    column: $table.snoozedUntil,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceRecordType => $composableBuilder(
    column: $table.sourceRecordType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceRecordId => $composableBuilder(
    column: $table.sourceRecordId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isManuallyOverridden => $composableBuilder(
    column: $table.isManuallyOverridden,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $PetsOrderingComposer get petId {
    final $PetsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsOrderingComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $RemindersAnnotationComposer extends Composer<_$AppDatabase, Reminders> {
  $RemindersAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get snoozedUntil => $composableBuilder(
    column: $table.snoozedUntil,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceRecordType => $composableBuilder(
    column: $table.sourceRecordType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceRecordId => $composableBuilder(
    column: $table.sourceRecordId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isManuallyOverridden => $composableBuilder(
    column: $table.isManuallyOverridden,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => column,
  );

  $PetsAnnotationComposer get petId {
    final $PetsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsAnnotationComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $RemindersTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Reminders,
          Reminder,
          $RemindersFilterComposer,
          $RemindersOrderingComposer,
          $RemindersAnnotationComposer,
          $RemindersCreateCompanionBuilder,
          $RemindersUpdateCompanionBuilder,
          (Reminder, $RemindersReferences),
          Reminder,
          PrefetchHooks Function({bool petId})
        > {
  $RemindersTableManager(_$AppDatabase db, Reminders table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $RemindersFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $RemindersOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $RemindersAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> dueDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> snoozedUntil = const Value.absent(),
                Value<String?> sourceRecordType = const Value.absent(),
                Value<String?> sourceRecordId = const Value.absent(),
                Value<bool> isManuallyOverridden = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> lastEditedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion(
                id: id,
                petId: petId,
                title: title,
                dueDate: dueDate,
                status: status,
                snoozedUntil: snoozedUntil,
                sourceRecordType: sourceRecordType,
                sourceRecordId: sourceRecordId,
                isManuallyOverridden: isManuallyOverridden,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String petId,
                required String title,
                required String dueDate,
                Value<String> status = const Value.absent(),
                Value<String?> snoozedUntil = const Value.absent(),
                Value<String?> sourceRecordType = const Value.absent(),
                Value<String?> sourceRecordId = const Value.absent(),
                Value<bool> isManuallyOverridden = const Value.absent(),
                required String createdAt,
                required String lastEditedAt,
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion.insert(
                id: id,
                petId: petId,
                title: title,
                dueDate: dueDate,
                status: status,
                snoozedUntil: snoozedUntil,
                sourceRecordType: sourceRecordType,
                sourceRecordId: sourceRecordId,
                isManuallyOverridden: isManuallyOverridden,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (e.readTable(table), $RemindersReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({petId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (petId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.petId,
                                referencedTable: $RemindersReferences
                                    ._petIdTable(db),
                                referencedColumn: $RemindersReferences
                                    ._petIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $RemindersProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Reminders,
      Reminder,
      $RemindersFilterComposer,
      $RemindersOrderingComposer,
      $RemindersAnnotationComposer,
      $RemindersCreateCompanionBuilder,
      $RemindersUpdateCompanionBuilder,
      (Reminder, $RemindersReferences),
      Reminder,
      PrefetchHooks Function({bool petId})
    >;
typedef $AttachmentsCreateCompanionBuilder =
    AttachmentsCompanion Function({
      required String id,
      required String petId,
      Value<String?> linkedRecordType,
      Value<String?> linkedRecordId,
      required String fileName,
      required String filePath,
      required String fileType,
      Value<String?> description,
      required String uploadedAt,
      Value<int> rowid,
    });
typedef $AttachmentsUpdateCompanionBuilder =
    AttachmentsCompanion Function({
      Value<String> id,
      Value<String> petId,
      Value<String?> linkedRecordType,
      Value<String?> linkedRecordId,
      Value<String> fileName,
      Value<String> filePath,
      Value<String> fileType,
      Value<String?> description,
      Value<String> uploadedAt,
      Value<int> rowid,
    });

final class $AttachmentsReferences
    extends BaseReferences<_$AppDatabase, Attachments, Attachment> {
  $AttachmentsReferences(super.$_db, super.$_table, super.$_typedResult);

  static Pets _petIdTable(_$AppDatabase db) =>
      db.pets.createAlias('attachments__pet_id__pets__id');

  $PetsProcessedTableManager get petId {
    final $_column = $_itemColumn<String>('pet_id')!;

    final manager = $PetsTableManager(
      $_db,
      $_db.pets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $AttachmentsFilterComposer extends Composer<_$AppDatabase, Attachments> {
  $AttachmentsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get linkedRecordType => $composableBuilder(
    column: $table.linkedRecordType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get linkedRecordId => $composableBuilder(
    column: $table.linkedRecordId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uploadedAt => $composableBuilder(
    column: $table.uploadedAt,
    builder: (column) => ColumnFilters(column),
  );

  $PetsFilterComposer get petId {
    final $PetsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsFilterComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $AttachmentsOrderingComposer
    extends Composer<_$AppDatabase, Attachments> {
  $AttachmentsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get linkedRecordType => $composableBuilder(
    column: $table.linkedRecordType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get linkedRecordId => $composableBuilder(
    column: $table.linkedRecordId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uploadedAt => $composableBuilder(
    column: $table.uploadedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $PetsOrderingComposer get petId {
    final $PetsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsOrderingComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $AttachmentsAnnotationComposer
    extends Composer<_$AppDatabase, Attachments> {
  $AttachmentsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get linkedRecordType => $composableBuilder(
    column: $table.linkedRecordType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get linkedRecordId => $composableBuilder(
    column: $table.linkedRecordId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get fileType =>
      $composableBuilder(column: $table.fileType, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get uploadedAt => $composableBuilder(
    column: $table.uploadedAt,
    builder: (column) => column,
  );

  $PetsAnnotationComposer get petId {
    final $PetsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsAnnotationComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $AttachmentsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Attachments,
          Attachment,
          $AttachmentsFilterComposer,
          $AttachmentsOrderingComposer,
          $AttachmentsAnnotationComposer,
          $AttachmentsCreateCompanionBuilder,
          $AttachmentsUpdateCompanionBuilder,
          (Attachment, $AttachmentsReferences),
          Attachment,
          PrefetchHooks Function({bool petId})
        > {
  $AttachmentsTableManager(_$AppDatabase db, Attachments table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $AttachmentsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $AttachmentsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $AttachmentsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<String?> linkedRecordType = const Value.absent(),
                Value<String?> linkedRecordId = const Value.absent(),
                Value<String> fileName = const Value.absent(),
                Value<String> filePath = const Value.absent(),
                Value<String> fileType = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> uploadedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AttachmentsCompanion(
                id: id,
                petId: petId,
                linkedRecordType: linkedRecordType,
                linkedRecordId: linkedRecordId,
                fileName: fileName,
                filePath: filePath,
                fileType: fileType,
                description: description,
                uploadedAt: uploadedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String petId,
                Value<String?> linkedRecordType = const Value.absent(),
                Value<String?> linkedRecordId = const Value.absent(),
                required String fileName,
                required String filePath,
                required String fileType,
                Value<String?> description = const Value.absent(),
                required String uploadedAt,
                Value<int> rowid = const Value.absent(),
              }) => AttachmentsCompanion.insert(
                id: id,
                petId: petId,
                linkedRecordType: linkedRecordType,
                linkedRecordId: linkedRecordId,
                fileName: fileName,
                filePath: filePath,
                fileType: fileType,
                description: description,
                uploadedAt: uploadedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $AttachmentsReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({petId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (petId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.petId,
                                referencedTable: $AttachmentsReferences
                                    ._petIdTable(db),
                                referencedColumn: $AttachmentsReferences
                                    ._petIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $AttachmentsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Attachments,
      Attachment,
      $AttachmentsFilterComposer,
      $AttachmentsOrderingComposer,
      $AttachmentsAnnotationComposer,
      $AttachmentsCreateCompanionBuilder,
      $AttachmentsUpdateCompanionBuilder,
      (Attachment, $AttachmentsReferences),
      Attachment,
      PrefetchHooks Function({bool petId})
    >;
typedef $NotesCreateCompanionBuilder =
    NotesCompanion Function({
      required String id,
      required String petId,
      required String date,
      required String noteText,
      Value<String?> linkedRecordType,
      Value<String?> linkedRecordId,
      Value<String?> handledByPersonId,
      required String createdAt,
      required String lastEditedAt,
      Value<int> rowid,
    });
typedef $NotesUpdateCompanionBuilder =
    NotesCompanion Function({
      Value<String> id,
      Value<String> petId,
      Value<String> date,
      Value<String> noteText,
      Value<String?> linkedRecordType,
      Value<String?> linkedRecordId,
      Value<String?> handledByPersonId,
      Value<String> createdAt,
      Value<String> lastEditedAt,
      Value<int> rowid,
    });

final class $NotesReferences
    extends BaseReferences<_$AppDatabase, Notes, Note> {
  $NotesReferences(super.$_db, super.$_table, super.$_typedResult);

  static Pets _petIdTable(_$AppDatabase db) =>
      db.pets.createAlias('notes__pet_id__pets__id');

  $PetsProcessedTableManager get petId {
    final $_column = $_itemColumn<String>('pet_id')!;

    final manager = $PetsTableManager(
      $_db,
      $_db.pets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_petIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static People _handledByPersonIdTable(_$AppDatabase db) =>
      db.people.createAlias('notes__handled_by_person_id__people__id');

  $PeopleProcessedTableManager? get handledByPersonId {
    final $_column = $_itemColumn<String>('handled_by_person_id');
    if ($_column == null) return null;
    final manager = $PeopleTableManager(
      $_db,
      $_db.people,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_handledByPersonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $NotesFilterComposer extends Composer<_$AppDatabase, Notes> {
  $NotesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get noteText => $composableBuilder(
    column: $table.noteText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get linkedRecordType => $composableBuilder(
    column: $table.linkedRecordType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get linkedRecordId => $composableBuilder(
    column: $table.linkedRecordId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnFilters(column),
  );

  $PetsFilterComposer get petId {
    final $PetsFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsFilterComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleFilterComposer get handledByPersonId {
    final $PeopleFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleFilterComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $NotesOrderingComposer extends Composer<_$AppDatabase, Notes> {
  $NotesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get noteText => $composableBuilder(
    column: $table.noteText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get linkedRecordType => $composableBuilder(
    column: $table.linkedRecordType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get linkedRecordId => $composableBuilder(
    column: $table.linkedRecordId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $PetsOrderingComposer get petId {
    final $PetsOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsOrderingComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleOrderingComposer get handledByPersonId {
    final $PeopleOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleOrderingComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $NotesAnnotationComposer extends Composer<_$AppDatabase, Notes> {
  $NotesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get noteText =>
      $composableBuilder(column: $table.noteText, builder: (column) => column);

  GeneratedColumn<String> get linkedRecordType => $composableBuilder(
    column: $table.linkedRecordType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get linkedRecordId => $composableBuilder(
    column: $table.linkedRecordId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => column,
  );

  $PetsAnnotationComposer get petId {
    final $PetsAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.petId,
      referencedTable: $db.pets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PetsAnnotationComposer(
            $db: $db,
            $table: $db.pets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $PeopleAnnotationComposer get handledByPersonId {
    final $PeopleAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.handledByPersonId,
      referencedTable: $db.people,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $PeopleAnnotationComposer(
            $db: $db,
            $table: $db.people,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $NotesTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Notes,
          Note,
          $NotesFilterComposer,
          $NotesOrderingComposer,
          $NotesAnnotationComposer,
          $NotesCreateCompanionBuilder,
          $NotesUpdateCompanionBuilder,
          (Note, $NotesReferences),
          Note,
          PrefetchHooks Function({bool petId, bool handledByPersonId})
        > {
  $NotesTableManager(_$AppDatabase db, Notes table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $NotesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $NotesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $NotesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> noteText = const Value.absent(),
                Value<String?> linkedRecordType = const Value.absent(),
                Value<String?> linkedRecordId = const Value.absent(),
                Value<String?> handledByPersonId = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> lastEditedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotesCompanion(
                id: id,
                petId: petId,
                date: date,
                noteText: noteText,
                linkedRecordType: linkedRecordType,
                linkedRecordId: linkedRecordId,
                handledByPersonId: handledByPersonId,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String petId,
                required String date,
                required String noteText,
                Value<String?> linkedRecordType = const Value.absent(),
                Value<String?> linkedRecordId = const Value.absent(),
                Value<String?> handledByPersonId = const Value.absent(),
                required String createdAt,
                required String lastEditedAt,
                Value<int> rowid = const Value.absent(),
              }) => NotesCompanion.insert(
                id: id,
                petId: petId,
                date: date,
                noteText: noteText,
                linkedRecordType: linkedRecordType,
                linkedRecordId: linkedRecordId,
                handledByPersonId: handledByPersonId,
                createdAt: createdAt,
                lastEditedAt: lastEditedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), $NotesReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({petId = false, handledByPersonId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (petId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.petId,
                                referencedTable: $NotesReferences._petIdTable(
                                  db,
                                ),
                                referencedColumn: $NotesReferences
                                    ._petIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (handledByPersonId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.handledByPersonId,
                                referencedTable: $NotesReferences
                                    ._handledByPersonIdTable(db),
                                referencedColumn: $NotesReferences
                                    ._handledByPersonIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $NotesProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Notes,
      Note,
      $NotesFilterComposer,
      $NotesOrderingComposer,
      $NotesAnnotationComposer,
      $NotesCreateCompanionBuilder,
      $NotesUpdateCompanionBuilder,
      (Note, $NotesReferences),
      Note,
      PrefetchHooks Function({bool petId, bool handledByPersonId})
    >;
typedef $AppSettingsCreateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<int> id,
      Value<String> theme,
      required String lastEditedAt,
    });
typedef $AppSettingsUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<int> id,
      Value<String> theme,
      Value<String> lastEditedAt,
    });

class $AppSettingsFilterComposer extends Composer<_$AppDatabase, AppSettings> {
  $AppSettingsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get theme => $composableBuilder(
    column: $table.theme,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $AppSettingsOrderingComposer
    extends Composer<_$AppDatabase, AppSettings> {
  $AppSettingsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get theme => $composableBuilder(
    column: $table.theme,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $AppSettingsAnnotationComposer
    extends Composer<_$AppDatabase, AppSettings> {
  $AppSettingsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get theme =>
      $composableBuilder(column: $table.theme, builder: (column) => column);

  GeneratedColumn<String> get lastEditedAt => $composableBuilder(
    column: $table.lastEditedAt,
    builder: (column) => column,
  );
}

class $AppSettingsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          AppSettings,
          AppSetting,
          $AppSettingsFilterComposer,
          $AppSettingsOrderingComposer,
          $AppSettingsAnnotationComposer,
          $AppSettingsCreateCompanionBuilder,
          $AppSettingsUpdateCompanionBuilder,
          (AppSetting, BaseReferences<_$AppDatabase, AppSettings, AppSetting>),
          AppSetting,
          PrefetchHooks Function()
        > {
  $AppSettingsTableManager(_$AppDatabase db, AppSettings table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $AppSettingsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $AppSettingsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $AppSettingsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> theme = const Value.absent(),
                Value<String> lastEditedAt = const Value.absent(),
              }) => AppSettingsCompanion(
                id: id,
                theme: theme,
                lastEditedAt: lastEditedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> theme = const Value.absent(),
                required String lastEditedAt,
              }) => AppSettingsCompanion.insert(
                id: id,
                theme: theme,
                lastEditedAt: lastEditedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $AppSettingsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      AppSettings,
      AppSetting,
      $AppSettingsFilterComposer,
      $AppSettingsOrderingComposer,
      $AppSettingsAnnotationComposer,
      $AppSettingsCreateCompanionBuilder,
      $AppSettingsUpdateCompanionBuilder,
      (AppSetting, BaseReferences<_$AppDatabase, AppSettings, AppSetting>),
      AppSetting,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $PetsTableManager get pets => $PetsTableManager(_db, _db.pets);
  $PeopleTableManager get people => $PeopleTableManager(_db, _db.people);
  $VetAppointmentsTableManager get vetAppointments =>
      $VetAppointmentsTableManager(_db, _db.vetAppointments);
  $HospitalizationsTableManager get hospitalizations =>
      $HospitalizationsTableManager(_db, _db.hospitalizations);
  $ProceduresSurgeriesTableManager get proceduresSurgeries =>
      $ProceduresSurgeriesTableManager(_db, _db.proceduresSurgeries);
  $IllnessCustomEventsTableManager get illnessCustomEvents =>
      $IllnessCustomEventsTableManager(_db, _db.illnessCustomEvents);
  $VaccinationsTableManager get vaccinations =>
      $VaccinationsTableManager(_db, _db.vaccinations);
  $MicrochipRecordsTableManager get microchipRecords =>
      $MicrochipRecordsTableManager(_db, _db.microchipRecords);
  $MedicationsTableManager get medications =>
      $MedicationsTableManager(_db, _db.medications);
  $MedicationPhasesTableManager get medicationPhases =>
      $MedicationPhasesTableManager(_db, _db.medicationPhases);
  $MedicationDosesTableManager get medicationDoses =>
      $MedicationDosesTableManager(_db, _db.medicationDoses);
  $RemindersTableManager get reminders =>
      $RemindersTableManager(_db, _db.reminders);
  $AttachmentsTableManager get attachments =>
      $AttachmentsTableManager(_db, _db.attachments);
  $NotesTableManager get notes => $NotesTableManager(_db, _db.notes);
  $AppSettingsTableManager get appSettings =>
      $AppSettingsTableManager(_db, _db.appSettings);
}
