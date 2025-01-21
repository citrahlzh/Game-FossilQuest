// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FossilsTable extends Fossils with TableInfo<$FossilsTable, Fossil> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FossilsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, imagePath, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fossils';
  @override
  VerificationContext validateIntegrity(Insertable<Fossil> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Fossil map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Fossil(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $FossilsTable createAlias(String alias) {
    return $FossilsTable(attachedDatabase, alias);
  }
}

class Fossil extends DataClass implements Insertable<Fossil> {
  final int id;
  final String name;
  final String imagePath;
  final String description;
  const Fossil(
      {required this.id,
      required this.name,
      required this.imagePath,
      required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['image_path'] = Variable<String>(imagePath);
    map['description'] = Variable<String>(description);
    return map;
  }

  FossilsCompanion toCompanion(bool nullToAbsent) {
    return FossilsCompanion(
      id: Value(id),
      name: Value(name),
      imagePath: Value(imagePath),
      description: Value(description),
    );
  }

  factory Fossil.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Fossil(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'imagePath': serializer.toJson<String>(imagePath),
      'description': serializer.toJson<String>(description),
    };
  }

  Fossil copyWith(
          {int? id, String? name, String? imagePath, String? description}) =>
      Fossil(
        id: id ?? this.id,
        name: name ?? this.name,
        imagePath: imagePath ?? this.imagePath,
        description: description ?? this.description,
      );
  Fossil copyWithCompanion(FossilsCompanion data) {
    return Fossil(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Fossil(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, imagePath, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Fossil &&
          other.id == this.id &&
          other.name == this.name &&
          other.imagePath == this.imagePath &&
          other.description == this.description);
}

class FossilsCompanion extends UpdateCompanion<Fossil> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> imagePath;
  final Value<String> description;
  const FossilsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.description = const Value.absent(),
  });
  FossilsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String imagePath,
    required String description,
  })  : name = Value(name),
        imagePath = Value(imagePath),
        description = Value(description);
  static Insertable<Fossil> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? imagePath,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (imagePath != null) 'image_path': imagePath,
      if (description != null) 'description': description,
    });
  }

  FossilsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? imagePath,
      Value<String>? description}) {
    return FossilsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FossilsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FossilsTable fossils = $FossilsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [fossils];
}

typedef $$FossilsTableCreateCompanionBuilder = FossilsCompanion Function({
  Value<int> id,
  required String name,
  required String imagePath,
  required String description,
});
typedef $$FossilsTableUpdateCompanionBuilder = FossilsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> imagePath,
  Value<String> description,
});

class $$FossilsTableFilterComposer
    extends Composer<_$AppDatabase, $FossilsTable> {
  $$FossilsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));
}

class $$FossilsTableOrderingComposer
    extends Composer<_$AppDatabase, $FossilsTable> {
  $$FossilsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));
}

class $$FossilsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FossilsTable> {
  $$FossilsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);
}

class $$FossilsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FossilsTable,
    Fossil,
    $$FossilsTableFilterComposer,
    $$FossilsTableOrderingComposer,
    $$FossilsTableAnnotationComposer,
    $$FossilsTableCreateCompanionBuilder,
    $$FossilsTableUpdateCompanionBuilder,
    (Fossil, BaseReferences<_$AppDatabase, $FossilsTable, Fossil>),
    Fossil,
    PrefetchHooks Function()> {
  $$FossilsTableTableManager(_$AppDatabase db, $FossilsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FossilsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FossilsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FossilsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> imagePath = const Value.absent(),
            Value<String> description = const Value.absent(),
          }) =>
              FossilsCompanion(
            id: id,
            name: name,
            imagePath: imagePath,
            description: description,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String imagePath,
            required String description,
          }) =>
              FossilsCompanion.insert(
            id: id,
            name: name,
            imagePath: imagePath,
            description: description,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FossilsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FossilsTable,
    Fossil,
    $$FossilsTableFilterComposer,
    $$FossilsTableOrderingComposer,
    $$FossilsTableAnnotationComposer,
    $$FossilsTableCreateCompanionBuilder,
    $$FossilsTableUpdateCompanionBuilder,
    (Fossil, BaseReferences<_$AppDatabase, $FossilsTable, Fossil>),
    Fossil,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FossilsTableTableManager get fossils =>
      $$FossilsTableTableManager(_db, _db.fossils);
}
