import 'dart:developer';
import 'package:chat_message_app/Controller/forgot_password_controller.dart';
import 'package:chat_message_app/Res/colors_res.dart';
import 'package:chat_message_app/Res/component/button_res.dart';
import 'package:chat_message_app/Res/component/textField_res.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordView extends StatefulWidget {
  static const routeName = '/forgotPassword';
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tfcEmail = TextEditingController();

  final emailFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _tfcEmail.dispose();
    emailFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height * 1;
    // double deviceWidth = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Consumer<ForgotPasswordController>(
              builder: (context, value, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Forgot Password!",
                      style: TextStyle(fontSize: 30.0, color: AppColor.primaryColor, fontWeight: FontWeight.w700, fontFamily: "Kanit"),
                    ),
                    SizedBox(height: deviceHeight * .02),
                    const Text(
                      "Let's Reset Your Password!",
                      style: TextStyle(fontSize: 25.0, color: AppColor.secondaryColor, fontWeight: FontWeight.w500, fontFamily: "Kanit"),
                    ),
                    SizedBox(height: deviceHeight * .04),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextField(
                            controller: _tfcEmail,
                            hintText: "Email Address",
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            focusNode: emailFocusNode,
                            onValidator: (value) {
                              return value.isEmpty ? 'Please enter your email!' : null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: deviceHeight * .04),
                    AppButton(
                      text: "Forgot Password",
                      isLoading: value.isLoading,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          value.forgotPassword(context, _tfcEmail.text);
                          // value.login(context, _tfcEmail.text, _tfcPassword.text);
                          log("email: ${_tfcEmail.text}");
                        } else {
                          
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
