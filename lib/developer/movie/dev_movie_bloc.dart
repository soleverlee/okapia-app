import 'package:okapia_app/apis/apis.dart';
import 'package:okapia_app/developer/movie/dev_movie_models.dart';
import 'package:rxdart/rxdart.dart';

import 'package:okapia_app/base/base_bloc.dart';

class DevMovieBloc extends BaseBloc {
  BehaviorSubject<DevMovieResponseModel> moviesController = BehaviorSubject();

  DevMovieBloc() {
    moviesController.value =
        DevMovieResponseModel(count: 0, total: 0, subjects: List());
  }

  void doQuery() async {
    try {
      var response = await Apis.apiGetMovies();
      moviesController.value = response;
    } catch (e) {
      //TODO:
    }
  }

  @override
  void dispose() {
    moviesController.close();
  }
}
