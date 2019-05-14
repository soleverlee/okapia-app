// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordEntity _$RecordEntityFromJson(Map<String, dynamic> json) {
  return RecordEntity(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String);
}

Map<String, dynamic> _$RecordEntityToJson(RecordEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content
    };
