import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tasky/provider/motivation_quote_controller.dart';
import 'package:tasky/provider/user_name_controller.dart';
import 'package:tasky/screens/tasky_name.dart';
import 'package:tasky/screens/user_details.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<UserNameProvider>(context).userName ?? '';
    final motivationQuote = Provider.of<MotivationQuoteProvider>(
      context,
    ).motivationQuote;
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
                  SizedBox(width: 7),
                  Text(
                    "My Profile",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFFCFC),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
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
                  children: [
                    SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$userName",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$motivationQuote",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: Color(0xffC6C6C6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Profile Info",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFFFCFC),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 17.5),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/user-03.svg",
                        width: 28,
                        height: 28,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "User Details",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 160),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return UserDetails();
                              },
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_forward),
                        color: Color(0xffC6C6C6),
                        iconSize: 28,
                      ),
                    ],
                  ),
                  Divider(indent: 20, endIndent: 20, color: Color(0xff6D6D6D)),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/moon-01.svg",
                        width: 28,
                        height: 28,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Dark Mode",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 160),
                      Switch(
                        value: isDarkMode,
                        onChanged: (value) {
                          setState(() {
                            isDarkMode = value;
                          });
                        },
                        activeThumbColor: Color(0xffFFFCFC),
                        inactiveThumbColor: Color(0xff6D6D6D),
                        activeTrackColor: Color(0xff15B86C),
                        inactiveTrackColor: Color(0xff282828),
                      ),
                    ],
                  ),
                  Divider(indent: 20, endIndent: 20, color: Color(0xff6D6D6D)),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/Leading element.svg",
                        width: 28,
                        height: 28,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Log Out",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 200),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return TaskyName();
                              },
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_forward),
                        color: Color(0xffC6C6C6),
                        iconSize: 28,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
