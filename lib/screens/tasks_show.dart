import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasky/screens/add_task.dart';

class TaskShow extends StatefulWidget {
  const TaskShow({super.key});

  @override
  State<TaskShow> createState() => _TaskShowState();
}

class _TaskShowState extends State<TaskShow> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //Temporary arrow back
        appBar: AppBar(
          backgroundColor: Color(0xff181818),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
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
      ),
    );
  }
}
