import 'package:json_annotation/json_annotation.dart';

part 'dev_movie_models.g.dart';

@JsonSerializable()
class DevMovieModel {
  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'year')
  String year;

  DevMovieModel({this.title, this.year});

  factory DevMovieModel.fromJson(Map<String, dynamic> json) =>
      _$DevMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$DevMovieModelToJson(this);
}

@JsonSerializable()
class DevMovieResponseModel {
  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'subjects')
  List<DevMovieModel> subjects;

  DevMovieResponseModel({this.count, this.total, this.subjects});

  factory DevMovieResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DevMovieResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DevMovieResponseModelToJson(this);
}