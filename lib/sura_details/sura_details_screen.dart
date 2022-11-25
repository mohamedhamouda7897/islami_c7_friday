import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c7_friday/my_theme.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }

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
          body: verses.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        color: MyThemeData.colorGold,
                        indent: 30,
                        endIndent: 30,
                      ),
                  itemCount: verses.length,
                  itemBuilder: (c, index) {
                    return Text(
                      verses[index],
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: MyThemeData.colorBlack, letterSpacing: .45),
                      textAlign: TextAlign.center,
                    );
                  }),
        ),
      ],
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');

    List<String> lines = content.split('\n');
    print(lines);
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs(this.name, this.index);
}
