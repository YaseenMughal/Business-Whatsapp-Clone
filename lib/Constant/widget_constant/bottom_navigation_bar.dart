import 'package:chat_message_app/Res/colors_res.dart';
import 'package:chat_message_app/Ui/call_view.dart';
import 'package:chat_message_app/Ui/dashboard_view.dart';
import 'package:chat_message_app/Ui/status_view.dart';
import 'package:chat_message_app/Ui/tool_view.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  static const routeName = '/bottomNavBar';
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  List screens = [
    const DashboardView(),
    const CallView(),
    const StatusView(),
    const ToolView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() => currentIndex = value),
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.blackColor.withOpacity(0.5),
        selectedLabelStyle: const TextStyle(fontSize: 14.0, color: AppColor.primaryColor, fontWeight: FontWeight.w500, fontFamily: "Kanit"),
        unselectedLabelStyle: const TextStyle(fontSize: 12.0, color: AppColor.blackColor, fontWeight: FontWeight.w400, fontFamily: "Kanit"),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 10.0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: "Chats", tooltip: "Chats", activeIcon: Icon(Icons.chat)),
          BottomNavigationBarItem(icon: Icon(Icons.call_outlined), label: "Calls", tooltip: "Calls", activeIcon: Icon(Icons.call)),
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: "Updates", tooltip: "Updates", activeIcon: Icon(Icons.message)),
          BottomNavigationBarItem(icon: Icon(Icons.today_outlined), label: "Tools", tooltip: "Tools", activeIcon: Icon(Icons.today)),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
