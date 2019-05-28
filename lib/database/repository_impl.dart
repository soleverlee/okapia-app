import 'package:okapia_app/database/storage.dart';
import 'package:okapia_app/entities/config.dart';
import 'package:okapia_app/entities/record.dart';
import 'package:sqflite/sqflite.dart';
import 'database_repository_impl.dart';
import 'repository.dart';

class ConfigRepositoryImpl extends DatabaseRepositoryImpl<ConfigEntity>
    implements ConfigRepository<Database> {
  ConfigRepositoryImpl(Storage<Database> storage)
      : super("resource", (values) => ConfigEntity.from(values), storage) {}
}

class RecordRepositoryImpl extends DatabaseRepositoryImpl<RecordEntity>
    implements RecordRepository<Database> {
  RecordRepositoryImpl(Storage<Database> storage)
      : super("record", (values) => RecordEntity.from(values), storage) {}

  @override
  Future<List<RecordEntity>> findByTitle(String title) async {
    return findAllByCondition("title=?", [title]);
  }
}
