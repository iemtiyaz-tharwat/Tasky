import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tasky/provider/user_name_controller.dart';
import 'package:tasky/screens/completed_tasks.dart';
import 'package:tasky/screens/home_screen.dart';
import 'package:tasky/screens/profile_screen.dart';
import 'package:tasky/screens/todo_screen.dart';

class BuildPage extends StatefulWidget {
  const BuildPage({super.key});

  @override
  State<BuildPage> createState() => _BuildPageState();
}

class _BuildPageState extends State<BuildPage> {
  _BuildPageState();
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> screens = <Widget>[
      HomeScreen(),
      const ToDoScreen(),
      const CompletedTasks(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: Center(child: screens.elementAt(currentIndex)),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          currentIndex: currentIndex, //الي انا واقف عنده
          onTap: (index) {
            //لما أضعط عالإندكس ف قيمة الإنديكس دي هتبقى المفروض هي قيمة الcurrentIndex الجديدة
            SystemSound; //to stop the tap sound
            //  currentIndex = index; //الي انا عايزة أروحله لما أضغط على حاجة مختلفة، مش هيأبديت فوق عشان دا خارج السكوب بتاعه
            //ف احنا عشان نخليه يطلع فوق و يغيره للقيمة الجديدة عايزين حاجة تعمل ريبيلد للاسكرين ف دا هيكون عن طريق ال سِت استيت
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xff15B86C),
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(size: 32),
          unselectedIconTheme: IconThemeData(size: 25),
          enableFeedback: false, //to enable the tap sound stopping action

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
