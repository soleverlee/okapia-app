import 'package:okapia_app/entities/record.dart';
import 'package:sqflite/sqflite.dart';

import 'databases.dart';

class RecordDBProvider {
  final String _tableName = "Record";

  Future<Database> get database => DatabaseClient.database;

  rawInsertRecord(RecordEntity newRecord) async {
    final db = await database;
    // FIXME: db.transaction got null when database if recreated.
    await db.transaction((transaction) async {
      return await transaction
          .rawInsert("INSERT Into $_tableName (title, content) "
              "VALUES ('${newRecord.title}', '${newRecord.content}')");
    });
  }

  insertRecord(RecordEntity newRecord) async {
    final db = await database;
    await db.transaction((transaction) async {
      return await transaction.insert(_tableName, newRecord.toMap());
    });
  }

  getRecordById(int id) async {
    final db = await database;
    var res = await db.query(_tableName, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? RecordEntity.from(res.first) : Null;
  }

  Future<List<RecordEntity>> getAllRecords() async {
    final db = await database;
    var res = await db.query(_tableName);
    List<RecordEntity> records = List();
    if (res.isNotEmpty) {
      for (var i = 0; i < res.length; i++) {
        records.add(RecordEntity.from(res[i]));
      }
    }

    return records;
  }

  Future<List<RecordEntity>> getRecordsByTitle(String title) async {
    final db = await database;
    var res = await db
        .query(_tableName, where: "title like ?", whereArgs: ["%$title%"]);
    List<RecordEntity> records = List();
    if (res.isNotEmpty) {
      for (var i = 0; i < res.length; i++) {
        records.add(RecordEntity.from(res[i]));
      }
    }

    return records;
  }

  updateRecord(RecordEntity updateRecord) async {
    final db = await database;
    await db.transaction((transaction) async {
      return transaction.update(_tableName, updateRecord.toMap(),
          where: "id = ?", whereArgs: [updateRecord.id]);
    });
  }

  deleteRecord(RecordEntity deleteRecord) async {
    final db = await database;
    await db.transaction((transaction) async {
      return transaction
          .delete(_tableName, where: "id = ?", whereArgs: [deleteRecord.id]);
    });
  }

  deleteAllRecords() async {
    final db = await database;
    await db.transaction((transaction) async {
      transaction.rawDelete("Delete * from $_tableName");
    });
  }
}
