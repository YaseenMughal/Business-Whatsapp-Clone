import 'package:chat_message_app/Res/colors_res.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final Color? textColor;
  final double? fontsize;
  final void Function() onTap;
  final bool isLoading;
  const AppButton({
    super.key,
    required this.text,
    this.height,
    this.width,
    this.textColor,
    this.fontsize,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 50,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: const LinearGradient(
            colors: [AppColor.primaryColor, AppColor.secondaryColor],
          ),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(color: AppColor.whiteColor)
              : Text(
                  text,
                  style: TextStyle(fontSize: fontsize ?? 18.0, color: textColor ?? AppColor.whiteColor, fontWeight: FontWeight.w600, fontFamily: "Kanit"),
                ),
        ),
      ),
    );
  }
}
