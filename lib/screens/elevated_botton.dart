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
                      "Good Morning, ",
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
    );
  }}
