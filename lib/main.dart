import 'package:creche/core/bindings.dart';
import 'package:creche/screens/enfants/home_screen.dart';
import 'package:creche/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllBindings(),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
