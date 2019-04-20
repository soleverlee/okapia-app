import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final EdgeInsetsGeometry padding;

  LinkButton(
      {@required this.title, @required this.onTap, @required this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: padding,
        child: Text(
          title,
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: Color.fromRGBO(35, 146, 255, 1)),
        ),
      ),
      onTap: onTap,
    );
  }
}
