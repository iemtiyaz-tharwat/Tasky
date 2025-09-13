import 'package:flutter/material.dart';
import 'package:tasky/customWidgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';
import 'package:tasky/provider/custom_provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool _isHighPriority = false;
  GlobalKey<FormState> taskNameKey = GlobalKey();
  GlobalKey<FormState> taskDescriptionKey = GlobalKey();
  GlobalKey<FormState> taskPriorityKey = GlobalKey();
  final _taskNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text("New Task", style: Theme.of(context).textTheme.displayLarge,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 26),
              Text("Task Name", style: Theme.of(context).textTheme.displayMedium,),
              SizedBox(height: 15),
              Form(
                key: taskNameKey,
                child: Customtextformfield(
                  controller: _taskNameController,
                  hintText: "Finish UI design for login screen",
                  //height: 64,
                  maxLines: 1,
                ),
              ),
              SizedBox(height: 20),
              Text("Task Description", style: Theme.of(context).textTheme.displayMedium,),
              SizedBox(height: 15),
              Form(
                key: taskDescriptionKey,
                child: Customtextformfield(
                  controller: _descriptionController,
                  hintText:
                      'Finish onboarding UI and hand off to devs by Thursday.',
                  //height: 160,
                  maxLines: 5,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [ Text("High Priority", style: Theme.of(context).textTheme.displayMedium,),
                  SizedBox(width: 220),
                  Switch(
                    value: _isHighPriority,
                    onChanged: (value) {
                      setState(() {
                        _isHighPriority = value;
                      });
                      
                    },
                  ),
                ],
              ),
              SizedBox(height: 89),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff15B86C),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {
                  if (taskNameKey.currentState!.validate() ) {
                    context.read<NewTaskController>().add(NewTaskModel(taskName: _taskNameController.text, taskDescription: _descriptionController.text, isHighPriority: _isHighPriority));
                    Navigator.pop(context);
                  } else {
                    print("Not valid");
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 2),
                    Text(
                      'Add Task',
                      style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
