import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/core/setting_provider/setting_provider.dart';
import 'package:provider/provider.dart';

class settingScreen extends StatefulWidget {
  const settingScreen({super.key});

  @override
  State<settingScreen> createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context)!;
    var provider = Provider.of<SettingProvider>(context);
    List<String> language = ["English", "عربي"];
    List<String> themes = [ lang.light, lang.dark];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lang.language,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomDropdown<String>(
            hintText: 'Select job role',
            items: language,
            initialItem:
                provider.currentLanguage == "en" ? language[0] : language[1],
            onChanged: (value) {
              if (value == 'English') {
                provider.changeCurrentLanguage('en');
              }
              if (value == 'عربي') {
                provider.changeCurrentLanguage('ar');
              }
              log('changing value to: $value');
            },
            decoration: CustomDropdownDecoration(
              closedFillColor:
                  provider.isDark() ? const Color(0xff33416e) : Colors.white,
              closedSuffixIcon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color:
                    provider.isDark() ? theme.primaryColorDark : Colors.black,
              ),
              expandedFillColor:
                  provider.isDark() ? const Color(0xff33416e) : Colors.white,
              expandedSuffixIcon: Icon(
                Icons.keyboard_arrow_up_rounded,
                color:
                    provider.isDark() ? theme.primaryColorDark : Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            lang.theme_mode,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomDropdown<String>(
            hintText: 'Select job role',
            items: themes,
            initialItem: provider.currentThemeMode == ThemeMode.light
                ? themes[0]
                : themes[1],
            onChanged: (value) {
              if (value == lang.light) {
                provider.changeCurrentTheme(ThemeMode.light);
              }
              if (value == lang.dark) {
                provider.changeCurrentTheme(ThemeMode.dark);
              }
              log('changing value to: $value');
            },
            decoration: CustomDropdownDecoration(
              closedFillColor:
                  provider.isDark() ? const Color(0xff33416e) : Colors.white,
              closedSuffixIcon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color:
                    provider.isDark() ? theme.primaryColorDark : Colors.black,
              ),
              expandedFillColor:
                  provider.isDark() ? const Color(0xff33416e) : Colors.white,
              expandedSuffixIcon: Icon(
                Icons.keyboard_arrow_up_rounded,
                color:
                    provider.isDark() ? theme.primaryColorDark : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
