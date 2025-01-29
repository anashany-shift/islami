import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/modules/layout/layout_screen.dart';
import 'package:provider/provider.dart';

import '../../../core/setting_provider/setting_provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'Splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, LayoutScreen.routeName, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Image.asset(provider.getSplashBackgroundImage());
  }
}
