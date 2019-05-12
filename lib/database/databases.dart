import 'dart:io';
import 'package:okapia_app/models/password.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class MyDataBase{
  static Database _database;

  static Future<Database> get database async {
    if (_database == null) {
      _database = await _initDB();
    }

    return _database;
  }

  static _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "okapia.db");
    return await openDatabase(path, version: 1, onCreate: _onCreateFunc);
  }

  static void _onCreateFunc(Database db, int version) async {
    await db.execute("CREATE TABLE Resource ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "name TEXT, "
        "value TEXT)");
    await db.execute("CREATE TABLE Password ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "title TEXT, "
        "content TEXT)");
  }
}