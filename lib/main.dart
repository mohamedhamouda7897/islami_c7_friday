import 'package:flutter/material.dart';
import 'package:islami_c7_friday/home/home.dart';
import 'package:islami_c7_friday/my_theme.dart';
import 'package:islami_c7_friday/sura_details/sura_details_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'hadeth_details/hadth_deatils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ar')],
      locale: Locale('ar'),
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetails.routeName: (c) => HadethDetails()
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
