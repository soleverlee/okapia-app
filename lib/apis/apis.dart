import 'package:okapia_app/apis/http_api.dart';
import 'package:okapia_app/application.dart';
import 'package:okapia_app/developer/movie/dev_movie_models.dart';
import 'package:okapia_app/entities/password.dart';
import 'package:okapia_app/models/passwords.dart';

class Apis {
  static Future<DevMovieResponseModel> apiGetMovies() async {
    var res = await HttpApi.get()
        .getRequest("https://api.douban.com/v2/movie/top250", null);
    var responseModel = DevMovieResponseModel.fromJson(res);
    return responseModel;
  }

  static Future<Passwords> getPasswordList() async {
    List<Password> passwordList =
    await Application.passwordDBProvider.getAllPasswords();
    return Passwords(
        count: passwordList.length, list: passwordList, isLoaded: true);
  }

  static Future<Passwords> getPasswordListByTitle(String title) async {
    List<Password> passwordList =
    await Application.passwordDBProvider.getPasswordsByTitle(title);
    return Passwords(
        count: passwordList.length, list: passwordList, isLoaded: true);
  }
}
