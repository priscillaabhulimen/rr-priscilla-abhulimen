import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServices{
  DatabaseServices._();

  static final DatabaseServices db = DatabaseServices._();

  final _dbName = "notesDB.db";
  final _dbVersion = 1;

  static final noteColumnId = '_id';
  static final noteColumnTitle = 'title';
  static final noteColumnBody = 'body';

  static Database _database;

  Future<Database> get database async{
    if(_database == null) _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = docDirectory.path + _dbName;
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async{
    await db.execute('''
      CREATE TABLE noteTable (
        $noteColumnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $noteColumnTitle TEXT NOT NULL,
        $noteColumnBody TEXT NOT NULL
      )
    ''');
  }
}