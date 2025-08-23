import 'package:flutter/material.dart';

class CustomTextStyle extends StatelessWidget {
  const CustomTextStyle({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontFamily,
  });
  final String fontFamily, text;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          color: Color(0xffFFFCFC),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
