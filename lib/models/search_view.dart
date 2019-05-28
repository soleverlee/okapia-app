import 'package:json_annotation/json_annotation.dart';
import 'package:okapia_app/models/record_view.dart';

class SearchView {
  List<String> historyList;

  RecordView recordView;

  SearchView({
    this.historyList,
    this.recordView,
  });

  factory SearchView.from(Map<String, dynamic> json) {
    return SearchView(
        historyList:
            (json['historyList'] as List)?.map((e) => e as String)?.toList(),
        recordView: json['recordView'] == null
            ? null
            : RecordView.from(json['recordView'] as Map<String, dynamic>));
  }

  Map<String, dynamic> toMap() {
    return {'historyList': historyList, 'recordView': recordView};
  }
}
