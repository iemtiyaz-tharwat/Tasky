import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasky/screens/add_task.dart';
import 'package:tasky/provider/custom_provider.dart';
import 'package:provider/provider.dart';
import 'package:tasky/customWidgets/custom_text_style.dart';


class TaskShow extends StatefulWidget {
  const TaskShow({super.key, required this.userName});
  final String userName;
  @override
  State<TaskShow> createState() => _TaskShowState(userName: userName);
}

class _TaskShowState extends State<TaskShow> {
  _TaskShowState({required this.userName});
  int currentIndex = 0;
  String userName;
  @override
  Widget build(BuildContext context) {
    return Consumer<NewTaskController>(
      builder: (context, NewTaskController newTaskController, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff181818),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/images/fav.jpg"),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning, $userName",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        //fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
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
                SizedBox(width: 3),
                IconButton(
                  iconSize: 33,
                  onPressed: () {},
                  icon: Icon(Icons.settings, color: Colors.white),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                if (newTaskController.newTasks.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Yuhuu , Your work Is almost done ! ",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10,),
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
                                        .TaskCompletion(index);
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
                SizedBox(height: 10,)
                //     Align(
                //   alignment: Alignment.bottomLeft,
                //   child: FloatingActionButton.extended(
                //     onPressed: () {
                //       context.read<NewTaskController>().removeAll();
                //     },
                //     icon: const Icon(Icons.delete),
                //     label: const Text("Delete Tasks"),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(30),
                //     ),
                //     backgroundColor: Color(0xff15B86C),
                //     foregroundColor: Colors.white,
                //   ),
                // )
              ],
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 90,
            child: BottomNavigationBar(
              currentIndex: currentIndex, //الي انا واقف عنده
              onTap: (index) {
                //لما أضعط عالإندكس ف قيمة الإنديكس دي هتبقى المفروض هي قيمة الcurrentIndex الجديدة
                SystemSound.play; //to stop the tap sound
                //  currentIndex = index; //الي انا عايزة أروحله لما أضغط على حاجة مختلفة، مش هيأبديت فوق عشان دا خارج السكوب بتاعه
                //ف احنا عشان نخليه يطلع فوق و يغيره للقيمة الجديدة عايزين حاجة تعمل ريبيلد للاسكرين ف دا هيكون عن طريق ال سِت استيت
                setState(() {
                  currentIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Color(0xff15B86C),
              unselectedItemColor: Colors.white,
              selectedIconTheme: IconThemeData(size: 30),
              unselectedIconTheme: IconThemeData(size: 20),
              enableFeedback: false, //to enable the tap sound stopping action

              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.list), label: "To Do"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.done),
                  label: "Completed",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
