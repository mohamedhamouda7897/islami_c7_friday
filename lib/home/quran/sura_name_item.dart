import 'package:flutter/material.dart';
import 'package:islami_c7_friday/my_theme.dart';
import 'package:islami_c7_friday/sura_details/sura_details_screen.dart';

class SuraNameItem extends StatelessWidget {
  String name;
  int index;

  SuraNameItem(this.name, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(name, index));
      },
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(color: MyThemeData.colorBlack),
      ),
    );
  }
}
