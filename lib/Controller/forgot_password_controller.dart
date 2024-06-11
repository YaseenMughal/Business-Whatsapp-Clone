import 'package:chat_message_app/Ui/login_view.dart';
import 'package:chat_message_app/Utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void forgotPassword(BuildContext context, String email) {
    setLoading(true);
    try {
      auth.sendPasswordResetEmail(email: email).then((value) {
        setLoading(false);
        Navigator.of(context).pushReplacementNamed(LoginView.routeName);
        Utils.toastMessage(message: "Please check your email\nto recover your password!");
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
