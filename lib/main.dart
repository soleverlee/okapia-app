import 'package:flutter/material.dart';
import 'package:okapia_app/base/app_bloc.dart';
import 'package:okapia_app/base/bloc_base.dart';
import 'package:okapia_app/routers.dart';

void main() => runApp(MainApp());

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  AppBloc _appBloc;

  @override
  void initState() {
    super.initState();
    _appBloc = AppBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
        bloc: _appBloc,
        child: Container(
          child: MaterialApp(
            title: "Okapia",
            home: Routers.homeBuilder(context),
            routes: Routers.routerMap,
          ),
        ));
  }
}
