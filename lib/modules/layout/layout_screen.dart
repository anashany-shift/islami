//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:islami/modules/layout/screens/Setting/setting_Screen.dart';
// import 'package:islami/modules/layout/screens/hadeth/hadeth_Screen.dart';
// import 'package:islami/modules/layout/screens/quran/quran_Screen.dart';
// import 'package:islami/modules/layout/screens/radio/redio_Screen.dart';
// import 'package:islami/modules/layout/screens/sebha/sebha_screen.dart';
// import 'package:provider/provider.dart';
//
// import '../../core/setting_provider/setting_provider.dart';
// import '../../core/widgets/bg_widget.dart';
//
// class LayoutScreen extends StatefulWidget {
//   static const String routeName = 'Layout';
//
//   LayoutScreen({super.key});
//
//   @override
//   State<LayoutScreen> createState() => _LayoutScreenState();
// }
//
// class _LayoutScreenState extends State<LayoutScreen> {
//   int selectedIndex = 0;
//   PageController _pageController = PageController();
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   List<Widget> screens = [
//     quranScreen(),
//     const hadethSreen(),
//     const sebhaScreen(),
//     const radioScreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<SettingProvider>(context);
//
//     var lang = AppLocalizations.of(context)!;
//     List<String> titles = [
//       lang.quran,
//       lang.hadith,
//       lang.sebha,
//       lang.radio,
//     ];
//     return BgWidget(
//       child: Scaffold(
//         key: _scaffoldKey,
//         // Use GlobalKey to access the scaffold
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           title: Text(
//             titles[selectedIndex],
//             style: TextStyle(
//               color: provider.isDark() ? Colors.white : Colors.black,
//             ),
//           ),
//           leading: IconButton(
//             icon: const Icon(Icons.menu),
//             onPressed: () {
//               _scaffoldKey.currentState
//                   ?.openDrawer(); // Open the drawer using the GlobalKey
//             },
//           ),
//         ),
//         drawer: Drawer(
//           backgroundColor: provider.isDark()
//               ? const Color(0xff141A2E)
//               : const Color(0xffB7935F),
//           child:
//               const settingScreen(), // Add the Settings Screen as Drawer content
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           onTap: (value) {
//             selectedIndex = value;
//             _pageController.animateToPage(
//               selectedIndex,
//               duration: const Duration(milliseconds: 300),
//               curve: Curves.easeInOutSine,
//             );
//             setState(() {});
//           },
//           currentIndex: selectedIndex,
//           items: [
//             BottomNavigationBarItem(
//                 icon:
//                     const ImageIcon(AssetImage('assets/icons/moshaf_gold.png')),
//                 label: lang.quran),
//             BottomNavigationBarItem(
//                 icon: const ImageIcon(
//                     AssetImage('assets/icons/quran-quran-svgrepo-com.png')),
//                 label: lang.hadith),
//             BottomNavigationBarItem(
//                 icon:
//                     const ImageIcon(AssetImage('assets/icons/sebha_blue.png')),
//                 label: lang.sebha),
//             BottomNavigationBarItem(
//                 icon:
//                     const ImageIcon(AssetImage('assets/icons/radio_blue.png')),
//                 label: lang.radio),
//           ],
//         ),
//         body: PageView(
//           controller: _pageController,
//           onPageChanged: (index) {
//             setState(() {
//               selectedIndex = index;
//             });
//           },
//           children: screens,
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/modules/layout/screens/Setting/setting_Screen.dart';
import 'package:islami/modules/layout/screens/hadeth/hadeth_Screen.dart';
import 'package:islami/modules/layout/screens/quran/quran_Screen.dart';
import 'package:islami/modules/layout/screens/radio/redio_Screen.dart';
import 'package:islami/modules/layout/screens/sebha/sebha_screen.dart';
import 'package:provider/provider.dart';

import '../../core/setting_provider/setting_provider.dart';
import '../../core/widgets/bg_widget.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = 'Layout';

  LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;
  PageController _pageController = PageController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> screens = [
    quranScreen(),
    const hadethSreen(),
    const sebhaScreen(),
    const radioScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var lang = AppLocalizations.of(context)!;

    List<String> titles = [
      lang.quran,
      lang.hadith,
      lang.sebha,
      lang.radio,
    ];

    return BgWidget(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            titles[selectedIndex],
            style: TextStyle(
              color: provider.isDark() ? Colors.white : Colors.black,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        drawer: Drawer(
          backgroundColor: provider.isDark()
              ? const Color(0xff141A2E)
              : const Color(0xffB7935F),
          child: const settingScreen(),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            backgroundColor: provider.isDark()
                ? const Color(0xff141A2E)
                : const Color(0xffB7935F),
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
              _pageController.animateToPage(
                selectedIndex,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutSine,
              );
            },
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: const ImageIcon(
                    AssetImage('assets/icons/moshaf_gold.png')),
                label: lang.quran,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                    AssetImage('assets/icons/quran-quran-svgrepo-com.png')),
                label: lang.hadith,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                    AssetImage('assets/icons/sebha_blue.png')),
                label: lang.sebha,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                    AssetImage('assets/icons/radio_blue.png')),
                label: lang.radio,
              ),
            ],
          ),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          children: screens,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

