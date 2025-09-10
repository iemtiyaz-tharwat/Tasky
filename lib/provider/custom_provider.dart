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

class NewTaskController extends ChangeNotifier {     //أفتكر ايه الفرق بين with و extends 

  List<NewTaskModel> newTasks = [];

  void add(NewTaskModel addNewTask) {
    newTasks.add(addNewTask);
    notifyListeners();
  }
  void removeAll(){
    newTasks.clear();
    notifyListeners();
  }

  void taskCompletion(int index) {
    newTasks[index].isCompleted = !newTasks[index].isCompleted;
    notifyListeners();
  }
}
