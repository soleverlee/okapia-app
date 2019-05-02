import 'package:flutter/material.dart';
import 'package:okapia_app/pages/colors.dart';

class Themes {
  static ThemeData appBarTheme = ThemeData(
    primaryColor: Colors.white,
//    accentColor: Colors.red,
//
//    // Define the default Font Family
//    fontFamily: 'Montserrat',
//
//    // Define the default TextTheme. Use this to specify the default
//    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );

  static TextTheme appBarTextTheme = TextTheme(
      title: TextStyle(fontSize: 16.0, color: Colors.black));

  static ThemeData Function(BuildContext context)
      buildBottomNavigationBarTheme = (BuildContext context) =>
          Theme.of(context).copyWith(
              canvasColor: Color(0xCCF7F7F7),
              primaryColor: PageColors.orange1,
              textTheme: TextTheme(
                  caption: TextStyle(color: Color.fromRGBO(170, 170, 170, 1))));
}
