import 'package:chat_message_app/Constant/image_constant.dart';
import 'package:chat_message_app/Res/colors_res.dart';
import 'package:chat_message_app/Ui/HomePopupmenu/Setting_HomePopupmenu/Account/account_view.dart';
import 'package:chat_message_app/Ui/HomePopupmenu/Setting_HomePopupmenu/edit_userProfile_view.dart';
import 'package:chat_message_app/Ui/login_view.dart';
import 'package:chat_message_app/services/session_manager_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SettingView extends StatefulWidget {
  static const routeName = '/setting';
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  // FirebaseDatabase ref = FirebaseDatabase.instance;
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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.all(0.0),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditUserProfileView() )),
                  
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
                const Divider(color: AppColor.subtitleColor),
                // const SizedBox(height: 20.0),
                reusableTile(
                    icon: Icons.today_outlined,
                    title: "Business tools",
                    subtitle: "Profile, catalog, messaging tools",
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
                    }),
                reusableTile(
                    icon: Icons.key_outlined,
                    title: "Account",
                    subtitle: "Security notifications, change number",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccountSettingView()));
                    }),
                reusableTile(
                    icon: Icons.today_outlined,
                    title: "Privacy",
                    subtitle: "Block contacts, disappearing messages",
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
                    }),
                reusableTile(
                    icon: Icons.emoji_emotions_outlined,
                    title: "Avatar",
                    subtitle: "Create, edit, profile photo",
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
                    }),
                reusableTile(
                    icon: Icons.chat_outlined,
                    title: "Chats",
                    subtitle: "Theme, wallpapers, chat history",
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
                    }),
                reusableTile(
                    icon: Icons.notifications_outlined,
                    title: "Notifications",
                    subtitle: "Message, group & call tones",
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
                    }),
                reusableTile(
                    icon: Icons.data_saver_off,
                    title: "Storage & Data",
                    subtitle: "Network usage, auto download",
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
                    }),
                reusableTile(
                    icon: Icons.language_outlined,
                    title: "App language",
                    subtitle: "English (device's language)",
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
                    }),
                reusableTile(
                    icon: Icons.help_outline_rounded,
                    title: "Help",
                    subtitle: "Help center, contact us, privacy policy",
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
                    }),
                reusableTile(
                    icon: Icons.people_alt_outlined,
                    title: "Invite a contact",
                    subtitle: "",
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
                    }),
                // const SizedBox(height: 15.0),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "from",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Kanit",
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Image.asset(AppImage.metaLogo, cacheHeight: 12, color: AppColor.blackColor),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget reusableTile({required IconData icon, required String title, required String subtitle, required void Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.all(0.0),
      leading: Icon(icon, color: Colors.blueGrey),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16.0, color: AppColor.blackColor, fontWeight: FontWeight.w400, fontFamily: "Kanit"),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w300, fontFamily: "Kanit"),
      ),
    );
  }
}
