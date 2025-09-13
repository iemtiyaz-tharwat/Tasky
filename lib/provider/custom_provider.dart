import 'package:flutter/material.dart';

class NewTaskModel {
  final String? taskName;
  final String taskDescription;
  bool isCompleted;
  bool isHighPriority;
  NewTaskModel({this.taskName, this.taskDescription = "" , this.isCompleted = false, this.isHighPriority = false});

  // @override          //to show them as strings not instances if i want 
  // String toString() {
  //   // TODO: implement toString
  //   return 'NewTaskModel(taskName: $taskName, taskDescription: $taskDescription)';
  // }
}

class NewTaskController extends ChangeNotifier {     //أفتكر ايه الفرق بين with و extends 

  List<NewTaskModel> newTasks = [];

  void add(NewTaskModel addNewTask) {
    newTasks.add(addNewTask);
    notifyListeners();
  }

  void taskCompletion(NewTaskModel task, bool? value) {
    final index = newTasks.indexOf(task);
    if (index != -1) {
      newTasks[index].isCompleted = value ?? false;
      notifyListeners();
  
}
  }
  void deleteTask(NewTaskModel task) {
  newTasks.remove(task);
  notifyListeners();
}
  }