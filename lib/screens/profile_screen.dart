import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/mode_theme/dark_mode.dart';
import 'package:tasky/mode_theme/light_mode.dart';
import 'package:tasky/provider/motivation_quote_controller.dart';
import 'package:tasky/provider/theme_provider.dart';
import 'package:tasky/provider/user_name_controller.dart';
import 'package:tasky/screens/tasky_name.dart';
import 'package:tasky/screens/user_details.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = true;

 @override
  void initState() {
    super.initState();
    loadAppMode(isDarkMode);
  }
  void loadAppMode (bool value) async {
    final preference = await SharedPreferences.getInstance();
    final appMode = preference.getBool("darkMode");
    if (appMode != null) {
      setState(() {
        isDarkMode = appMode;
      });
    }
  }
  void appMode (bool value) async {
    final preference = await SharedPreferences.getInstance();
    await preference.setBool("darkMode", value);
    }
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
                    color: Theme.of(context).colorScheme.onPrimaryFixed,
                  ),
                  SizedBox(width: 7),
                  Text(
                    "My Profile",
                     style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
              SizedBox(height: 18),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.tertiaryFixed,
                      radius: 85,
                      child: Icon(Icons.person, size: 85, color: Theme.of(context).colorScheme.tertiary),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiaryFixedDim,
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
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$userName",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$motivationQuote",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Profile Info",
                        style:  Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                  SizedBox(height: 17.5),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/user_light_mode.svg",
                        width: 28,
                        height: 28,
                        colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "User Details",
                        style: Theme.of(context).textTheme.displayMedium,
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
                        color: Theme.of(context).colorScheme.onPrimary,
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
                        colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Dark Mode",
                        style: Theme.of(context).textTheme.displayMedium
                      ),
                      SizedBox(width: 160),
                      Switch(
                        value: isDarkMode,
                        onChanged: (value) {
                          setState(() {
                            isDarkMode = value;
                          });
                          appMode(value);
                          final themeMode = value ? darkModeTheme() : lightModeTheme();
                          Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                        },
                        
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
                        colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Log Out",
                        style: Theme.of(context).textTheme.displayMedium
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
                        color: Theme.of(context).colorScheme.onPrimary,
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
