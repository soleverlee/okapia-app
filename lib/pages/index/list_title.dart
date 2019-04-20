import 'package:flutter/material.dart';

class ListTitle extends StatelessWidget {
  final String title;

  ListTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Color.fromRGBO(244, 244, 244, 1)),
      padding: EdgeInsets.only(top: 14.0, bottom: 14.0, left: 20.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 14.0, color: Color.fromRGBO(16, 16, 16, 1)),
      ),
    );
  }
}
