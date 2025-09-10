import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky/screens/add_task.dart';
import 'package:tasky/provider/custom_provider.dart';
import 'package:provider/provider.dart';
import 'package:tasky/customWidgets/custom_text_style.dart';
import 'package:tasky/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.userName});
  final String userName;
  @override
  State<HomeScreen> createState() => _HomeScreenState(userName: userName);
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState({required this.userName});
  String userName;
  @override
  Widget build(BuildContext context) {
    return Consumer<NewTaskController>(
      builder: (context, NewTaskController newTaskController, child) {
        return Center(
          child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          iconSize: 42,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProfileScreen();
                                },
                              ),
                            );
                          },
                          icon: Icon(Icons.person, color: Colors.white),
                        ),
                        SizedBox(
                          width: 251,
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Good Morning, $userName",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  //fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "One task at a time. One step closer.",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          iconSize: 33,
                          onPressed: () {},
                          icon: Icon(Icons.settings, color: Colors.white),
                        ),
                      ],
                    ),
                    if (newTaskController.newTasks.isNotEmpty)
                      Padding(
  padding: const EdgeInsets.all(16.0),
  child: RichText(
    text: TextSpan(
      style: const TextStyle(fontSize: 32, color: Colors.white),
      children: [
        const TextSpan(text: "Yuhuu, Your work Is almost done! "),
        
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: SvgPicture.asset(
            'assets/images/hand.svg',
            width: 30,
            height: 30,
          ),
        ),
      ],
    ),
  ),
),
SizedBox(height: 10),
                    Expanded(
                      child: Consumer<NewTaskController>(
                        builder: (context, newTaskController, child) {
                          if (newTaskController.newTasks.isEmpty) {
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
                          return ListView.separated(
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 12),
                            itemCount: newTaskController.newTasks.length,
                            itemBuilder: (context, index) {
                              final task = newTaskController.newTasks[index];
                              return Center(
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 55, 53, 53),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
          
                                  child: ListTile(
                                    leading: Checkbox(
                                      value: task.isCompleted,
                                      activeColor: Color(0xff15B86C),
                                      onChanged: (value) {
                                        context
                                            .read<NewTaskController>()
                                            .taskCompletion(index);
                                      },
                                    ),
          
                                    title: Text(
                                      task.taskName.toString(),
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 16,
                                        color: Color(0xffFFFCFC),
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
                                        fontSize: 14,
                                        color: Color(0xffFFFCFC),
                                        fontWeight: FontWeight.w600,
                                        decoration: task.isCompleted
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none,
                                        decorationColor: Colors.grey.shade800,
                                        decorationThickness: 3,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AddTaskScreen();
                              },
                            ),
                          );
                        },
                        icon: Icon(Icons.add, color: Colors.white),
                        label: CustomTextStyle(
                          text: 'Add New Task',
                          fontSize: 17,
                          fontFamily: "Poppins",
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Color(0xff15B86C),
                        foregroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            )
          
        );
      },
    );
  }
}
