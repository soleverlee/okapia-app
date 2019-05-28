import 'entity.dart';

class ConfigEntity implements AutoIdEntity{
  int id;
  String name;
  String value;

  ConfigEntity({this.id, this.name, this.value}) {}

  factory ConfigEntity.from(Map<String, dynamic> values) {
    return ConfigEntity(
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
