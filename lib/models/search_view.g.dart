// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchView _$SearchViewFromJson(Map<String, dynamic> json) {
  return SearchView(
      historyList:
          (json['historyList'] as List)?.map((e) => e as String)?.toList(),
      recordView: json['recordView'] == null
          ? null
          : RecordView.fromJson(json['recordView'] as Map<String, dynamic>));
}

Map<String, dynamic> _$SearchViewToJson(SearchView instance) =>
    <String, dynamic>{
      'historyList': instance.historyList,
      'recordView': instance.recordView
    };
