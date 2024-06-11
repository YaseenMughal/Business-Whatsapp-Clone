import 'package:chat_message_app/Res/colors_res.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final void Function(String)? onFieldSubmitted;
  final bool obscureText;
  final String hintText;
  final FormFieldValidator onValidator;

  const AppTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.keyboardType,
    this.onFieldSubmitted,
    this.obscureText = false,
    required this.hintText,
    required this.onValidator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        controller: controller,
        cursorColor: AppColor.primaryColor,
        focusNode: focusNode,
        keyboardType: keyboardType,
        obscureText: obscureText,
        obscuringCharacter: '*',
        validator: onValidator,
        onFieldSubmitted: onFieldSubmitted,
        style: const TextStyle(fontSize: 16.0, color: AppColor.secondaryColor, fontWeight: FontWeight.w400, fontFamily: "Kanit"),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 18.0, color: AppColor.secondaryColor, fontWeight: FontWeight.w500, fontFamily: "Kanit"),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0), borderSide: const BorderSide(color: AppColor.subtitleColor, width: 2.0)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0), borderSide: const BorderSide(color: AppColor.primaryColor, width: 2.0)),
            errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0), borderSide: const BorderSide(color: AppColor.errorColor, width: 2.0))),
      ),
    );
  }
}
