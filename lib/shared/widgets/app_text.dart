import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  AppText({super.key, required this.text, required this.fontSize, this.color});
  final String text;
  final double fontSize;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
