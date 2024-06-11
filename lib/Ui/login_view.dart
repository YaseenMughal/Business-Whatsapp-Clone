import 'dart:developer';

import 'package:chat_message_app/Controller/login_controller.dart';
import 'package:chat_message_app/Res/colors_res.dart';
import 'package:chat_message_app/Res/component/button_res.dart';
import 'package:chat_message_app/Res/component/textField_res.dart';
import 'package:chat_message_app/Ui/forgot_password_view.dart';
import 'package:chat_message_app/Ui/signup_view.dart';
import 'package:chat_message_app/Utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  static const routeName = '/login';
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tfcEmail = TextEditingController();
  final TextEditingController _tfcPassword = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _tfcEmail.dispose();
    _tfcPassword.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
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
            child: Consumer<LoginController>(
              builder: (context, value, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome Back!",
                      style: TextStyle(fontSize: 30.0, color: AppColor.primaryColor, fontWeight: FontWeight.w700, fontFamily: "Kanit"),
                    ),
                    SizedBox(height: deviceHeight * .02),
                    const Text(
                      "Let's Login Your Account!",
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
                            onFieldSubmitted: (value) {
                              Utils.fieldFocus(context, emailFocusNode, passwordFocusNode);
                            },
                            onValidator: (value) {
                              return value.isEmpty ? 'Please enter your email!' : null;
                            },
                          ),
                          AppTextField(
                            controller: _tfcPassword,
                            hintText: "Password",
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            focusNode: passwordFocusNode,
                            onValidator: (value) {
                              return value.isEmpty ? 'Please enter your password!' : null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(ForgotPasswordView.routeName);
                          },
                          child: const Text(
                            "forgot password?",
                            style: TextStyle(fontSize: 16.0, color: AppColor.primaryColor, fontWeight: FontWeight.w400, fontFamily: "Kanit"),
                          )),
                    ),
                    SizedBox(height: deviceHeight * .04),
                    AppButton(
                      text: "Login",
                      isLoading: value.isLoading,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          value.login(context, _tfcEmail.text, _tfcPassword.text);
                          log("email: ${_tfcEmail.text} | password: ${_tfcPassword.text}");
                        } else {}
                      },
                    ),
                    SizedBox(height: deviceHeight * .04),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(SignUpView.routeName);
                          },
                          child: const Text(
                            "Don't have an account? SIGNUP",
                            style: TextStyle(fontSize: 16.0, color: AppColor.primaryColor, fontWeight: FontWeight.w400, fontFamily: "Kanit"),
                          )),
                    )
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
