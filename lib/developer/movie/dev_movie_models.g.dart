// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dev_movie_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DevMovieModel _$DevMovieModelFromJson(Map<String, dynamic> json) {
  return DevMovieModel(
      title: json['title'] as String, year: json['year'] as String);
}

Map<String, dynamic> _$DevMovieModelToJson(DevMovieModel instance) =>
    <String, dynamic>{'title': instance.title, 'year': instance.year};

DevMovieResponseModel _$DevMovieResponseModelFromJson(
    Map<String, dynamic> json) {
  return DevMovieResponseModel(
      count: json['count'] as int,
      total: json['total'] as int,
      subjects: (json['subjects'] as List)
          ?.map((e) => e == null
              ? null
              : DevMovieModel.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DevMovieResponseModelToJson(
        DevMovieResponseModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'total': instance.total,
      'subjects': instance.subjects
    };
