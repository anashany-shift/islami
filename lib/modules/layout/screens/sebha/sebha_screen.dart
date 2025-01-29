import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:islami/core/setting_provider/setting_provider.dart';
import 'package:islami/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

class sebhaScreen extends StatefulWidget {
  const sebhaScreen({super.key});

  @override
  State<sebhaScreen> createState() => _sebhaScreenState();
}

class _sebhaScreenState extends State<sebhaScreen> {
  int counter = 0;
  int index = 0;
  double angle = 0;
  List<String> doaa = ['سبحان الله', 'الحمدلله', 'الله واكبر'];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<SettingProvider>(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/head of seb7a.png',
                height: 100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 33.0),
            child: Align(
                alignment: Alignment.center,
                child: GestureDetector(
                    onTap: () {
                      Tasbeh();
                    },
                    child: Transform.rotate(
                        angle: angle,
                        child: Image.asset(
                          'assets/images/body of seb7a.png',
                          scale: 3,
                        )))),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        'عدد التسبيحات',
        style: theme.textTheme.bodyLarge,
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        decoration: BoxDecoration(
            color: provider.isDark()
                ? Color(0xff141A2E).withOpacity(0.57)
                : Color(0xffB7935F).withOpacity(0.57),
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          counter.toString(),
          style: theme.textTheme.bodyLarge,
        ),
      ),
      Bounceable(
        duration: Duration(milliseconds: 200),
        onTap: () {
          Tasbeh();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          decoration: BoxDecoration(
              color: provider.isDark() ? Color(0xffFACC1D) : Color(0xffB7935F),
              borderRadius: BorderRadius.circular(20)),
          child: Text(doaa[index],
              style: TextStyle(
                  color: provider.isDark() ? Colors.black : Colors.white,
                  fontSize: 40)),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
            child: IconButton(onPressed: () {

              setState(() {
                counter=0;
              });
            },
             icon:  Icon(Icons.repeat,size: 40,
               color: provider.isDark()
                   ?AppTheme.darkPrimaryColor
                   :AppTheme.lightPrimaryColor, )
            ),
          ),
        ],
      )
    ]);
  }

  Tasbeh() {
    angle += 15;
    if (counter == 33) {
      counter = 0;
      index++;
      if (index == 3) {
        index = 0;
      }
    } else {
      counter++;
    }
    setState(() {});
  }
}
