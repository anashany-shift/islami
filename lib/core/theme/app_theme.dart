import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color lightPrimaryColor = Color(0xffB7935F);
  static const Color lightSecondryColor = Color(0xff242424);
  static const Color darkSecondryColor = Color(0xffF8F8F8);
  static const Color darkPrimaryColor = Color(0xffFACC1D);
  static const TextStyle styleText = TextStyle(
    fontSize: 25,
    color: lightSecondryColor,
  );
  static ThemeData lightTheme = ThemeData(
      fontFamily: GoogleFonts.elMessiri().fontFamily,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.elMessiri(
            fontSize: 30,
            color: const Color(0xff242424),
          )),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xffB7935F),
        selectedItemColor: Color(0xff242424),
        showUnselectedLabels: false,
        unselectedItemColor: Colors.white,

      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontFamily: GoogleFonts.elMessiri().fontFamily,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          fontFamily: GoogleFonts.elMessiri().fontFamily,
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontFamily: GoogleFonts.elMessiri().fontFamily,
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        bodySmall: TextStyle(
          fontFamily: GoogleFonts.elMessiri().fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppTheme.lightPrimaryColor, thickness: 3));

  static ThemeData darkTheme = ThemeData(
      primaryColorDark: darkPrimaryColor,
      fontFamily: GoogleFonts.elMessiri().fontFamily,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.elMessiri(
            fontSize: 30,
            color: const Color(0xff242424),
          )),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff141A2E),
        selectedItemColor: Color(0xffFACC1D),
        showUnselectedLabels: false,
        unselectedItemColor: Colors.white,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontFamily: GoogleFonts.elMessiri().fontFamily,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontFamily: GoogleFonts.elMessiri().fontFamily,
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontFamily: GoogleFonts.elMessiri().fontFamily,
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontFamily: GoogleFonts.elMessiri().fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      dividerTheme:
          const DividerThemeData(color: AppTheme.darkPrimaryColor, thickness: 3));
}
