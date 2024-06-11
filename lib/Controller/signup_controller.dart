import 'dart:developer';

import 'package:chat_message_app/Ui/login_view.dart';
import 'package:chat_message_app/Utils/utils.dart';
import 'package:chat_message_app/services/session_manager_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SignupController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void signUp(BuildContext context, String userName, String email, String password) {
    setLoading(true);
    try {
      auth.createUserWithEmailAndPassword(email: email, password: password).then(
        (value) {
          SessionManager().userId = value.user!.uid.toString();
          log('Signup ID :- ${value.user!.uid.toString()}');

          ref.child(value.user!.uid.toString()).set({
            'uid': value.user!.uid.toString(),
            'userName': userName,
            'email': value.user!.email.toString(),
            'phoneNo': '',
            'onlineStatus': 'no-one',
            'profileImg': '',
          }).then(
            (value) {
              setLoading(false);

              Utils.toastMessage(message: "User Created Successfully!");
              Navigator.of(context).pushReplacementNamed(LoginView.routeName);
            },
          ).onError((error, stackTrace) {
            setLoading(false);
            Utils.toastMessage(message: error.toString());
          });
        },
      ).onError((error, stackTrace) {
        setLoading(false);
        Utils.toastMessage(message: error.toString());
      });
    } catch (e) {
      setLoading(false);
      Utils.toastMessage(message: e.toString());
    }
  }
}
