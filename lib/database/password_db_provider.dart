import 'dart:io';
import 'package:okapia_app/models/password.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database _database;
  final String _tableName = "Password";

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
        "title TEXT, "
        "content TEXT)");
  }

  rawInsertPassword(Password newPassword) async {
    final db = await database;
    await db.transaction((transaction) async {
      return await transaction
          .rawInsert("INSERT Into $_tableName (title, content) "
              "VALUES (${newPassword.title}, ${newPassword.content})");
    });
  }

  insertPassword(Password newPassword) async {
    final db = await database;
    await db.transaction((transaction) async {
      return await transaction.insert("User", newPassword.toJson());
    });
  }

  getPasswordById(int id) async {
    final db = await database;
    var res = await db.query(_tableName, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Password.fromJson(res.first) : Null;
  }

  Future<List<Password>> getAllPasswords() async {
    final db = await database;
    var res = await db.query("User");
    List<Password> passwords = List();
    if (res.isNotEmpty) {
      for (var i = 0; i < res.length; i++) {
        passwords.add(Password.fromJson(res[i]));
      }
    }

    return passwords;
  }

  updatePassword(Password updatePassword) async {
    final db = await database;
    await db.transaction((transaction) async {
      return transaction.update(_tableName, updatePassword.toJson(),
          where: "id = ?", whereArgs: [updatePassword.id]);
    });
  }

  deletePassword(Password deletePassword) async {
    final db = await database;
    await db.transaction((transaction) async {
      return transaction
          .delete(_tableName, where: "id = ?", whereArgs: [deletePassword.id]);
    });
  }

  deleteAllPasswords() async {
    final db = await database;
    await db.transaction((transaction) async {
      transaction.rawDelete("Delete * from $_tableName");
    });
  }
}
