import 'package:bazar_updated/view/utilz/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(
    primarySwatch: MyColors.navy,
    scaffoldBackgroundColor: const Color(0xffF8F9FA),

    appBarTheme: const  AppBarTheme(
      elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
      backgroundColor:  Color(0xffF8F9FA) ,
        titleTextStyle:  TextStyle(
            fontSize: 18, color: MyColors.primaryTextTextColor,
            fontFamily: 'Avenir Heavy')
    ),
    fontFamily: 'SF_Pro_Display',
    textTheme: const TextTheme(
        headline1: TextStyle( fontSize: 32, fontFamily: 'Avenir Heavy' , color: Color(0xff8F92A1)),
        headline2:  TextStyle(fontSize: 17),
        headline3: TextStyle(fontSize: 16),
        headline4: TextStyle(fontSize: 14),
        headline5: TextStyle(fontSize: 12),
        headline6: TextStyle( fontSize: 16, fontFamily: 'Avenir Roman' , color: MyColors.secondaryTextColor ),

        bodyText1: TextStyle( fontSize: 16, fontFamily: 'Avenir Heavy' , color: MyColors.secondaryTextColor ),
        bodyText2: TextStyle( fontSize: 14, fontFamily: 'Avenir Roman' , color: MyColors.secondaryTextColor ),

        subtitle1: TextStyle( fontSize: 18, fontFamily: 'Avenir Heavy' , color: MyColors.primaryTextTextColor ),
        subtitle2: TextStyle( fontSize: 14, fontFamily: 'Avenir Medium' , color: MyColors.primaryTextTextColor ),

        caption: TextStyle(fontSize: 9.5)),
  );

}