import 'package:flutter/material.dart';
import 'package:okapia_app/developer/dev_count.dart';
import 'package:okapia_app/developer/movie/dev_movie_page.dart';
import 'package:okapia_app/pages/home.dart';

class Routers {
  static final homeBuilder = (BuildContext context) => HomePage();

  static var routerMap = <String, WidgetBuilder>{
    "/develop": (BuildContext context) => DevelopApp()
  };

  static void jumpToDevPage(BuildContext context) =>
      Navigator.of(context).pushNamed("/develop");

  static void jumpToDevMoviePage(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => DevMoviePageContainer()));
}
