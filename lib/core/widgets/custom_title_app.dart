import 'package:flutter/material.dart';

class CustomTitleApp extends StatelessWidget {
  final String text;

  const CustomTitleApp({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Jua',
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
