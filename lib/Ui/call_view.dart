import 'package:chat_message_app/Res/colors_res.dart';
import 'package:flutter/material.dart';

class CallView extends StatefulWidget {
  const CallView({super.key});

  @override
  State<CallView> createState() => _CallViewState();
}

class _CallViewState extends State<CallView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text("WA Business", style: TextStyle(fontSize: 18.0, color: AppColor.whiteColor, fontWeight: FontWeight.w400, fontFamily: "Kanit")),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined, color: AppColor.whiteColor)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined, color: AppColor.whiteColor)),
          PopupMenuButton(
            iconColor: AppColor.whiteColor,
            color: AppColor.whiteColor,
            onSelected: (value) {
              // your logic
            },
            useRootNavigator: true,
            tooltip: "More options",
            itemBuilder: (BuildContext bc) {
              return const [
                PopupMenuItem(
                  child: Text("Advertise"),
                ),
                PopupMenuItem(
                  child: Text("Clear call log"),
                ),
                PopupMenuItem(
                  child: Text("Business tools"),
                ),
                PopupMenuItem(
                  child: Text("Settings"),
                ),
              ];
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                // tileColor: Colors.green,
                contentPadding: const EdgeInsets.all(0.0),
                // minVerticalPadding: ,
                onTap: () {},
                leading: const CircleAvatar(
                  radius: 24.0,
                  backgroundColor: AppColor.secondaryColor,
                  child: Icon(Icons.link, color: AppColor.whiteColor),
                ),
                title: const Text(
                  "Create call link",
                  style: TextStyle(fontSize: 16.0, color: AppColor.blackColor, fontWeight: FontWeight.w500, fontFamily: "Kanit"),
                ),
                subtitle: const Text(
                  "Share a link for your Whatsapp call",
                  style: TextStyle(fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w400, fontFamily: "Kanit"),
                ),
              ),
              const Text(
                "Recent",
                style: TextStyle(fontSize: 18.0, color: AppColor.blackColor, fontWeight: FontWeight.w600, fontFamily: "Kanit"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {},
        child: const Icon(Icons.add_call, color: AppColor.whiteColor),
      ),
    );
  }
}
