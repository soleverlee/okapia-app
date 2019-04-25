import 'package:flutter/material.dart';

class TitleBar extends AppBar {
  TitleBar(
      {Widget title,
      Color backgroundColor = Colors.white,
      Widget leading,
      List<Widget> actions})
      : super(
            title: title,
            centerTitle: true,
            elevation: 0,
            backgroundColor: backgroundColor,
            leading: leading,
            actions: actions);
}
