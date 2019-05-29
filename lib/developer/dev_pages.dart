import 'package:flutter/material.dart';
import 'package:okapia_app/database/repository_provider.dart';
import 'package:okapia_app/database/storage.dart';
import 'package:okapia_app/routers.dart';
import 'package:sqflite/sqflite.dart';

class NotImplementedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: new Text("Not implemented yet")));
  }
}

class DebugTools extends StatelessWidget {
  final String title;
  final Storage<Database> storage;

  DebugTools({this.title = "Developer Tools"})
      : storage = RepositoryProvider.storage;

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
    storage.destroy();
  }
}
