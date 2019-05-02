import 'package:flutter/material.dart';
import 'package:okapia_app/pages/colors.dart';

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
          color: PageColors.white,
          border: Border(
            bottom: BorderSide(color: PageColors.grey2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Icon(
                    Icons.streetview,
                    size: 24.0,
                    color: PageColors.orange1,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.navigate_next),
              color: PageColors.grey3,
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
