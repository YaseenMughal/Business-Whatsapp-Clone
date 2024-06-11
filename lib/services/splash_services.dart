import 'dart:async';
import 'package:chat_message_app/Constant/widget_constant/bottom_navigation_bar.dart';
import 'package:chat_message_app/Ui/login_view.dart';
import 'package:chat_message_app/services/session_manager_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    final user = auth.currentUser;
    if (user != null) {
      SessionManager().userId = user.uid.toString();
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacementNamed(BottomNavBar.routeName);
      });
    } else {
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacementNamed(LoginView.routeName);
      });
    }
  }
}
