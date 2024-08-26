import 'package:creche/core/networking/app_api.dart';
import 'package:creche/core/theme/app_colors.dart';
import 'package:creche/core/widgets/custom_input_field.dart';
import 'package:creche/core/widgets/custom_title_app.dart';
import 'package:creche/screens/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String selectedRole = 'Parent';

  late TextEditingController firstnameController;
  late TextEditingController lastnameController;
  late TextEditingController usernameController;
  late TextEditingController phonenumberController;
  late TextEditingController localisationController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController roleController;
  late Dio dio;
  @override
  void initState() {
    super.initState();
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    usernameController = TextEditingController();
    phonenumberController = TextEditingController();
    localisationController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    roleController = TextEditingController(text: selectedRole);
    dio = Dio(); // Initialize Dio
  }

  signup() async {
    Map<String, dynamic> data = {
      "nom": firstnameController.text,
      "prenom": lastnameController.text,
      "username": usernameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "adresse": localisationController.text,
      "telephone": phonenumberController.text,
      "role":selectedRole,
    };
    try {
      Response response = await dio.post(
        AppApi.registerUrl,
        data: data,
      );
      if (response.statusCode == 200) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
      print('Response data: ${response.data}');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Main content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/creche.png',
                      height: 180,
                    ),
                  ),
                  const CustomTitleApp(
                    text: "Sign up",
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Please fill the credentials",
                    style: TextStyle(
                      fontFamily: 'Jua',
                      color: Color(0xFFFFD789),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomInputField(
                    controller: firstnameController,
                    labelText: 'First name',
                    hintText: "tapez first name",
                    prefxIcon: Icons.person,
                  ),
                  const SizedBox(height: 8),
                  CustomInputField(
                    controller: lastnameController,
                    labelText: 'Last name',
                    hintText: "tapez last name",
                    prefxIcon: Icons.person,
                  ),
                  const SizedBox(height: 8),
                  CustomInputField(
                    controller: usernameController,
                    labelText: 'Username',
                    hintText: "tapez user name",
                    prefxIcon: Icons.person,
                  ),
                  const SizedBox(height: 8),

                  const SizedBox(height: 8),
                  CustomInputField(
                    controller: phonenumberController,
                    labelText: 'Phone number',
                    keyboardType: TextInputType.phone,
                    prefxIcon: Icons.phone,
                    hintText: "tapez phone number",
                  ),
                  const SizedBox(height: 8),
                  CustomInputField(
                      controller: localisationController,
                      labelText: 'Address',
                      hintText: "tapez adresse",
                      prefxIcon: Icons.location_city),
                  const SizedBox(height: 8),
                  CustomInputField(
                    controller: emailController,
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    hintText: "tapez email",
                    prefxIcon: Icons.email,
                  ),
                  const SizedBox(height: 8),
                  CustomInputField(
                    labelText: 'Password',
                    controller: passwordController,
                    obscureText: true,
                    hintText: "tapez password",
                    prefxIcon: Icons.lock,
                  ),
                  const SizedBox(height: 8),

                  // Role field
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppColors.fillColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.fillColor,
                        width: 2,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedRole,
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.grey),
                        style: const TextStyle(
                          fontFamily: 'Jua',
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedRole = newValue!;
                          });
                        },
                        items: <String>['Parent', 'Employe']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        signup();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        backgroundColor: const Color(0xFFFFD789),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          fontFamily: 'Jua',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: "Have an account? "),
                          TextSpan(
                            text: "Login",
                            style: const TextStyle(
                              fontFamily: 'Jua',
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
