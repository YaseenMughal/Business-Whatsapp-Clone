import 'dart:developer';

import 'package:chat_message_app/Res/colors_res.dart';
import 'package:chat_message_app/Ui/login_view.dart';
import 'package:chat_message_app/services/session_manager_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class AccountSettingView extends StatelessWidget {
  AccountSettingView({super.key});

  List<Map<String, dynamic>> dataList = [
    {'icon': Icons.security_outlined, 'text': "Security notifications"},
    {'icon': Icons.personal_injury_sharp, 'text': "Passkeys"},
    {'icon': Icons.mail_outline, 'text': "Email address"},
    {'icon': Icons.password_outlined, 'text': "Two step verification"},
    {'icon': Icons.send_to_mobile_outlined, 'text': "Change number"},
    {'icon': Icons.description_outlined, 'text': "Request account info"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.whiteColor),
        backgroundColor: AppColor.primaryColor,
        title: const Text("Account", style: TextStyle(fontSize: 18.0, color: AppColor.whiteColor, fontWeight: FontWeight.w400, fontFamily: "Kanit")),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .42,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    leading: Icon(dataList[index]['icon']),
                    title: Text(dataList[index]['text']),
                  );
                },
              ),
            ),
            ListTile(
              onTap: () => showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: AppColor.blackColor,
                    title: const Text("DELETE ACCOUNT", style: TextStyle(fontSize: 18.0, color: AppColor.whiteColor, fontWeight: FontWeight.w600, fontFamily: "Kanit")),
                    content: Text("Are you sure to delete an account?",
                        style: TextStyle(fontSize: 14.0, color: AppColor.subtitleColor.withOpacity(0.8), fontWeight: FontWeight.w400, fontFamily: "Kanit")),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop;
                          },
                          child: const Text("Cancel", style: TextStyle(fontSize: 16.0, color: AppColor.whiteColor, fontWeight: FontWeight.w400, fontFamily: "Kanit"))),
                      TextButton(
                          onPressed: () {
                            FirebaseAuth auth = FirebaseAuth.instance;
                            auth.signOut().then((value) {
                              SessionManager().userId = '';
                              Navigator.of(context).pushReplacementNamed(LoginView.routeName);
                            });
                            log(SessionManager().userId.toString());
                          },
                          child: const Text("Ok", style: TextStyle(fontSize: 16.0, color: Colors.red, fontWeight: FontWeight.w400, fontFamily: "Kanit")))
                    ],
                  );
                },
              ),
              contentPadding: const EdgeInsets.all(0.0),
              leading: const Icon(Icons.delete_outline, color: Colors.red),
              title: const Text(
                "Delete account",
                style: TextStyle(fontSize: 16.0, color: Colors.red, fontWeight: FontWeight.w500, fontFamily: "Kanit"),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
