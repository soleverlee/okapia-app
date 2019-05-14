import 'package:json_annotation/json_annotation.dart';
import 'package:okapia_app/entities/password.dart';

part 'package:okapia_app/models/passwords.g.dart';

@JsonSerializable()
class Passwords {
  @JsonKey(name: "count")
  int count;

  @JsonKey(name: "list")
  List<Password> list;

  @JsonKey(name: "isLoaded")
  bool isLoaded;

  Passwords({this.count, this.list, this.isLoaded});

  factory Passwords.fromJson(Map<String, dynamic> json) =>
      _$PasswordsFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordsToJson(this);
}
