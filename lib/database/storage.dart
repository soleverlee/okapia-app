abstract class Storage<T> {
  Future<bool> isInitialized();

  Future<bool> initialize();

  Future<T> getStorageInstance();
}
