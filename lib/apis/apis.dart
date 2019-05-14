import 'package:okapia_app/apis/http_api.dart';
import 'package:okapia_app/database/record_db_provider.dart';
import 'package:okapia_app/developer/movie/dev_movie_models.dart';
import 'package:okapia_app/entities/record.dart';
import 'package:okapia_app/models/record_view.dart';

class Apis {
  static RecordDBProvider recordDBProvider = RecordDBProvider();

  static Future<DevMovieResponseModel> apiGetMovies() async {
    var res = await HttpApi.get()
        .getRequest("https://api.douban.com/v2/movie/top250", null);
    var responseModel = DevMovieResponseModel.fromJson(res);
    return responseModel;
  }

  static Future<RecordView> getRecordList() async {
    List<RecordEntity> passwordList =
    await recordDBProvider.getAllRecords();
    return RecordView(
        count: passwordList.length, list: passwordList, isLoaded: true);
  }

  static Future<RecordView> getRecordListByTitle(String title) async {
    List<RecordEntity> passwordList =
    await recordDBProvider.getRecordsByTitle(title);
    return RecordView(
        count: passwordList.length, list: passwordList, isLoaded: true);
  }
}
