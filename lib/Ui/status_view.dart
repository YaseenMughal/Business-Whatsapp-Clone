import 'package:chat_message_app/Res/colors_res.dart';
import 'package:flutter/material.dart';

class StatusView extends StatefulWidget {
  const StatusView({super.key});

  @override
  State<StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {},
        child: const Icon(Icons.camera_alt, color: AppColor.whiteColor),
      ),
    );
  }
}
