import 'package:flutter/material.dart';
import 'package:islami_c7_friday/home/hadeth/ahadeth_screen.dart';
import 'package:islami_c7_friday/my_theme.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'hadethDetails';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Stack(children: [
      Image.asset(
        'assets/images/main_bg.png',
        width: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            args.title,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: ListView.separated(
            separatorBuilder: (c, index) => Divider(
                  color: MyThemeData.colorGold,
                ),
            itemCount: args.content.length,
            itemBuilder: (c, index) {
              return Text(
                args.content[index],
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: MyThemeData.colorBlack),
                textAlign: TextAlign.center,
              );
            }),
      )
    ]);
  }
}
