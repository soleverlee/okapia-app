import 'package:okapia_app/database/storage.dart';
import 'package:okapia_app/entities/config.dart';
import 'package:sqflite/sqflite.dart';
import 'repository.dart';

class ResourceRepositoryImpl extends ResourceRepository<Database> {
  static const String table = "resource";

  Storage<Database> storage;

  ResourceRepositoryImpl(Storage<Database> storage) : super(storage) {}

  @override
  Future<ResourceEntity> create(ResourceEntity item) async {
    final Database db = await storage.getStorageInstance();
    item.id = await db.insert(table, item.toMap());
    return item;
  }

  @override
  Future<int> batchCreate(List<ResourceEntity> items) async {
    final Database db = await storage.getStorageInstance();
    final batch = db.batch();
    items.forEach((item) => batch.insert(table, item.toMap()));
    await batch.commit(noResult: true);
    return items.length;
  }

  @override
  Future<List<ResourceEntity>> findAll() async {
    final Database db = await storage.getStorageInstance();
    final res = await db.query(table);
    return res.map((values) => ResourceEntity.fromMap(values)).toList();
  }

  @override
  Future<ResourceEntity> findById(int id) async {
    final Database db = await storage.getStorageInstance();
    final res = await db.query(table, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? ResourceEntity.fromMap(res.first) : null;
  }

  @override
  Future<ResourceEntity> removeById(int id) async {
    final Database db = await storage.getStorageInstance();
    final existing = await findById(id);
    if (existing != null)
      await db.delete(table, where: "id = ?", whereArgs: [id]);
    return existing;
  }

  @override
  Future<ResourceEntity> update(int id, ResourceEntity item) async {
    final Database db = await storage.getStorageInstance();
    item.id = id;
    int updated =
        await db.update(table, item.toMap(), where: "id = ?", whereArgs: [id]);
    if (updated != 1) return null;
    return item;
  }
}
