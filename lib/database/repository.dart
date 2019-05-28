import 'package:okapia_app/database/storage.dart';
import 'package:okapia_app/entities/config.dart';
import 'package:okapia_app/entities/record.dart';

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

abstract class ConfigRepository<T> extends Repository<T, ConfigEntity, int> {
  ConfigRepository(Storage<T> storage) : super(storage);
}

abstract class RecordRepository<T> extends Repository<T, RecordEntity, int> {
  RecordRepository(Storage<T> storage) : super(storage);

  Future<List<RecordEntity>> findByTitle(String title);
}
