import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c7_friday/home/quran/sura_name_item.dart';
import 'package:islami_c7_friday/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'hadeth_number_item.dart';

class AhadethScreen extends StatefulWidget {
  @override
  State<AhadethScreen> createState() => _AhadethScreenState();
}

class _AhadethScreenState extends State<AhadethScreen> {
  List<Hadeth> Ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (Ahadeth.isEmpty) {
      LoadHadethFile();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/hadeth_main_bg.png'),
        Divider(
          color: MyThemeData.colorGold,
          thickness: 2,
        ),
        Text(
          AppLocalizations.of(context)!.ahadeth,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(color: MyThemeData.colorBlack),
        ),
        Divider(
          color: MyThemeData.colorGold,
          thickness: 2,
        ),
        Expanded(
          child: Ahadeth.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        color: MyThemeData.colorGold,
                        indent: 30,
                        endIndent: 30,
                      ),
                  itemCount: Ahadeth.length,
                  itemBuilder: (c, index) {
                    return HadethNumberItem(
                        Ahadeth[index].title, Ahadeth[index]);
                  }),
        ),
      ],
    );
  }

  void LoadHadethFile() async {
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> AllAhadeth = content.trim().split('#');

    for (int i = 0; i < AllAhadeth.length; i++) {
      String hadeth = AllAhadeth[i];
      print(hadeth);
      print('Mohamed   ');
      String x = ' mohamed   ';
      String y = x.trim(); // mohamed
      List<String> HadethLines = hadeth.trim().split('\n');

      String title = HadethLines[0];
      print('=========');
      print(title);
      print('=========');
      HadethLines.removeAt(0);
      Hadeth hadethData = Hadeth(title, HadethLines);
      Ahadeth.add(hadethData);
      print(HadethLines);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth(this.title, this.content);
}
