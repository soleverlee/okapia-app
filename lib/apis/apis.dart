import 'dart:convert';

import 'package:okapia_app/apis/http_api.dart';
import 'package:okapia_app/developer/movie/dev_movie_models.dart';


class Apis {
  static Future<DevMovieResponseModel> apiGetMovies() async {
    var res = await HttpApi.get().getRequest("https://api.douban.com/v2/movie/top250", null);
    var responseModel = DevMovieResponseModel.fromJson(res);
    return responseModel;
  }
}
