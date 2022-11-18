import 'package:flutter/material.dart';

class MyThemeData {
  static Color colorBlack = Color.fromRGBO(36, 36, 36, 1.0);
  static Color colorGold = Color.fromRGBO(183, 147, 95, 1.0);
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: colorGold,
          selectedItemColor: colorBlack,
          unselectedItemColor: Colors.white),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: colorBlack)));

  static ThemeData darkTheme =
      ThemeData(scaffoldBackgroundColor: Colors.transparent);
}
