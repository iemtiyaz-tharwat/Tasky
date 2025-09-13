import 'package:flutter/material.dart';

class Customtextformfield extends StatelessWidget {
  const Customtextformfield({
    super.key,
    required this.hintText,
    //required this.height,
    required this.maxLines,
    required this.controller,
  });
  final String hintText;
  //final double height;
  final maxLines;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: height,
      child: TextFormField(
        style: Theme.of(context).textTheme.labelLarge,
        controller: controller,
        maxLines: maxLines,
        keyboardType: TextInputType.text,
        cursorColor: Theme.of(context).colorScheme.surface,
        cursorHeight: 30,
        cursorRadius: const Radius.circular(40),
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.secondaryContainer,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
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
