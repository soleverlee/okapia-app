import 'package:json_annotation/json_annotation.dart';

part 'dev_user_models.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'phone')
  String phone;

  User({this.id, this.name, this.phone});

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}