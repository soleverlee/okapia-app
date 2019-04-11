import 'dart:io';
import 'package:okapia_app/models/resource.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ResourceDBProvider {
  static Database _database;
  static final _tableName = "Resource";

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDB();
    }

    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "okapia.db");
    return await openDatabase(path, version: 1, onCreate: onCreateFunc);
  }

  void onCreateFunc(Database db, int version) async {
    await db.execute("CREATE TABLE $_tableName ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "name TEXT, "
        "value TEXT)");
  }

  rawInsertResource(Resource newResource) async {
    final db = await database;
    await db.transaction((transaction) async {
      final string = "INSERT Into $_tableName (name, value) "
          "VALUES (${newResource.name}, ${newResource.value})";
      return await transaction.rawInsert(string);
    });
  }

  insertResource(Resource newResource) async {
    final db = await database;
    await db.transaction((transaction) async {
      return await transaction.insert(_tableName, newResource.toJson());
    });
  }

  getResourceById(int id) async {
    final db = await database;
    var res = await db.query(_tableName, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Resource.fromJson(res.first) : Null;
  }

  updateResource(Resource updateResource) async {
    final db = await database;
    await db.transaction((transaction) async {
      return transaction.update(_tableName, updateResource.toJson(),
          where: "id = ?", whereArgs: [updateResource.id]);
    });
  }

  deleteResource(Resource deleteResource) async {
    final db = await database;
    await db.transaction((transaction) async {
      return transaction
          .delete(_tableName, where: "id = ?", whereArgs: [deleteResource.id]);
    });
  }

  deleteAllResources() async {
    final db = await database;
    await db.transaction((transaction) async {
      transaction.rawDelete("Delete * from $_tableName");
    });
  }
}
