import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:okapia_app/pages/detail/detail_page.dart';
import 'package:okapia_app/pages/home.dart';
import 'package:okapia_app/pages/index/search.dart';
import 'package:okapia_app/pages/new/create_page.dart';

class Routers {
  static var router = Router();

  static void configureRouters() {
    router.define("/develop",
        handler: _generatePageHandle(CreatePage()),
        transitionType: TransitionType.inFromRight);

    router.define("/home",
        handler: _generatePageHandle(HomePage()),
        transitionType: TransitionType.inFromRight);

    router.define("/create",
        handler: _generatePageHandle(CreatePage()),
        transitionType: TransitionType.inFromRight);

    router.define("/detail/:title",
        handler: detailHandler, transitionType: TransitionType.inFromRight);

    router.define("/search",
        handler: _generatePageHandle(IndexSearchPage()),
        transitionType: TransitionType.inFromRight);
  }

  static Handler _generatePageHandle(Widget page) {
    return Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            page);
  }

  static final homeBuilder = (BuildContext context) => HomePage(); //HomePage();
//  static final homeBuilder = (BuildContext context) => HomePage();

  static void gotoInitializePage(BuildContext context) =>
      Navigator.of(context).push(MaterialPageRoute(builder: homeBuilder));
}

var detailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params["title"]?.first;
  return DetailPage(
    title: title,
  );
});
