import 'package:creche/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? prefxIcon;
  final Widget? suffix;
final TextEditingController? controller;

  const CustomInputField({
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.labelText,
    this.prefxIcon,
    this.suffix, this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 60,
      ),
      child: TextFormField(
        controller:controller ,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            fontFamily: 'Jua',
            color: Colors.grey,
            fontSize: 16,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            // fontFamily: 'Jua',
            color: Colors.grey,
            fontSize: 10,
          ),
          filled: true,
          fillColor: AppColors.fillColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: AppColors.fillColor,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: AppColors.fillColor,
              width: 2,
            ),
          ),
          prefixIcon: Icon(
            prefxIcon,
            color: Colors.grey,
          ),

          suffix: suffix,

        ),
        cursorColor: Colors.black,
      ),
    );
  }
}
