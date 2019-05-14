import 'package:okapia_app/entities/password.dart';
import 'package:sqflite/sqflite.dart';

import 'databases.dart';

class RecordDBProvider {
  final String _tableName = "Password";

  Future<Database> get database => DatabaseClient.database;

  rawInsertPassword(Password newPassword) async {
    final db = await database;
    // FIXME: db.transaction got null when database if recreated.
    await db.transaction((transaction) async {
      return await transaction
          .rawInsert("INSERT Into $_tableName (title, content) "
              "VALUES ('${newPassword.title}', '${newPassword.content}')");
    });
  }

  insertPassword(Password newPassword) async {
    final db = await database;
    await db.transaction((transaction) async {
      return await transaction.insert(_tableName, newPassword.toJson());
    });
  }

  getPasswordById(int id) async {
    final db = await database;
    var res = await db.query(_tableName, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Password.fromJson(res.first) : Null;
  }

  Future<List<Password>> getAllPasswords() async {
    final db = await database;
    var res = await db.query(_tableName);
    List<Password> passwords = List();
    if (res.isNotEmpty) {
      for (var i = 0; i < res.length; i++) {
        passwords.add(Password.fromJson(res[i]));
      }
    }

    return passwords;
  }

  Future<List<Password>> getPasswordsByTitle(String title) async {
    final db = await database;
    var res = await db.query(
        _tableName, where: "title like ?", whereArgs: ["%$title%"]);
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
