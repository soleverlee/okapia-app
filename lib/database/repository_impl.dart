import 'package:okapia_app/database/storage.dart';
import 'package:okapia_app/entities/config.dart';
import 'package:sqflite/sqflite.dart';
import 'database_repository_impl.dart';
import 'repository.dart';

class ResourceRepositoryImpl extends DatabaseRepositoryImpl<ConfigEntity>
    implements ResourceRepository<Database> {
  ResourceRepositoryImpl(Storage<Database> storage)
      : super("resource", (values) => ConfigEntity.from(values), storage) {}
}
