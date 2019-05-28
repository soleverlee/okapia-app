class ResourceEntity {
  int id;
  String name;
  String value;

  ResourceEntity({this.id, this.name, this.value}) {}

  factory ResourceEntity.fromMap(Map<String, dynamic> values) {
    return ResourceEntity(
        id: values["id"] as int,
        name: values['name'] as String,
        value: values['value'] as String);
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "value": value,
    };
  }
}
