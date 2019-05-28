import 'package:json_annotation/json_annotation.dart';
import 'package:okapia_app/entities/record.dart';

class RecordView {
  int count;

  List<RecordEntity> list;

  bool isLoaded;

  RecordView({this.count, this.list, this.isLoaded});

  factory RecordView.from(Map<String, dynamic> values) {
    return RecordView(
        count: values['count'] as int,
        list: (values['list'] as List)
            ?.map((e) =>
                e == null ? null : RecordEntity.from(e as Map<String, dynamic>))
            ?.toList(),
        isLoaded: values['isLoaded'] as bool);
  }

  Map<String, dynamic> toMap() {
    return {'count': count, 'list': list, 'isLoaded': isLoaded};
  }
}
