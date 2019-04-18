import 'package:flutter/material.dart';

class BasicTheme {
  final ThemeData themeData;
  final Widget widget;

  BasicTheme({@required this.themeData, @required this.widget});

  Theme build() => Theme(data: themeData, child: widget);
}
