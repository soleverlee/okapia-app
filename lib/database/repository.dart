import 'package:okapia_app/database/storage.dart';
import 'package:okapia_app/entities/config.dart';
import 'package:sqflite/sqflite.dart';

abstract class Repository<T, E, I> {
  Storage<T> storage;

  Repository(Storage<T> storage) {
    this.storage = storage;
  }

  Future<List<E>> findAll();

  Future<E> findById(I Id);

  Future<E> create(E item);

  Future<int> batchCreate(List<E> items);

  Future<E> update(I id, E item);

  Future<E> removeById(I id);
}

abstract class ResourceRepository<T>
    extends Repository<T, ConfigEntity, int> {
  ResourceRepository(Storage<T> storage) : super(storage);
}
