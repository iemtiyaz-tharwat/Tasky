import 'package:flutter/material.dart';

class Customtextformfield extends StatelessWidget {
  const Customtextformfield({
    super.key,
    required this.hintText,
    //required this.height,
    required this.maxLines,
  });
  final String hintText;
  //final double height;
  final maxLines;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: height,
      child: TextFormField(
        style: TextStyle(
          color: Color.fromARGB(255, 252, 252, 255),
          fontSize: 20,
        ),
        maxLines: maxLines,
        keyboardType: TextInputType.text,
        keyboardAppearance: Brightness.dark,
        cursorColor: Colors.white,
        cursorHeight: 30,
        cursorRadius: const Radius.circular(40),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xff282828),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            color: Color.fromARGB(255, 109, 109, 109),
            fontWeight: FontWeight.w400,
          ),
        ),
        // ignore: body_might_complete_normally_nullable
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Not valid";
          }
        },
      ),
    );
  }
}
