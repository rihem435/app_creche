import 'package:creche/core/networking/app_api.dart';
import 'package:creche/core/widgets/custom_input_field.dart';
import 'package:creche/core/widgets/custom_title_app.dart';
import 'package:creche/screens/sign_up_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  TextEditingController? emailController;
  TextEditingController? passwordController;

  final keyForm = GlobalKey<FormState>();

  Dio? dio;
  login() async {
    try {
      Response response = await dio!.post(
        AppApi.loginUrl,
        data: {
          "email": emailController!.text,
          "password": passwordController!.text
        },
      );
      if (response.statusCode == 200) {
        print('login success ============>${response.data}');
      }
    } catch (e) {
      print('error==========>$e');
    }
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    dio = Dio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/creche.png',
                  height: 180,
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: CustomTitleApp(
                  text: "Connexion",
                ),
              ),
              const SizedBox(height: 5),
              const Center(
                child: Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontFamily: 'Jua',
                    color: Color(0xFFFFD789),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 5),
              CustomInputField(
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                hintText: "tapez email",
                prefxIcon: Icons.email,
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter email';
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return 'Enter a valid email';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 8),
              CustomInputField(
                labelText: 'Password',
                obscureText: obscureText,
                hintText: "tapez password",
                prefxIcon: Icons.lock,
                controller: passwordController,
                suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                      print('obscureText ===>$obscureText');
                    });
                  },
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 2),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const ForgotpasswordScreen()),
                    // );
                  },
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(
                      fontFamily: 'Jua',
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD789),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    print("email========>$emailController");
                    print("email========>${emailController!.text}");

                    if (keyForm.currentState!.validate()) {
                      login();
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: 'Jua',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: "SignUp",
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
                                builder: (context) => const SignUpScreen(),
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
    );
  }
}
