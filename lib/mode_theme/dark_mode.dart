import 'package:flutter/material.dart';
import 'package:tasky/mode_colors/dark_mode_colors.dart';

ThemeData darkModeTheme() {
  return ThemeData(
    cardColor: Color(0xff282828),
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColorDark.ColorFilter,   
      onPrimary: AppColorDark.arrowColor,
      secondaryContainer: AppColorDark.containerColor,
      surface: AppColorDark.cursorColor,
      primaryFixed: AppColorDark.listTileTitleColorWhenIsNotCompleted,
      primaryFixedDim: AppColorDark.listTileTitleColorWhenIsCompleted,
      onPrimaryFixed: AppColorDark.archieveTasksColor,
      onSecondaryFixed: AppColorDark.numberOfAchievedTasksSentence,
      onSecondary: AppColorDark.subtitleColor,
    ),
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
        fontSize: 24,
        letterSpacing: 0.5,
        color: AppColorDark.fontColor,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 19,
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
        color: Color(0xffC6C6C6),
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Color(0xffC6C6C6),
      ),
      titleLarge: TextStyle(             //for Top Screen sentence
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: Color(0xffFFFCFC),
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
        color: Colors.white,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xffFFFCFC); //Active
      }
      return const Color(0xff6D6D6D);   //off
    }),
    trackColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xff15B86C); // التراك وهو ON
      }
      return const Color(0xff282828);   // التراك وهو OFF
    }),
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
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColorDark.screenColor,
    selectedItemColor: const Color(0xff15B86C),
    unselectedItemColor: Color(0xffC6C6C6),
    selectedIconTheme: const IconThemeData(size: 32),
    unselectedIconTheme: const IconThemeData(size: 25),
    showUnselectedLabels: true,
    enableFeedback: false,
  ),
  );
}
