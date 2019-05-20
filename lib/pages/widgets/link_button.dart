import 'package:flutter/material.dart';
import 'package:okapia_app/pages/colors.dart';

class LinkButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final EdgeInsetsGeometry padding;

  LinkButton({
    @required this.title,
    @required this.onTap,
    @required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: padding,
        child: Text(
          title,
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: PageColors.orange1,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
