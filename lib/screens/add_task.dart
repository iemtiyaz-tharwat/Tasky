import 'package:flutter/material.dart';
//import 'package:tasky2/customWidgets/custom_button_container.dart';
import 'package:tasky/customWidgets/custom_text_form_field.dart';
import 'package:tasky/customWidgets/custom_text_style.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool isSwitched = false;
  GlobalKey<FormState> taskNameKey = GlobalKey();
  GlobalKey<FormState> taskDescriptionKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x0f181818),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Color(0xffFFFCFC),
        ),
        title: CustomTextStyle(
          text: 'New Task',
          fontSize: 20,
          fontFamily: 'Poppins',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 26),
              CustomTextStyle(
                text: 'Task Name',
                fontSize: 20,
                fontFamily: 'Poppins',
              ),
              SizedBox(height: 15),
              Form(
                key: taskNameKey,
                child: Customtextformfield(
                  hintText: "Finish UI design for login screen",
                  //height: 64,
                  maxLines: 1,
                ),
              ),
              SizedBox(height: 20),
              CustomTextStyle(
                text: 'Task Description',
                fontSize: 20,
                fontFamily: 'Poppins',
              ),
              SizedBox(height: 15),
              Form(
                key: taskDescriptionKey,
                child: Customtextformfield(
                  hintText:
                      'Finish onboarding UI and hand off to devs by Thursday.',
                  //height: 160,
                  maxLines: 5,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  CustomTextStyle(
                    text: 'High Priority',
                    fontSize: 20,
                    fontFamily: 'Poppins',
                  ),
                  SizedBox(width: 190),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeThumbColor: Color(0xffFFFCFC),
                    inactiveThumbColor: Color(0xff6D6D6D),
                    activeTrackColor: Color(0xff15B86C),
                    inactiveTrackColor: Color(0xff282828),
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
                  if (taskNameKey.currentState!.validate() &&
                      taskDescriptionKey.currentState!.validate()) {
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
