import 'package:flutter/material.dart';
import 'package:tasky/screens/add_task.dart';


class ElevatedBotton extends StatelessWidget {
  const ElevatedBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
    );
  }
}