import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/customWidgets/custom_text_style.dart';
import 'package:tasky/provider/user_name_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<UserNameProvider>(context).userName ?? '';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                  SizedBox(width: 4),
                  CustomTextStyle(
                    text: "My Profile",
                    fontSize: 23,
                    fontFamily: "Poppins",
                  ),
                ],
              ),
              SizedBox(height: 50),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xff181818),
                      radius: 85,
                      child: Icon(Icons.person, size: 85, color: Colors.white),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xff282828),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.camera_alt),
                      ),
                      
                    ),
                  ],
                ),
              
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextStyle(text: "$userName", fontSize: 20, fontFamily: "Poppins")
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
