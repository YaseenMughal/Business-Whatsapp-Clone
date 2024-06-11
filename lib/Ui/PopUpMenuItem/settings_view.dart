import 'package:chat_message_app/Res/colors_res.dart';
import 'package:chat_message_app/Ui/login_view.dart';
import 'package:chat_message_app/services/session_manager_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingView extends StatefulWidget {
  static const routeName = '/setting';
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColor.whiteColor),
          backgroundColor: AppColor.primaryColor,
          title: const Text("Settings", style: TextStyle(fontSize: 18.0, color: AppColor.whiteColor, fontWeight: FontWeight.w400, fontFamily: "Kanit")),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_outlined,
                  color: AppColor.whiteColor,
                )),
          ]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0.0),
                onTap: () {},
                leading: const CircleAvatar(
                  radius: 24.0,
                  backgroundColor: AppColor.secondaryColor,
                  child: Icon(Icons.person_outline, color: AppColor.whiteColor),
                ),
                title: const Text(
                  "User Name",
                  style: TextStyle(fontSize: 16.0, color: AppColor.blackColor, fontWeight: FontWeight.w500, fontFamily: "Kanit"),
                ),
                subtitle: const Text(
                  "User Bio",
                  style: TextStyle(fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w400, fontFamily: "Kanit"),
                ),
                trailing: const Icon(
                  Icons.qr_code_scanner_outlined,
                  color: AppColor.secondaryColor,
                ),
              ),
              const SizedBox(height: 20.0),
              IconButton(
                  onPressed: () {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    auth.signOut().then((value) {
                      SessionManager().userId = '';
                      Navigator.of(context).pushReplacementNamed(LoginView.routeName);
                    });
                  },
                  icon: const Icon(Icons.logout_outlined, color: Colors.red))
            ],
          ),
        ),
      ),
    );
  }
}
