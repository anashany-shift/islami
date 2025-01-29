import 'package:flutter/material.dart';
import 'package:islami/modules/layout/screens/hadeth/hadeth_Screen.dart';
import 'package:provider/provider.dart';

import '../../../../core/setting_provider/setting_provider.dart';
import '../../../../core/widgets/bg_widget.dart';

class HadithDtailsView extends StatelessWidget {
  static const String routeName = 'Hadithdetailsview';

  const HadithDtailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    var theme = Theme.of(context);
    var data = (ModalRoute.of(context)?.settings.arguments as HadithData);

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
        margin: const EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 60),
        padding:
            const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 60),
        decoration: BoxDecoration(
          color: provider.isDark()
              ? Color(0xff141A2E).withOpacity(0.8)
              : Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Text(
              data.title,
              style: theme.textTheme.bodyMedium,
            ),
            const Divider(
              thickness: 2,
            ),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        data.bodycontent,
                        textAlign: TextAlign.center,
                        // style: theme.textTheme.bodySmall,
                      ),
                    );
                  },
                  itemCount: 1),
            )
          ],
        ),
      ),
    ));
  }
}
