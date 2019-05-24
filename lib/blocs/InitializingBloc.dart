import 'package:okapia_app/base/base_bloc.dart';
import 'package:okapia_app/database/database_storage.dart';
import 'package:okapia_app/database/storage.dart';

class InitializingBloc extends BaseBloc {
  Storage storage;

  InitializingBloc() {
    storage = DatabaseStorage(dbName: "okapia.db");
  }

  Future<bool> checkIsStorageInitialized() async {
    return storage.isInitialized();
  }

  @override
  void dispose() {}
}
