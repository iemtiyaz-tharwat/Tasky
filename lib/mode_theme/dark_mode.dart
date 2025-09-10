import 'package:flutter/material.dart';
import 'package:tasky/mode_colors/dark_mode_colors.dart';

ThemeData getThemeDataDark() {
  return ThemeData(
    cardColor: Color(0xff282828),
    iconTheme: IconThemeData(color: AppColorDark.fontColor),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorDark.screenColor,

      titleTextStyle: TextStyle(
        color: AppColorDark.fontColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      foregroundColor: AppColorDark.fontColor,
    ),
    scaffoldBackgroundColor: AppColorDark.screenColor,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 28,
        letterSpacing: 0.5,
        color: AppColorDark.fontColor,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColorDark.fontColor,
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
        color: AppColorDark.fontColor,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(AppColorDark.fontColor),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorDark.mainColor,
        foregroundColor: AppColorDark.fontColor,
        textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColorDark.mainColor,
      foregroundColor: AppColorDark.fontColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColorDark.screenColor,
      selectedItemColor: AppColorDark.mainColor,
      unselectedItemColor: Color(0xffC6C6C6),
    ),
  );
}
