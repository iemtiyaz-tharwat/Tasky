import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/customWidgets/custom_text_form_field.dart';
import 'package:tasky/customWidgets/custom_text_style.dart';
import 'package:tasky/provider/motivation_quote_controller.dart';
import 'package:tasky/provider/user_name_controller.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  GlobalKey<FormState> motivationQuoteKey = GlobalKey();
  final _motivationQuoteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<UserNameProvider>(context).userName ?? '';
    final motivationProvider = Provider.of<MotivationQuoteProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        final enteredText = _motivationQuoteController.text
                            .trim();
                        final motivationQuote = enteredText.isEmpty
                            ? "One task at a time. One step closer."
                            : enteredText;
                            Provider.of<MotivationQuoteProvider>(context, listen: false)
        .setQuote(motivationQuote);
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                    SizedBox(width: 7),
                    Text(
                      "User Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFFFCFC),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                CustomTextStyle(
                  text: 'User Name',
                  fontSize: 20,
                  fontFamily: 'Poppins',
                ),
                SizedBox(height: 10),
                Container(
                  height: 66,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF282828),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "$userName",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: Color(0xffC6C6C6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    CustomTextStyle(
                      text: 'Motivation Quote',
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                    SizedBox(height: 10),
                    Form(
                      child: TextFormField(
                        key: motivationQuoteKey,
                        controller: _motivationQuoteController,
                        style: TextStyle(
                          color: Color.fromARGB(255, 252, 252, 255),
                          fontSize: 20,
                        ),
                        maxLines: 5,
                        keyboardType: TextInputType.text,
                        keyboardAppearance: Brightness.dark,
                        cursorColor: Colors.white,
                        cursorHeight: 30,
                        cursorRadius: const Radius.circular(40),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xff282828),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: "One task at a time. One step closer.",
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Color.fromARGB(255, 109, 109, 109),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
