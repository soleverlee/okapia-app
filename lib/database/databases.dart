import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient {
  static Database _database;

  static Future<Database> get database async {
    if (_database == null) {
      await initDb();
    }

    return _database;
  }

  static void initDb() async {
    final String path = await getDatabasePath();
    _database = await openDatabase(path, version: 1, onCreate: _initialize);
  }

  static Future<String> getDatabasePath() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    return join(documentsDirectory.path, "okapia.db");
  }

  static void _initialize(Database db, int version) async {
    final String script = await rootBundle.loadString("assets/config/init.sql");
    final batch = db.batch();
    for (final statement in script.split(";")) {
      final sql = statement.trim();
      if (sql.isNotEmpty) {
        print("Executing:" + sql);
        batch.execute(sql);
      }
    }
    await batch.commit(noResult: true);
  }
}
