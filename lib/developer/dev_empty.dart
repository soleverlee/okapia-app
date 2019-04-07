import 'package:flutter/material.dart';

class DevEmpty extends StatelessWidget {
  final String title;

  DevEmpty({this.title = "Dev Empty"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text("Demo widget")),
    );
  }
}