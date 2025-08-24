import 'package:flutter/material.dart';

class NewTaskModel {
  final String? taskName;
  final String? taskDescription;
  NewTaskModel({this.taskName, this.taskDescription});

  // @override          //to show them as strings not instances if i want 
  // String toString() {
  //   // TODO: implement toString
  //   return 'NewTaskModel(taskName: $taskName, taskDescription: $taskDescription)';
  // }
}

class NewTaskController with ChangeNotifier {

  List<NewTaskModel> newTasks = [];

  void add(NewTaskModel addNewTask) {
    newTasks.add(addNewTask);
    notifyListeners();
  }
  void removeAll(){
    newTasks.clear();
    notifyListeners();
  }
}
