import 'package:flutter/material.dart';

import '../colors.dart';

class TitleBar extends AppBar {
  TitleBar({
    Widget title,
    String titleString,
    Color backgroundColor = PageColors.orange1,
    Widget leading,
    List<Widget> actions,
  }) : super(
          title: title != null
              ? title
              : Text(
                  titleString,
                  style: TextStyle(color: Colors.white),
                ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: backgroundColor,
          leading: leading,
          actions: actions,
        );
}
