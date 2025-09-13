import 'package:flutter/material.dart';
import 'package:tasky/mode_colors/light_mode_colors.dart';

ThemeData lightModeTheme() {
  return ThemeData(
    cardColor: Color(0xff9E9E9E),
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AppColorLight.ColorFilter,
      onPrimary: AppColorLight.arrowColor,
      secondaryContainer: AppColorLight.containerColor,
      onSecondaryContainer: AppColorLight.containerBorder,
      surface: AppColorLight.cursorColor,
      
    ),
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
        fontSize: 24,
        letterSpacing: 0.5,
        color: AppColorLight.fontColor,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 19,
        color: AppColorLight.fontColor,
        fontFamily: "Poppins"
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        color: Color(0xffC6C6C6),
      ),
      labelLarge: TextStyle(      //into text form field
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: Color.fromARGB(255, 109, 109, 109),
      ),
      labelMedium: TextStyle(        //for "No Tasks yet" sentence
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Color(0xff9E9E9E),
      ),
      titleLarge: TextStyle(             
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: Color(0xff9E9E9E),
      ),
      titleSmall: TextStyle(             //for motivation quote in profile screen
        fontWeight: FontWeight.w400,
        fontSize: 16,
        letterSpacing: 0.5,
        color: Color(0xff3A4640),
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
