import 'package:flutter/material.dart';
import 'package:okapia_app/routers.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(new Duration(seconds: 1), () {
      Routers.gotoHomePage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          child: Image.asset("assets/splash.jpg", fit: BoxFit.cover),
          constraints: BoxConstraints.expand(),
        ),
        Image.asset(
          "assets/title.png",
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
