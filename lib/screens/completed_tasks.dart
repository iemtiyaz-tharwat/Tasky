import 'package:flutter/material.dart';
import 'package:tasky/mode_colors/dark_mode_colors.dart';

class CompletedTasks extends StatefulWidget {
  const CompletedTasks({super.key});

  @override
  State<CompletedTasks> createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorDark.screenColor,
        title: Text("Completed Tasks", style: TextStyle(fontSize: 20, color: Colors.white),),
      ),
    );
  }
}