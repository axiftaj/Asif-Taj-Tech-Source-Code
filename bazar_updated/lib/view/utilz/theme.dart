import 'package:flutter/material.dart';

class Theme {

  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
            fontSize: 18, color: Colors.black87, fontWeight: FontWeight.bold)),
    fontFamily: 'SF_Pro_Display',
    textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 38, fontWeight: FontWeight.bold),
        subtitle2: TextStyle(fontSize: 15, color:Colors.red ),
        headline2:  TextStyle(fontSize: 17),
        headline3: TextStyle(fontSize: 16),
        headline4: TextStyle(fontSize: 14),
        headline5: TextStyle(fontSize: 12),
        headline6: TextStyle(fontSize: 10),
        caption: TextStyle(fontSize: 9.5)),
  );

}