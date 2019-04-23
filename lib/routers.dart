import 'package:flutter/material.dart';
import 'package:okapia_app/developer/dev_count.dart';
import 'package:okapia_app/developer/movie/dev_movie_page.dart';
import 'package:okapia_app/pages/detail/detail_page.dart';
import 'package:okapia_app/pages/new/create_page.dart';
import 'package:okapia_app/pages/home.dart';
import 'package:okapia_app/pages/index/search.dart';
import 'package:okapia_app/pages/welcome/welcome_widget.dart';

class Routers {
  static String CREATE = "/create";
  static String DETAIL = "/detail";

  static final homeBuilder = (BuildContext context) => WelcomeWidget();//HomePage();

  static var routerMap = <String, WidgetBuilder>{
    "/develop": (BuildContext context) => DevelopApp(),
    CREATE: (BuildContext context) => CreatePage(),
    DETAIL: (BuildContext context) => DetailPage(),
  };

  static void jumpToDevPage(BuildContext context) =>
      Navigator.of(context).pushNamed("/develop");

  static void jumpToCreatePage(BuildContext context) =>
      Navigator.of(context).pushNamed(CREATE);

  static void jumpToDevMoviePage(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => DevMoviePageContainer()));

  static void jumpToIndexSearchPage(BuildContext context) =>
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => IndexSearchPage()));
}
