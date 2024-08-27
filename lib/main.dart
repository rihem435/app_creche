import 'package:creche/screens/enfants/home_screen.dart';
import 'package:creche/screens/login_screen.dart';
import 'package:flutter/material.dart';

var affichetText = const Text(
  "Hello Word",
  style: TextStyle(
    fontSize: 25,
    color: Colors.blue,
    decoration: TextDecoration.none,
  ),
);
var afficheIcon = const Icon(
  Icons.email,
  color: Colors.black,
  size: 25,
);
void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
