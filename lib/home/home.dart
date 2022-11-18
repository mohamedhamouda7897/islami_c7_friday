import 'package:flutter/material.dart';
import 'package:islami_c7_friday/home/hadeth/ahadeth_screen.dart';
import 'package:islami_c7_friday/home/quran/quran_screen.dart';
import 'package:islami_c7_friday/home/radio/radio_screen.dart';
import 'package:islami_c7_friday/home/sebha/sebha_screen.dart';
import 'package:islami_c7_friday/my_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/main_bg.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Islami',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items: [
              bottomItem('quran', 'Quran'),
              bottomItem('sebha', 'Sebha'),
              bottomItem('radio', 'Radio'),
              bottomItem('hadeth', 'Ahadeth'),
            ],
          ),
          body: tabs[currentIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranScreen(),
    SebhaScreen(),
    RadioScreen(),
    AhadethScreen()
  ];

  BottomNavigationBarItem bottomItem(String ImageName, String label) =>
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/$ImageName.png'), size: 30),
          label: '$label',
          backgroundColor: MyThemeData.colorGold);
}
