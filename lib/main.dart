import 'package:flutter/material.dart';
import 'package:tasky/screens/tasky_name.dart';


void main() {
  runApp(const TaskyApp());
}

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tasky App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      //splashColor: Colors.green.withOpacity(0.2),       //green tapping effect
      //highlightColor: Colors.green.withOpacity(0.1),   
      splashFactory: NoSplash.splashFactory,      //no effect color in navBar after tapping
      hintColor: Colors.transparent,           //disappear the shade effect after tapping
      
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff181818),
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.white,
    ),
        scaffoldBackgroundColor: Color(0xff181818)),
      home: const TaskyName(),
    );
  }
}
