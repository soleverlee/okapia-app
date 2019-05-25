import 'package:json_annotation/json_annotation.dart';
import 'package:okapia_app/models/record_view.dart';

part 'search_view.g.dart';

@JsonSerializable()
class SearchView {
  @JsonKey(name: "historyList")
  List<String> historyList;

  @JsonKey(name: "recordView")
  RecordView recordView;

  SearchView({
    this.historyList,
    this.recordView,
  });

  factory SearchView.fromJson(Map<String, dynamic> json) =>
      _$SearchViewFromJson(json);

  Map<String, dynamic> toJson() => _$SearchViewToJson(this);
}
