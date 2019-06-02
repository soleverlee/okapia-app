import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:okapia_app/pages/detail/detail_page.dart';
import 'package:okapia_app/pages/home.dart';
import 'package:okapia_app/pages/index/search.dart';
import 'package:okapia_app/pages/new/create_page.dart';
import 'package:okapia_app/pages/splash/splash.dart';

import 'pages/welcome/welcome_widget.dart';

class Routers {
  static var router = Router();

  static void configureRouters() {
    router.define("/develop",
        handler: _generatePageHandle(CreatePage()),
        transitionType: TransitionType.inFromRight);

    router.define("/initialize",
        handler: _generatePageHandle(WelcomeWidget()),
        transitionType: TransitionType.inFromRight);

    router.define("/home",
        handler: _generatePageHandle(HomePage()),
        transitionType: TransitionType.inFromRight);

    router.define("/create",
        handler: _generatePageHandle(CreatePage()),
        transitionType: TransitionType.inFromRight);

    router.define("/detail/:title/:id",
        handler: detailHandler, transitionType: TransitionType.inFromRight);

    router.define("/search",
        handler: _generatePageHandle(IndexSearchPageContainer()),
        transitionType: TransitionType.inFromRight);
  }

  static Handler _generatePageHandle(Widget page) {
    return Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            page);
  }

  static final homeBuilder = (BuildContext context) => SplashPage();

  static void gotoInitializePage(BuildContext context) => Navigator.of(context)
      .pushNamedAndRemoveUntil("/initialize", (Route<dynamic> route) => false);

  static void gotoHomePage(BuildContext context) => Navigator.of(context)
      .pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
}

var detailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params["title"]?.first;
  String id = params["id"]?.first;
  return DetailPage(
    title: title,
    id: id,
  );
});
