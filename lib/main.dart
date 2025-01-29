import 'package:flutter/material.dart';
import 'package:islami/core/setting_provider/setting_provider.dart';
import 'package:islami/core/theme/app_theme.dart';
import 'package:islami/modules/layout/layout_screen.dart';
import 'package:islami/modules/layout/screens/hadeth/Hadith_dtails_view.dart';
import 'package:islami/modules/layout/screens/quran/quran_details_view.dart';
import 'package:islami/modules/splash/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



void main() => runApp(ChangeNotifierProvider(
    create: (context) => SettingProvider(), child: const Myapp()));

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: provider.currentThemeMode,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.currentLanguage),
      routes: {
        LayoutScreen.routeName: (context) => LayoutScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        QuranDetailsview.routeName: (_) => const QuranDetailsview(),
        HadithDtailsView.routeName: (context) => const HadithDtailsView(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
