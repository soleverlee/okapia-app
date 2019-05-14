import 'package:json_annotation/json_annotation.dart';

part 'record.g.dart';

@JsonSerializable()
class RecordEntity {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "content")
  String content;

  RecordEntity({this.id, this.title, this.content});

  factory RecordEntity.fromJson(Map<String, dynamic> json) =>
      _$RecordEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RecordEntityToJson(this);
}
