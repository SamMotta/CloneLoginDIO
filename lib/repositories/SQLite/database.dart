import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

Map<int, String> scripts = {
  1: '''CREATE TABLE tarefas(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    description TEXT,
    isCompleted INTEGER)'''
};

class SQLiteDataBase {
  static Database? db;

  Future<Database> getDatabase() async {
    if (db == null) {
      Database db = await initDatabase();
      return db;
    } else {
      return db!;
    }
  }

  Future<Database> initDatabase() async {
    var db = await openDatabase(
      p.join(await getDatabasesPath(), 'database.db'),
      version: scripts.length,
      onCreate: (db, version) async {
        for (int i = 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
          debugPrint(scripts[i]!);
        }
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        for (int i = oldVersion; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
          debugPrint(scripts[i]!);
        }
      },
    );

    return db;
  }
}
