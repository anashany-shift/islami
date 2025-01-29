import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/widgets/bg_widget.dart';
import 'package:islami/modules/layout/screens/quran/quran_Screen.dart';
import 'package:provider/provider.dart';

import '../../../../core/setting_provider/setting_provider.dart';

class QuranDetailsview extends StatefulWidget {
  static const String routeName = 'quranview';

  const QuranDetailsview({super.key});

  @override
  State<QuranDetailsview> createState() => _QuranDetailsviewState();
}

class _QuranDetailsviewState extends State<QuranDetailsview> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var data = ModalRoute.of(context)?.settings.arguments as SuraData;
    var provider = Provider.of<SettingProvider>(context);

    if (versesList.isEmpty) {
      loadQuranData(data.suranumber);
    }

    return BgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: Text('اسلامي',
            style: TextStyle(
              color: provider.isDark() ? Colors.white : Colors.black,
            )),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: provider.isDark() ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 60),
        padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 60),
        decoration: BoxDecoration(
          color: provider.isDark()
              ? Color(0xff141A2E).withOpacity(0.8)
              : Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.suraname,
                  style: theme.textTheme.bodyMedium,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.play_circle_fill_rounded,
                  color: provider.isDark() ? Colors.white : Colors.black,
                ),
              ],
            ),
            Divider(
              thickness: 2,
            ),
            if (versesList.isEmpty) Text("No data loaded"),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "{${index + 1}} ${versesList[index]}",
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                itemCount: versesList.length,
              ),
            )
          ],
        ),
      ),
    ));
  }

  List<String> versesList = [];

  Future<void> loadQuranData(String suranumber) async {
    String content =
        await rootBundle.loadString('assets/files/${suranumber}.txt');
    content.trim();
    versesList = content.split("\n");

    setState(() {});

    print(content);
  }
}
