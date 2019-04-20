import 'package:flutter/material.dart';
import 'package:okapia_app/routers.dart';

class DevPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dev menus")),
      body: Center(
          child: Column(
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Routers.jumpToDevMoviePage(context);
              },
              child: Text("Jump movie list")),
        ],
      )),
    );
  }
}

class DevEmpty extends StatelessWidget {
  final String title;

  DevEmpty({this.title = "Dev Empty"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true,),
      body: Center(child: Text("Demo widget")),
    );
  }
}
