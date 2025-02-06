import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@DataClassName('Fossil')
class Fossils extends Table {
  TextColumn get name => text()();
  TextColumn get imagePath => text()();
  TextColumn get description => text()();

  @override
  Set<Column> get primaryKey => {name};
}

@DriftDatabase(tables: [Fossils])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Fossil>> getAllFossils() => select(fossils).get();
  Future insertFossil(FossilsCompanion fossil) => into(fossils).insert(fossil);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await sqflite.getDatabasesPath();
    final file = File(p.join(dbFolder, 'db.sqlite'));
    return NativeDatabase(file);
  });
}