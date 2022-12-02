import 'package:flutter/material.dart';
import 'package:islami_c7_friday/home/hadeth/ahadeth_screen.dart';
import 'package:islami_c7_friday/home/quran/quran_screen.dart';
import 'package:islami_c7_friday/home/radio/radio_screen.dart';
import 'package:islami_c7_friday/home/sebha/sebha_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c7_friday/providers/my_provider.dart';
import 'package:islami_c7_friday/settings/settings.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.getBackground(),
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.islami,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
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
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              )
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
    AhadethScreen(),
    SettingsScreen()
  ];

  BottomNavigationBarItem bottomItem(String ImageName, String label) =>
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/images/$ImageName.png'), size: 30),
        label: '$label',
      );
}
