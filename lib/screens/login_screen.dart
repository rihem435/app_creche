import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Text(
            "Welcome Back!",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Email",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
