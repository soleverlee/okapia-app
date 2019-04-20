import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;

  ListItem({@required this.title, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Color.fromRGBO(213, 213, 213, 1)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            IconButton(
              icon: Icon(Icons.navigate_next),
              color: Color.fromRGBO(211, 211, 211, 1),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
