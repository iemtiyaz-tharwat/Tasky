import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/customWidgets/custom_button_container.dart';
import 'package:tasky/customWidgets/custom_text_form_field.dart';
import 'package:tasky/screens/tasks_show.dart';

class TaskyName extends StatefulWidget {
  const TaskyName({super.key});

  @override
  State<TaskyName> createState() => _TaskyNameState();
}

class _TaskyNameState extends State<TaskyName> {
  GlobalKey<FormState> formKey = GlobalKey();
  final userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/Vector.svg',
                      width: 42,
                      height: 42,
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Tasky',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 28,
                        color: Color.fromARGB(255, 252, 252, 255),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome To Tasky',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color.fromARGB(255, 252, 252, 255),
                          ),
                        ),
                        SizedBox(width: 8),
                        SvgPicture.asset(
                          'assets/images/hand.svg',
                          width: 251,
                          height: 28,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your productivity journey starts here.',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color.fromARGB(255, 252, 252, 255),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 35),
                    SvgPicture.asset('assets/images/pana.svg', width: 250),
                  ],
                ),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Full Name',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                      color: Color.fromARGB(255, 252, 252, 255),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Form(
                  key: formKey,
                  child: Customtextformfield(
                    controller: userNameController,
                    hintText: 'e.g. Sarah Khalid',
                    //height: 60,
                    maxLines: 1,
                  ),
                ),
                SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TaskShow(userName: userNameController.text,);
                          },
                        ),
                      );
                    } else {
                      // ignore: avoid_print
                      print('Not valid');
                    }
                  },
                  child: CustomButtonContainer(
                    buttonText: 'Let’s Get Started',
                    buttonFontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
