import 'package:okapia_app/models/resource.dart';
import 'package:sqflite/sqflite.dart';

import 'databases.dart';

class ResourceDBProvider {
  static final _tableName = "Resource";

  Future<Database> get database => MyDataBase.database;

  Future<void> saveOrUpdate(Resource entity) async{
    var preRecord = await getResourceByName(entity.name);
    if (preRecord != null) {
      preRecord.value = entity.value;
      await updateResource(preRecord);
    } else {
      await insertResource(entity);
    }
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

  Future<Resource> getResourceByName(String name) async {
    final db = await database;
    var res = await db.query(_tableName, where: "name = ?", whereArgs: [name]);
    return res.isNotEmpty ? Resource.fromJson(res.first) : null;
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
