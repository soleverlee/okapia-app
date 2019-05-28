import 'package:okapia_app/database/storage.dart';
import 'package:okapia_app/entities/entity.dart';
import 'package:okapia_app/entities/record.dart';
import 'package:sqflite/sqflite.dart';
import 'repository.dart';

typedef Convertor<T extends AutoIdEntity> = T Function(
    Map<String, dynamic> values);

abstract class DatabaseRepositoryImpl<E extends AutoIdEntity>
    extends Repository<Database, E, int> {
  final String table;
  final Convertor convertor;

  DatabaseRepositoryImpl(
      String table, Convertor<E> converter, Storage<Database> storage)
      : this.table = table,
        this.convertor = converter,
        super(storage) {}

  @override
  Future<int> batchCreate(List<E> items) async {
    final Database db = await storage.getStorageInstance();
    final batch = db.batch();
    items.forEach((item) => batch.insert(table, item.toMap()));
    await batch.commit(noResult: true);
    return items.length;
  }

  @override
  Future<E> create(E item) async {
    final Database db = await storage.getStorageInstance();
    item.id = await db.insert(table, item.toMap());
    return item;
  }

  @override
  Future<List<E>> findAll() async {
    final Database db = await storage.getStorageInstance();
    final res = await db.query(table);
    // must use map<E> ! or you just got List<AutoIdEntity> , not E
    var result = res.map<E>((values) => convertor(values)).toList();
    return result;
  }

  Future<List<E>> findAllByCondition(
      String where, List<dynamic> whereArgs) async {
    final Database db = await storage.getStorageInstance();
    final res = await db.query(table, where: where, whereArgs: whereArgs);
    // must use map<E> ! or you just got List<AutoIdEntity> , not E
    var result = res.map<E>((values) => convertor(values)).toList();
    return result;
  }

  @override
  Future<E> findById(int id) async {
    final Database db = await storage.getStorageInstance();
    final res = await db.query(table, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? convertor(res.first) : null;
  }

  @override
  Future<E> removeById(int id) async {
    final Database db = await storage.getStorageInstance();
    final E existing = await findById(id);
    if (existing != null)
      await db.delete(table, where: "id = ?", whereArgs: [id]);
    return existing;
  }

  @override
  Future<E> update(int id, E item) async {
    final Database db = await storage.getStorageInstance();
    item.id = id;
    int updated =
        await db.update(table, item.toMap(), where: "id = ?", whereArgs: [id]);
    if (updated != 1) return null;
    return item;
  }
}
