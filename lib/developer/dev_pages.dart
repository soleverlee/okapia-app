import 'dart:io';

import 'package:flutter/material.dart';
import 'package:okapia_app/database/databases.dart';
import 'package:okapia_app/routers.dart';

class NotImplementedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: new Text("Not implemented yet")));
  }
}

class DebugTools extends StatelessWidget {
  final String title;

  DebugTools({this.title = "Developer Tools"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
          child: new Column(
        children: <Widget>[
          new Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: const Text('Re-initialize'),
                onPressed: () => _onReInitialize(context),
              ),
            )
          ]),
          new Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: const Text('Delete db'),
                onPressed: _onDeleteDb,
              ),
            )
          ])
        ],
      )),
    );
  }

  void _onReInitialize(BuildContext context) async {
    Routers.gotoInitializePage(context);
  }

  void _onDeleteDb() async {
    final String path = await DatabaseClient.getDatabasePath();
    print('Removing file:' + path);
    final File file = new File(path);
    if (await file.exists()) await file.delete();
    print('Deleted.');
    await DatabaseClient.initDb();
  }
}
