import 'dart:io';

import 'package:flutter/services.dart';
import 'package:okapia_app/common/log_utils.dart';
import 'package:okapia_app/database/storage.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseStorage implements Storage<Database> {
  final String dbName;

  Database _database;

  DatabaseStorage({this.dbName}) {}

  Future<String> _getDatabasePath() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    return join(documentsDirectory.path, dbName);
  }

  Future<void> _openDatabase() async {
    _database = await openDatabase(await _getDatabasePath(),
        version: 1, onCreate: _initialize);
  }

  static Future<bool> _initialize(Database db, int version) async {
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

  @override
  Future<bool> initialize() async {
    await _openDatabase();
    return true;
  }

  @override
  Future<bool> isInitialized() async {
    final String path = await _getDatabasePath();
    LogUtils.i("checking file:${path}");
    final File file = File(path);
    if (!file.existsSync()) return false;
    final db = await openDatabase(path, version: 1);
    if (db != null) return true;
    await db.close();
    _database = null;
    return false;
  }

  @override
  Future<Database> getStorageInstance() async {
    if (_database == null) await _openDatabase();
    return _database;
  }
}
