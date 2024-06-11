import 'package:chat_message_app/Res/colors_res.dart';
import 'package:chat_message_app/Res/component/button_res.dart';
import 'package:chat_message_app/Ui/popUpMenuItem/Settings_view.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  static const routeName = '/home';

  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final List bloodGroup = ['O+', 'O-', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'Not Known'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            tooltip: "More options",
            itemBuilder: (BuildContext bc) {
              return [
                const PopupMenuItem(
                  child: Text("Advertise"),
                ),
                const PopupMenuItem(
                  child: Text("Business tools"),
                ),
                const PopupMenuItem(
                  child: Text("New group"),
                ),
                const PopupMenuItem(
                  child: Text("New broadcast"),
                ),
                const PopupMenuItem(
                  child: Text("Communities"),
                ),
                const PopupMenuItem(
                  child: Text("Labels"),
                ),
                const PopupMenuItem(
                  child: Text("Linked devices"),
                ),
                const PopupMenuItem(
                  child: Text("Starred messages"),
                ),
                PopupMenuItem(
                  onTap: () => Navigator.of(context).pushNamed(SettingView.routeName),
                  child: const Text("Settings"),
                ),
              ];
            },
          )
          // IconButton(onPressed: () {
          //   PopupMenuButton(
          //     elevation: 2.0,
          //     itemBuilder: (context) {
          //       return Ca
          //     },)
          //   // DropdownMenu(
          //   //           enabled: true,
          //   //           // controller: _tfcDonorBloodGroup,
          //   //           enableSearch: true,
          //   //           // width: deviceWidth * .94,
          //   //           label: Text(
          //   //             "Select Blood Group",
          //   //             style: TextStyle(fontSize: 14, color: AppColor.greyColor, fontFamily: "Ubuntu", fontWeight: FontWeight.w500),
          //   //           ),
          //   //           trailingIcon: const Icon(Icons.keyboard_arrow_down_outlined),
          //   //           // dropdownMenuEntries: bloodDonorProvider.bloodGroup.map<DropdownMenuEntry<String>>((bloodGroup) {
          //   //           //   return DropdownMenuEntry<String>(value: bloodGroup, label: bloodGroup);
          //   //           // }).toList(),
          //   //         ),
          // }, icon: const Icon(Icons.more_vert_outlined, color: AppColor.whiteColor)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {},
        child: const Icon(Icons.add_box, color: AppColor.whiteColor),
      ),
    );
  }
}
