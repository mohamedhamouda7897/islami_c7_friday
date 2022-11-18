import 'package:flutter/material.dart';
import 'package:islami_c7_friday/home/home.dart';
import 'package:islami_c7_friday/my_theme.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.routeName: (context) => HomeScreen()},
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
    );
  }
}
