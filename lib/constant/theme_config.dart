import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      buttonColor: Colors.black,
      primaryColor: Colors.white,
      accentColor: Colors.black,
      //buttonColor: Colors.black,
      //textSelectionColor: Colors.black12,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          brightness: Brightness.light,
          elevation: 0),
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.black),
        headline3: TextStyle(color: Colors.black),
        headline4: TextStyle(color: Colors.black),
        headline5: TextStyle(color: Colors.black),
        headline6: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
        caption: TextStyle(color: Colors.black),
        subtitle1: TextStyle(color: Colors.black),
        subtitle2: TextStyle(color: Colors.black),
        overline: TextStyle(color: Colors.black),
      ));


  static final dark = ThemeData.dark().copyWith(
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      buttonColor: Colors.white10,
      primaryColor: Colors.white10,
      accentColor: Colors.white,
      //cursorColor: Colors.white,
      //textSelectionColor: Colors.white60,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
          color: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          brightness: Brightness.dark,
          elevation: 0),
      iconTheme: IconThemeData(color: Colors.white60),
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white),
        headline4: TextStyle(color: Colors.white),
        headline5: TextStyle(color: Colors.white),
        headline6: TextStyle(color: Colors.white),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
        caption: TextStyle(color: Colors.white),
        subtitle1: TextStyle(color: Colors.white),
        subtitle2: TextStyle(color: Colors.white),
        overline: TextStyle(color: Colors.white),
      ));
}
