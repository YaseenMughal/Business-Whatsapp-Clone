import 'package:chat_message_app/Res/colors_res.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final void Function(String)? onFieldSubmitted;
  final bool obscureText;
  final String hintText;
  final FormFieldValidator? onValidator;
  final BorderRadius? border;
  final EdgeInsetsGeometry? contentPadding;
  final double? hintFont;
  final Color? hintColor;
  final double? styleFont;

  const AppTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.keyboardType,
    this.onFieldSubmitted,
    this.obscureText = false,
    required this.hintText,
    this.onValidator,
    this.border,
    this.contentPadding,
    this.hintFont,
    this.hintColor,
    this.styleFont,
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
        style: TextStyle(fontSize: styleFont ?? 16.0, color: AppColor.secondaryColor, fontWeight: FontWeight.w400, fontFamily: "Kanit"),
        decoration: InputDecoration(
            isDense: true,
            contentPadding: contentPadding,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: hintFont ?? 18.0, color: hintColor ?? AppColor.secondaryColor, fontWeight: FontWeight.w500, fontFamily: "Kanit"),
            border: OutlineInputBorder(borderRadius: border ?? BorderRadius.circular(15.0), borderSide: const BorderSide(color: AppColor.subtitleColor, width: 2.0)),
            focusedBorder: OutlineInputBorder(borderRadius: border ?? BorderRadius.circular(15.0), borderSide: const BorderSide(color: AppColor.primaryColor, width: 2.0)),
            errorBorder: OutlineInputBorder(borderRadius: border ?? BorderRadius.circular(15.0), borderSide: const BorderSide(color: AppColor.errorColor, width: 2.0))),
      ),
    );
  }
}
