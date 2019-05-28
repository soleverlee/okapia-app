abstract class Entity<T, A extends Entity<T, A>> {
  String getTable();

  T getId();

  Map<String, dynamic> toMap();

  A fromMap(Map<String, dynamic> values);
}
