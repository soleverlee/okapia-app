// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordView _$RecordViewFromJson(Map<String, dynamic> json) {
  return RecordView(
      count: json['count'] as int,
      list: (json['list'] as List)
          ?.map((e) =>
      e == null ? null : RecordEntity.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      isLoaded: json['isLoaded'] as bool);
}

Map<String, dynamic> _$RecordViewToJson(RecordView instance) =>
    <String, dynamic>{
      'count': instance.count,
      'list': instance.list,
      'isLoaded': instance.isLoaded
    };
