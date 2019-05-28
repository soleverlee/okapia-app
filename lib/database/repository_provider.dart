import 'package:sqflite/sqflite.dart';

import 'repository.dart';
import 'repository_impl.dart';
import 'storage.dart';
import 'database_storage.dart';

class RepositoryProvider {
  static Storage<Database> storage = DatabaseStorage(dbName: "okapia.db");

  static ResourceRepository getResourceRepository() {
    return ResourceRepositoryImpl(storage);
  }
}
