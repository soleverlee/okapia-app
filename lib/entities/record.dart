import 'entity.dart';

class RecordEntity implements AutoIdEntity {
  int id;

  String title;

  String content;

  RecordEntity({this.id, this.title, this.content});

  factory RecordEntity.from(Map<String, dynamic> values) {
    return RecordEntity(
        id: values["id"] as int,
        title: values['title'] as String,
        content: values['content'] as String);
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "content": content,
    };
  }
}
