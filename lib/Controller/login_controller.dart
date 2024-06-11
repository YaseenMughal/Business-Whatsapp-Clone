import 'dart:developer';

import 'package:chat_message_app/Constant/widget_constant/bottom_navigation_bar.dart';
import 'package:chat_message_app/Utils/utils.dart';
import 'package:chat_message_app/services/session_manager_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void login(BuildContext context, String email, String password) {
    setLoading(true);
    try {
      auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
        SessionManager().userId = value.user!.uid.toString();
        log('login ID :- ${value.user!.uid.toString()}');

        setLoading(false);
        Utils.toastMessage(message: "Login Successfully!");
        Navigator.of(context).pushReplacementNamed(BottomNavBar.routeName);
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.toastMessage(message: error.toString());
      });
    } catch (e) {
      setLoading(false);
      Utils.toastMessage(message: e.toString());
    }
  }
}
