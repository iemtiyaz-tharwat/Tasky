import 'package:flutter/material.dart';
import 'package:tasky/mode_colors/light_mode_colors.dart';

ThemeData lightModeTheme() {
  return ThemeData(
    cardColor: Colors.white,
    primaryColor: Colors.white,
    iconTheme: IconThemeData(color: AppColorLight.fontColor),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorLight.screenColor,
      iconTheme: IconThemeData(color: AppColorLight.fontColor),
      titleTextStyle: TextStyle(
        color: AppColorLight.fontColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      foregroundColor: AppColorLight.fontColor,
    ),
    scaffoldBackgroundColor: AppColorLight.screenColor,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 28,
        letterSpacing: 0.5,
        color: AppColorLight.fontColor,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColorLight.fontColor,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xffC6C6C6),
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        letterSpacing: 0.5,
        color: AppColorLight.fontColor,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorLight.mainColor,
        foregroundColor: AppColorLight.fontColor,
        textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        minimumSize: Size.fromHeight(56),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColorLight.mainColor,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColorLight.screenColor,
      selectedItemColor: AppColorLight.mainColor,
      unselectedItemColor: Color(0xffC6C6C6),
    ),
  );
}
