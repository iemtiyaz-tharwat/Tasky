import 'package:flutter/material.dart';

class NewTaskModel {
  final String? taskName;
  final String? taskDescription;
  bool isCompleted;
  NewTaskModel({this.taskName, this.taskDescription , this.isCompleted = false});

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

  void TaskCompletion(int index) {
    newTasks[index].isCompleted = !newTasks[index].isCompleted;
    notifyListeners();
  }
}
