abstract class Storage<T> {
  Future<bool> isInitialized();

  Future<bool> initialize();

  Future<bool> destroy();

  Future<T> getStorageInstance();
}
