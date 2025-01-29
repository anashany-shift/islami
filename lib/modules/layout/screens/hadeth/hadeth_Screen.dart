import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:islami/modules/layout/screens/hadeth/Hadith_dtails_view.dart';

class hadethSreen extends StatefulWidget {
  const hadethSreen({super.key});

  @override
  State<hadethSreen> createState() => _hadethSreenState();
}

class _hadethSreenState extends State<hadethSreen> {
  List<HadithData> hadithDataList = [];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    if (hadithDataList.isEmpty) loadhadithdata();
    return Column(
      children: [
        Image.asset(
          'assets/images/hadith_logo.png',
          scale: 3,
        ),
        Divider(
          thickness: 3,
          color: theme.dividerTheme.color,
        ),
        Text(
          'الاحاديث',
          style: theme.textTheme.bodyLarge,
        ),
        Divider(
          thickness: 3,
          color: theme.dividerTheme.color,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 2,
              color: theme.dividerTheme.color,
              indent: 50,
              endIndent: 50,
            ),
            itemBuilder: (context, index) {
              return Bounceable(
                duration: Duration(seconds: 2),
                onTap: () {
                  Navigator.pushNamed(context, HadithDtailsView.routeName,
                      arguments: hadithDataList[index]);
                },
                child: Text(
                  hadithDataList[index].title,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(height: 1.8),
                ),
              );
            },
            itemCount: hadithDataList.length,
          ),
        )
      ],
    );
  }

  Future<void> loadhadithdata() async {
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadithdatalist = content.split('#');
    for (int i = 0; i < hadithdatalist.length; i++) {
      // print(hadithdatalist[i]);
      //separate tittle and content
      String singlehadithdata = hadithdatalist[i].trim();

      int indexlength = singlehadithdata.indexOf('\n');
      String title = singlehadithdata.substring(0, indexlength);
      String bodycontent = singlehadithdata.substring(indexlength + 1);
      HadithData hadithdata =
          HadithData(title: title, bodycontent: bodycontent);
      hadithDataList.add(hadithdata);
      setState(() {});
    }
  }
}

class HadithData {
  final String title;
  final String bodycontent;

  HadithData({required this.title, required this.bodycontent});
}
