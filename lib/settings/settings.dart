import 'package:flutter/material.dart';
import 'package:islami_c7_friday/my_theme.dart';
import 'package:islami_c7_friday/providers/my_provider.dart';
import 'package:islami_c7_friday/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'language_bottom_sheet.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Language',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: MyThemeData.colorGold),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                provider.languageCode == 'en' ? 'English' : 'Arabic',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: MyThemeData.colorBlack),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Theme',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: MyThemeData.colorGold),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Light',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: MyThemeData.colorBlack),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ThemeBottomSheet();
        });
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }
}
