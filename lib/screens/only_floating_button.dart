import 'package:flutter/material.dart';
import 'package:tasky/screens/add_task.dart';

class OnlyFloatingButton extends StatelessWidget {
  const OnlyFloatingButton({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //Temporary arrow back
        appBar: AppBar(
          backgroundColor: Color(0xff181818),
          leading: IconButton(onPressed:() {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back), color: Colors.white,),
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
            ]
          ),
        ),
         bottomNavigationBar : SizedBox(
          height: 85,
           child: BottomNavigationBar(
            currentIndex: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xff15B86C),
            unselectedItemColor: Colors.white,
            iconSize: 35,
            //selectedIconTheme: IconThemeData(
           //   size: 35
            //),
            unselectedIconTheme: IconThemeData(
              size: 28
            ),
            items: [
           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
           BottomNavigationBarItem(icon: Icon(Icons.list), label: "To Do"),
           BottomNavigationBarItem(icon: Icon(Icons.done), label: "Completed"),
           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
           ]
           ),
         )
      ),
    );
  }
}
