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
      primaryFixed: AppColorLight.listTileTitleColorWhenIsNotCompleted,
      primaryFixedDim: AppColorLight.listTileTitleColorWhenIsCompleted,
      onPrimaryFixed: AppColorLight.archieveTasksColor,
      onSecondaryFixed: AppColorLight.numberOfAchievedTasksSentence,
      onSecondary: AppColorLight.subtitleColor,
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
      displayMedium: TextStyle(          //for sided titles
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
      labelLarge: TextStyle(      //text form field filling
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: Color(0xff3A4640),
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
      titleMedium: TextStyle(             //for hint text
        fontWeight: FontWeight.w400,
        fontSize: 18,
        letterSpacing: 0.5,
        color: Color.fromARGB(255, 109, 109, 109),
      ),
      titleSmall: TextStyle(             //for motivation quote in profile screen
        fontWeight: FontWeight.w400,
        fontSize: 18,
        letterSpacing: 0.5,
        color: Color(0xff3A4640),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xffFFFCFC); //Active thumb (الدايرة)
      }
      return const Color(0xff9E9E9E);   //off لون الدايرة
    }),
    trackColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xff15B86C); // التراك وهو ON
      }
      return const Color(0xffFFFCFC);   // التراك وهو OFF
    }),
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
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColorLight.screenColor,
    selectedItemColor: const Color(0xff15B86C),
    unselectedItemColor: Color(0xff3A4640),
    selectedIconTheme: const IconThemeData(size: 32),
    unselectedIconTheme: const IconThemeData(size: 25),
    showUnselectedLabels: true,
    enableFeedback: false,
  ),
  );
}
