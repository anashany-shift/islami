import 'package:flutter/material.dart';
import 'package:islami/modules/layout/screens/quran/quran_Screen.dart';

class suratitlewidget extends StatelessWidget {
  final SuraData data;

  suratitlewidget(
      {super.key,
      required this.data,
    required String suraname,
    required String suranumber,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            data.suranumber,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
        ),
        SizedBox(
          height: 40,
          child: VerticalDivider(
            color: theme.dividerTheme.color,
            thickness: 3,
          ),
        ),
        Expanded(
          child: Text(
            data.suraname,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

