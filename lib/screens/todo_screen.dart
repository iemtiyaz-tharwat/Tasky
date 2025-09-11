import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/customWidgets/custom_text_style.dart';
import 'package:tasky/provider/custom_provider.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewTaskController>(
      builder: (context, NewTaskController controller, child) {
        return Center(
          child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        CustomTextStyle(
                          text: "To Do Tasks",
                          fontSize: 20,
                          fontFamily: "Poppins",
                        ),
                      ],
                    ),
                  ),
                  Consumer<NewTaskController>(
                    builder: (context, controller, child) {
                      final toDoTasks = controller.newTasks
                          .where((task) => !task.isCompleted)
                          .toList();
                           if (controller.newTasks.isEmpty || toDoTasks.isEmpty) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: CustomTextStyle(
                                  text: "No tasks yet. Add one!",
                                  fontSize: 16,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ],
                          );
                        }
                      return Expanded(
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Expanded(
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 12),
                                itemCount: toDoTasks.length,
                                itemBuilder: (context, index) {
                                  final task = toDoTasks[index];
                                  return Container(
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff282828),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ListTile(
                                      leading: Checkbox(
                                        value: task.isCompleted,
                                        activeColor: Color(0xff15B86C),
                                        onChanged: (value) {
                                          context
                                              .read<NewTaskController>()
                                              .taskCompletion(task, value);
                                        },
                                      ),
                                        
                                      title: Text(
                                        task.taskName.toString(),
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 17,
                                          color: task.isCompleted
                                              ? Color(0xffA0A0A0)
                                              : Color(0xffFFFCFC),
                                          fontWeight: FontWeight.w600,
                                          decoration: task.isCompleted
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                          decorationColor: Colors.grey.shade800,
                                          decorationThickness: 3,
                                        ),
                                      ),
                                      subtitle: Text(
                                        task.taskDescription.toString(),
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 13,
                                          color: task.isCompleted
                                              ? Color(0xffA0A0A0)
                                              : Color(0xffFFFCFC),
                                          fontWeight: FontWeight.w600,
                                          decoration: task.isCompleted
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                          decorationColor: Colors.grey.shade800,
                                          decorationThickness: 3,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
                );
  }
    );
}
}
