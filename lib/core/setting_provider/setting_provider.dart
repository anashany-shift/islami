// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SettingProvider extends ChangeNotifier {
//   String currentLanguage = "en";
//   ThemeMode currentThemeMode = ThemeMode.light;
//
//   SettingProvider() {
//     _loadThemeFromPrefs();
//   }
//
//   void _loadThemeFromPrefs() async {
//     final prefs = await SharedPreferences.getInstance();
//     String? theme = prefs.getString('theme_mode');
//     if (theme == 'light') {
//       currentThemeMode = ThemeMode.light;
//     } else if (theme == 'dark') {
//       currentThemeMode = ThemeMode.dark;
//     }
//     notifyListeners();
//   }
//
//   Future<void> _saveThemeToPrefs() async {
//     final prefs = await SharedPreferences.getInstance();
//     String theme = currentThemeMode == ThemeMode.light ? 'light' : 'dark';
//     await prefs.setString('theme_mode', theme);
//   }
//
//   changeCurrentLanguage(String newLanguage) {
//     if (currentLanguage == newLanguage) {
//       return;
//     }
//     currentLanguage = newLanguage;
//     notifyListeners();
//   }
//
//   changeCurrentTheme(ThemeMode newTheme) {
//     if (currentThemeMode == newTheme) {
//       return;
//     }
//     currentThemeMode = newTheme;
//     _saveThemeToPrefs();
//     notifyListeners();
//   }
//
//   String getBackgroundImage() {
//     return currentThemeMode == ThemeMode.dark
//         ? "assets/images/home_dark_background.png"
//         : "assets/images/bgapp.png";
//   }
//
//   String getSplashBackgroundImage() {
//     return currentThemeMode == ThemeMode.dark
//         ? "assets/images/splashdark.png"
//         : "assets/images/splash.png";
//   }
//
//   String getHeadofsebha() {
//     return currentThemeMode == ThemeMode.dark
//         ? "assets/images/head of seb7a dark.png"
//         : "assets/images/head of seb7a.png";
//   }
//
//   String getbodyofsebha() {
//     return currentThemeMode == ThemeMode.dark
//         ? "assets/images/body of seb7a dark2.png"
//         : "assets/images/body of seb7a.png";
//   }
//
//   bool isDark() {
//     return currentThemeMode == ThemeMode.dark;
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider extends ChangeNotifier {
  String currentLanguage = "en"; // Default language
  ThemeMode currentThemeMode = ThemeMode.light; // Default theme mode

  SettingProvider() {
    _loadSettingsFromPrefs(); // Load saved settings when the provider is initialized
  }

  /// Load theme and language from SharedPreferences
  Future<void> _loadSettingsFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    // Load theme mode
    String? theme = prefs.getString('theme_mode');
    if (theme == 'light') {
      currentThemeMode = ThemeMode.light;
    } else if (theme == 'dark') {
      currentThemeMode = ThemeMode.dark;
    }

    // Load language
    String? language = prefs.getString('language');
    if (language != null) {
      currentLanguage = language;
    }

    notifyListeners(); // Notify UI of changes
  }

  /// Save theme mode to SharedPreferences
  Future<void> _saveThemeToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    String theme = currentThemeMode == ThemeMode.light ? 'light' : 'dark';
    await prefs.setString('theme_mode', theme);
  }

  /// Save language to SharedPreferences
  Future<void> _saveLanguageToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', currentLanguage);
  }

  /// Change the current theme mode
  void changeCurrentTheme(ThemeMode newTheme) {
    if (currentThemeMode == newTheme) return; // Avoid unnecessary updates
    currentThemeMode = newTheme;
    _saveThemeToPrefs(); // Save the updated theme mode
    notifyListeners(); // Notify UI
  }

  /// Change the current language
  void changeCurrentLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return; // Avoid unnecessary updates
    currentLanguage = newLanguage;
    _saveLanguageToPrefs(); // Save the updated language
    notifyListeners(); // Notify UI
  }

  /// Check if the current theme mode is dark
  bool isDark() {
    return currentThemeMode == ThemeMode.dark;
  }

  /// Get the appropriate background image based on the theme
  String getBackgroundImage() {
    return isDark()
        ? "assets/images/home_dark_background.png"
        : "assets/images/bgapp.png";
  }

  /// Get the appropriate splash screen background based on the theme
  String getSplashBackgroundImage() {
    return isDark()
        ? "assets/images/splashdark.png"
        : "assets/images/splash.png";
  }

  /// Get the appropriate header image for sebha based on the theme
  String getHeadofsebha() {
    return isDark()
        ? "assets/images/head of seb7a dark.png"
        : "assets/images/head of seb7a.png";
  }

  /// Get the appropriate body image for sebha based on the theme
  String getbodyofsebha() {
    return isDark()
        ? "assets/images/body of seb7a dark2.png"
        : "assets/images/body of seb7a.png";
  }
}
