import 'package:json_annotation/json_annotation.dart';

part 'constant.g.dart';

@JsonSerializable()
class Constant {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "value")
  String value;

  Constant({this.id, this.name, this.value});

  factory Constant.fromJson(Map<String, dynamic> json) =>
      _$ConstantFromJson(json);

  Map<String, dynamic> toJson() => _$ConstantToJson(this);
}
