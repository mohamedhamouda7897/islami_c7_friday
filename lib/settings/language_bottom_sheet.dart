import 'package:flutter/material.dart';
import 'package:islami_c7_friday/my_theme.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage('en');
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'English',
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(
                        color: provider.languageCode == 'en'
                            ? MyThemeData.colorGold
                            : MyThemeData.colorBlack),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: provider.languageCode == 'en'
                        ? MyThemeData.colorGold
                        : MyThemeData.colorBlack,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage('ar');
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Arabic',
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(
                        color: provider.languageCode == 'ar'
                            ? MyThemeData.colorGold
                            : MyThemeData.colorBlack),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: provider.languageCode == 'ar'
                        ? MyThemeData.colorGold
                        : MyThemeData.colorBlack,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
