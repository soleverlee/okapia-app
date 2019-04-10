import 'dart:io';
import 'package:okapia_app/models/constant.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ConstantDBProvider {
  static Database _database;
  static final _tableName = "Constant";

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

  rawInsertConstant(Constant newConstant) async {
    final db = await database;
    await db.transaction((transaction) async {
      final string = "INSERT Into $_tableName (name, value) "
          "VALUES (${newConstant.name}, ${newConstant.value})";
      return await transaction.rawInsert(string);
    });
  }

  insertConstant(Constant newConstant) async {
    final db = await database;
    await db.transaction((transaction) async {
      return await transaction.insert(_tableName, newConstant.toJson());
    });
  }

  getConstantById(int id) async {
    final db = await database;
    var res = await db.query(_tableName, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Constant.fromJson(res.first) : Null;
  }

  updateConstant(Constant updateConstant) async {
    final db = await database;
    await db.transaction((transaction) async {
      return transaction.update(_tableName, updateConstant.toJson(),
          where: "id = ?", whereArgs: [updateConstant.id]);
    });
  }

  deleteConstant(Constant deleteConstant) async {
    final db = await database;
    await db.transaction((transaction) async {
      return transaction
          .delete(_tableName, where: "id = ?", whereArgs: [deleteConstant.id]);
    });
  }

  deleteAllConstants() async {
    final db = await database;
    await db.transaction((transaction) async {
      transaction.rawDelete("Delete * from $_tableName");
    });
  }
}
