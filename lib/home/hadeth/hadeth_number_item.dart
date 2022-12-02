import 'package:flutter/material.dart';
import 'package:islami_c7_friday/hadeth_details/hadth_deatils.dart';
import 'package:islami_c7_friday/my_theme.dart';

import 'ahadeth_screen.dart';

class HadethNumberItem extends StatelessWidget {
  String name;
  Hadeth hadeth;

  HadethNumberItem(this.name, this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetails.routeName,
            arguments: hadeth);
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
