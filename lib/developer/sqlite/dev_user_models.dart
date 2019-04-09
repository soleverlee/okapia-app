import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'phone')
  String phone;

  User({this.id, this.name, this.phone});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "phone": phone,
  };

  static fromMap(Map<String, dynamic> user) => User(
    id: user["id"],
    name: user["name"],
    phone: user["phone"],
  );
}