import 'package:chat_message_app/Res/colors_res.dart';
import 'package:flutter/material.dart';

class ToolView extends StatefulWidget {
  const ToolView({super.key});

  @override
  State<ToolView> createState() => _ToolViewState();
}

class _ToolViewState extends State<ToolView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text("WA Business", style: TextStyle(fontSize: 18.0, color: AppColor.whiteColor, fontWeight: FontWeight.w400, fontFamily: "Kanit")),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined, color: AppColor.whiteColor)),
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
                  child: Text("Short link"),
                ),
                PopupMenuItem(
                  child: Text("Settings"),
                ),
              ];
            },
          )
        ],
      ),
    );
  }
}
