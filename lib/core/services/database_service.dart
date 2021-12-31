import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:rr_priscilla_abhulimen/core/models/note_model.dart';
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

  Future<int> createNote(Note note) async{
    final data = await database;
    return data.insert(
        'noteTable',
        note.toMap()
    );
  }

  Future<int> deleteNote(Note note) async{
    final data = await database;
    return data.delete(
      'noteTable',
      where: '_id = ?',
      whereArgs: [note.id]
    );
  }

  Future<List<Note>> getAllNotes() async{
    final data = await database;
    var allRows = await data.query('noteTable');

    List<Note> notesList = allRows.isNotEmpty ? allRows.map((e) => Note.fromMap(e)).toList() : [];
    return notesList;
  }

  Future<Note> getNoteById(Note note) async{
    final data = await database;
    var res = await data.query(
        'noteTable',
        where: '_id = ?',
      whereArgs: [note.id]
    );
    return res.isNotEmpty ? Note.fromMap(res.first) : null;
  }

  Future<int> updateNote(Note note) async{
    final data = await database;
    var res = await data.update(
      'noteTable',
      note.toMap(),
      where: '_id = ?',
      whereArgs: [note.id]
    );

    return res;
  }
}