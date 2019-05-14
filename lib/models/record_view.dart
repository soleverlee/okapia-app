import 'package:json_annotation/json_annotation.dart';
import 'package:okapia_app/entities/record.dart';

part 'package:okapia_app/models/record_view.g.dart';

@JsonSerializable()
class RecordView {
  @JsonKey(name: "count")
  int count;

  @JsonKey(name: "list")
  List<RecordEntity> list;

  @JsonKey(name: "isLoaded")
  bool isLoaded;

  RecordView({this.count, this.list, this.isLoaded});

  factory RecordView.fromJson(Map<String, dynamic> json) =>
      _$RecordViewFromJson(json);

  Map<String, dynamic> toJson() => _$RecordViewToJson(this);
}
