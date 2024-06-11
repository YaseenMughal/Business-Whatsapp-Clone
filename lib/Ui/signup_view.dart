import 'dart:developer';

import 'package:chat_message_app/Controller/signup_controller.dart';
import 'package:chat_message_app/Res/colors_res.dart';
import 'package:chat_message_app/Res/component/button_res.dart';
import 'package:chat_message_app/Res/component/textField_res.dart';
import 'package:chat_message_app/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  static const routeName = '/signup';
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tfcUsername = TextEditingController();
  final TextEditingController _tfcEmail = TextEditingController();
  final TextEditingController _tfcPassword = TextEditingController();

  final usernameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _tfcUsername.dispose();
    _tfcEmail.dispose();
    _tfcPassword.dispose();
    usernameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height * 1;
    // double deviceWidth = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
          child: Consumer<SignupController>(
            builder: (context, value, child) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome To\nBusiness Whatsapp!",
                      style: TextStyle(fontSize: 30.0, color: AppColor.primaryColor, fontWeight: FontWeight.w700, fontFamily: "Kanit"),
                    ),
                    SizedBox(height: deviceHeight * .02),
                    const Text(
                      "Let's Create Your Account!",
                      style: TextStyle(fontSize: 25.0, color: AppColor.secondaryColor, fontWeight: FontWeight.w500, fontFamily: "Kanit"),
                    ),
                    SizedBox(height: deviceHeight * .02),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextField(
                            controller: _tfcUsername,
                            hintText: "User Name",
                            keyboardType: TextInputType.name,
                            obscureText: false,
                            focusNode: usernameFocusNode,
                            onFieldSubmitted: (value) {
                              Utils.fieldFocus(context, usernameFocusNode, emailFocusNode);
                            },
                            onValidator: (value) {
                              return value.isEmpty ? 'Please enter your name!' : null;
                            },
                          ),
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
                    SizedBox(height: deviceHeight * .04),
                    Align(
                      alignment: Alignment.center,
                      child: AppButton(
                        text: "SignUp",
                        isLoading: value.isLoading,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            value.signUp(context, _tfcUsername.text, _tfcEmail.text, _tfcPassword.text);
                            log("username: ${_tfcUsername.text} | email: ${_tfcEmail.text} | password: ${_tfcPassword.text}");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
