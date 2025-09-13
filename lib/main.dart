import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/mode_theme/dark_mode.dart';
import 'package:tasky/mode_theme/light_mode.dart';
import 'package:tasky/provider/custom_provider.dart';
import 'package:tasky/provider/motivation_quote_controller.dart';
import 'package:tasky/provider/theme_provider.dart';
import 'package:tasky/provider/user_name_controller.dart';
import 'package:tasky/screens/tasky_name.dart';
import 'package:provider/provider.dart';


void main(){
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewTaskController(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserNameProvider(),
        ),
        ChangeNotifierProvider(create: (_)=> MotivationQuoteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const TaskyApp(),
    ),
  );
  
}

class TaskyApp extends StatefulWidget {
  const TaskyApp({super.key});
  @override
  State<TaskyApp> createState() => _TaskyAppState();
}

class _TaskyAppState extends State<TaskyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer <ThemeProvider>(builder: (context, themeProvider, child) {
    return MaterialApp(
      title: "Tasky App",
      debugShowCheckedModeBanner: false,
      theme: themeProvider.isDark ? darkModeTheme() : lightModeTheme(),
      themeMode: ThemeMode.system,
      home: const TaskyName(),
    );
    },);
  }
}
