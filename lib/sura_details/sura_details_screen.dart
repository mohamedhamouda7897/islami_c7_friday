import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c7_friday/my_theme.dart';
import 'package:provider/provider.dart';

import '../providers/sura_provider.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = 'sura_details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;

    return ChangeNotifierProvider(
      create: (context) => SuraProvider()..loadFile(args.index),
      builder: (context, child) {
        var pro = Provider.of<SuraProvider>(context);
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
                  args.name,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              body: pro.verses.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                            color: MyThemeData.colorGold,
                            indent: 30,
                            endIndent: 30,
                          ),
                      itemCount: pro.verses.length,
                      itemBuilder: (c, index) {
                        return Text(
                          pro.verses[index],
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  color: MyThemeData.colorBlack,
                                  letterSpacing: .45),
                          textAlign: TextAlign.center,
                        );
                      }),
            ),
          ],
        );
      },
    );
  }


}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs(this.name, this.index);
}
