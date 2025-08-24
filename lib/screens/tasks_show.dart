import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasky/screens/add_task.dart';
import 'package:tasky/provider/custom_provider.dart';
import 'package:provider/provider.dart';
import 'package:tasky/customWidgets/custom_text_style.dart';

class TaskShow extends StatefulWidget {
   TaskShow({super.key , required this.userName});
   String userName;
  @override
  State<TaskShow> createState() => _TaskShowState(
    userName: userName,
  );
}

class _TaskShowState extends State<TaskShow> {_TaskShowState({required this.userName});
  int currentIndex = 0;
  String userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff181818),
          leading:
          Container( width: 40, height: 40, decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
            child: IconButton( icon: Icon(Icons.person), onPressed:() {}, color: Colors.white,)), 
          title: ListTile(title: Text("Good Morning $userName", style: TextStyle(fontSize: 20, color: Colors.white),),),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Stack(
            children: [
              Positioned(
                bottom: kBottomNavigationBarHeight - 40,
                right: 0,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff15B86C),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  ),
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
                  label: Text(
                    'Add New Task',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 85,
          child: BottomNavigationBar(
            currentIndex: currentIndex, //الي انا واقف عنده
            onTap: (index) {                //لما أضعط عالإندكس ف قيمة الإنديكس دي هتبقى المفروض هي قيمة الcurrentIndex الجديدة
              SystemSound.play;   //to stop the tap sound
            //  currentIndex = index; //الي انا عايزة أروحله لما أضغط على حاجة مختلفة، مش هيأبديت فوق عشان دا خارج السكوب بتاعه
              //ف احنا عشان نخليه يطلع فوق و يغيره للقيمة الجديدة عايزين حاجة تعمل ريبيلد للاسكرين ف دا هيكون عن طريق ال سِت استيت
              setState((){ 
                currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xff15B86C),
            unselectedItemColor: Colors.white,
            selectedIconTheme: IconThemeData(size: 37),
            unselectedIconTheme: IconThemeData(size: 27),
            enableFeedback: false,     //to enable the tap sound stopping action   
            
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: "To Do"),
              BottomNavigationBarItem(icon: Icon(Icons.done), label: "Completed"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
              ],
          ),
        ),
    );
  }
}
