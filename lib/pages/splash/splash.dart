import 'package:flutter/material.dart';
import 'package:okapia_app/blocs/initializing_bloc.dart';
import 'package:okapia_app/routers.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  InitializingBloc initializingBloc = InitializingBloc();

  static const int defaultWaitTime = 2000;

  @override
  void initState() {
    super.initState();
    Stopwatch stopwatch = new Stopwatch()..start();
    initializingBloc.checkIsStorageInitialized().then((initialized) {
      final elapsed = stopwatch.elapsedMilliseconds;
      int waitTime;
      if (elapsed < defaultWaitTime) {
        waitTime = defaultWaitTime - elapsed;
      }
      Future.delayed(Duration(milliseconds: waitTime > 0 ? waitTime : 0), () {
        if (initialized) {
          Routers.gotoHomePage(context);
        } else {
          Routers.gotoInitializePage(context);
        }
      });
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
