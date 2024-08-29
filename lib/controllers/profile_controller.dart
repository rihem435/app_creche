import 'package:creche/core/networking/app_api.dart';
import 'package:creche/core/storage/app_storage.dart';
import 'package:creche/models/user_login_model.dart';
import 'package:creche/screens/login_screen.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  String selectedRole = 'Parent';

  TextEditingController? firstnameController;
  TextEditingController? lastnameController;
  TextEditingController? usernameController;
  TextEditingController? phonenumberController;
  TextEditingController? localisationController;

  TextEditingController? roleController;

  final keyForm = GlobalKey<FormState>();

  bool obscureText = true;

  UserLoginModel? userLoginModel;

  dio.Dio? _dio;

  void showPassword() {
    obscureText = !obscureText;
    update();
  }

  login() async {
    try {
      dio.Response response = await _dio!.post(
        AppApi.loginUrl,
        data: {
          "email": emailController!.text,
          "password": passwordController!.text
        },
      );
      if (response.statusCode == 200) {
        print('login success ============>${response.data}');
        userLoginModel = UserLoginModel.fromJson(response.data);
        print('usernamme=====>${userLoginModel!.nom}');

        AppStorage.saveUserName(
            "${userLoginModel!.nom!} ${userLoginModel!.prenom!}");
        AppStorage.saveEmail(userLoginModel!.email!);
        Get.to(const LoginScreen());
      }
    } catch (e) {
      print('error==========>$e');
    }
  }

  signup() async {
    Map<String, dynamic> data = {
      "nom": firstnameController!.text,
      "prenom": lastnameController!.text,
      "username": usernameController!.text,
      "email": emailController!.text,
      "password": passwordController!.text,
      "adresse": localisationController!.text,
      "telephone": phonenumberController!.text,
      "role": selectedRole,
    };
    try {
      dio.Response response = await _dio!.post(
        AppApi.registerUrl,
        data: data,
      );
      if (response.statusCode == 200) {
        Get.to(const LoginScreen());
      }
      print('Response data: ${response.data}');
    } catch (e) {
      print('Error: $e');
    }
  }

  void onchangedDropDown(String? value) {
    selectedRole = value!;
    update();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    usernameController = TextEditingController();
    phonenumberController = TextEditingController();
    localisationController = TextEditingController();

    roleController = TextEditingController(text: selectedRole);
    _dio = dio.Dio();

    super.onInit();
  }
}
