import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../setting_provider/setting_provider.dart';

class BgWidget extends StatelessWidget {
  Widget child;

  BgWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            provider.getBackgroundImage(),
          ),
          fit: BoxFit.cover,
        )),
        child: child);
  }
}
