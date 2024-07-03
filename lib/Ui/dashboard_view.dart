import 'package:chat_message_app/Constant/widget_constant/image_widget.dart';
import 'package:chat_message_app/Res/colors_res.dart';
import 'package:chat_message_app/Ui/HomePopupmenu/setting_view.dart';
import 'package:chat_message_app/Ui/user_chat_view.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  static const routeName = '/home';

  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> chatMessages = [
    {
      "image":
          "https://media.istockphoto.com/id/1485546774/photo/bald-man-smiling-at-camera-standing-with-arms-crossed.jpg?s=2048x2048&w=is&k=20&c=lOzPMobIPDUrcWRa1JRl4lyhIHBt8H18SB6sC9YXoys=",
      "name": "John Steve",
      "message": "Hi, give me 5 mins more.",
      "totalMsg": "7",
      "time": "12:08 am",
    },
    {
      "image":
          "https://img.freepik.com/free-photo/bohemian-man-with-his-arms-crossed_1368-3542.jpg?t=st=1715083730~exp=1715087330~hmac=4976c0f18697a2b47cfc5c9e07c348471a9d3a4ff96d08c9ec599ec24fc2b168&w=740",
      "name": "Alex Charls",
      "message": "Nice to meet you, Buddy!",
      "totalMsg": "1",
      "time": "2:02 pm",
    },
    {
      "image":
          "https://img.freepik.com/free-photo/guy-plaid-shirt_158595-125.jpg?t=st=1715084069~exp=1715087669~hmac=9854a92bc8ccf285b7ec5efa8591f94906599a204f47cf4ddd888118bbe423ba&w=740",
      "name": "Ghuru Radheev",
      "message": "File send krdena mujhe yd se",
      "totalMsg": "3",
      "time": "12: 58 am",
    },
    {
      "image": "https://img.freepik.com/premium-photo/handsome-young-man-walk-town_178605-605.jpg?w=740",
      "name": "Daniel Bay",
      "message": "No problem, I'll fix it.",
      "totalMsg": "1",
      "time": "7:14 pm",
    },
    {
      "image": "https://as2.ftcdn.net/v2/jpg/08/01/15/47/1000_F_801154773_V09vuneqSWwHeIllxDdFUvULQJneZKQY.jpg",
      "name": "Mark Zenss",
      "message": "Sent \$10000",
      "totalMsg": "0",
      "time": "3:45 am",
    },
    {
      "image":
          "https://media.istockphoto.com/id/1485546774/photo/bald-man-smiling-at-camera-standing-with-arms-crossed.jpg?s=2048x2048&w=is&k=20&c=lOzPMobIPDUrcWRa1JRl4lyhIHBt8H18SB6sC9YXoys=",
      "name": "John Steve",
      "message": "Hi, give me 5 mins more.",
      "totalMsg": "7",
      "time": "12:08 am",
    },
    {
      "image":
          "https://img.freepik.com/free-photo/bohemian-man-with-his-arms-crossed_1368-3542.jpg?t=st=1715083730~exp=1715087330~hmac=4976c0f18697a2b47cfc5c9e07c348471a9d3a4ff96d08c9ec599ec24fc2b168&w=740",
      "name": "Alex Charls",
      "message": "Nice to meet you, Buddy!",
      "totalMsg": "1",
      "time": "2:02 pm",
    },
    {
      "image":
          "https://img.freepik.com/free-photo/guy-plaid-shirt_158595-125.jpg?t=st=1715084069~exp=1715087669~hmac=9854a92bc8ccf285b7ec5efa8591f94906599a204f47cf4ddd888118bbe423ba&w=740",
      "name": "Ghuru Radheev",
      "message": "File send krdena mujhe yd se",
      "totalMsg": "3",
      "time": "12: 58 am",
    },
    {
      "image": "https://img.freepik.com/premium-photo/handsome-young-man-walk-town_178605-605.jpg?w=740",
      "name": "Daniel Bay",
      "message": "No problem, I'll fix it.",
      "totalMsg": "1",
      "time": "7:14 pm",
    },
    {
      "image": "https://as2.ftcdn.net/v2/jpg/08/01/15/47/1000_F_801154773_V09vuneqSWwHeIllxDdFUvULQJneZKQY.jpg",
      "name": "Mark Zenss",
      "message": "Sent \$10000, You got it or not if you not call me back",
      "totalMsg": "0",
      "time": "3:45 am",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height * 1;
    double deviceWidth = MediaQuery.of(context).size.width * 1;

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
              if (value == 'Settings') {
                Navigator.of(context).pushNamed(SettingView.routeName);
              }
            },
            tooltip: "More options",
            itemBuilder: (BuildContext bc) {
              return [
                const PopupMenuItem(
                  value: 'Advertise',
                  child: Text("Advertise"),
                ),
                const PopupMenuItem(
                  value: 'Business tools',
                  child: Text("Business tools"),
                ),
                const PopupMenuItem(
                  value: 'New group',
                  child: Text("New group"),
                ),
                const PopupMenuItem(
                  value: 'New broadcast',
                  child: Text("New broadcast"),
                ),
                const PopupMenuItem(
                  value: 'Communities',
                  child: Text("Communities"),
                ),
                const PopupMenuItem(
                  value: 'Labels',
                  child: Text("Labels"),
                ),
                const PopupMenuItem(
                  value: 'Linked devices',
                  child: Text("Linked devices"),
                ),
                const PopupMenuItem(
                  value: 'Starred messages',
                  child: Text("Starred messages"),
                ),
                const PopupMenuItem(
                  value: 'Settings',
                  child: Text("Settings"),
                ),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TabBar(
              labelColor: AppColor.blackColor,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(color: AppColor.blackColor, fontSize: 16, fontFamily: "Kanit", fontWeight: FontWeight.w500),
              unselectedLabelStyle: const TextStyle(color: AppColor.primaryColor, fontSize: 14, fontFamily: "Kanit", fontWeight: FontWeight.w400),
              isScrollable: true,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              labelPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              tabAlignment: TabAlignment.start,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              controller: _tabController,
              tabs: [
                tabContainer(text: "All"),
                tabContainer(text: "Unread"),
                tabContainer(text: "Groups"),
              ],
            ),
            Expanded(
              child: SizedBox(
                height: deviceHeight,
                width: deviceWidth,
                // color: AppColor.secondaryColor,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    allUserChat(),
                    _buildTabContent("Unread Messages"),
                    _buildTabContent("Group's Messages"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {},
        child: const Icon(Icons.add_box, color: AppColor.whiteColor),
      ),
    );
  }

  Widget tabContainer({required String text}) {
    return Container(
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.grey[200],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
          child: Text(text, style: const TextStyle(color: Colors.grey)),
        ));
  }

  Widget allUserChat() {
    return ListView.builder(
      itemCount: chatMessages.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  UserChatView(name: chatMessages[index]["name"] ?? '', image:chatMessages[index]["image"] ?? '' ,)));
          },
          contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
          leading: InkWell(
            onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: InteractiveViewer(
                          minScale: 1.0,
                          maxScale: 6.0,
                          child: ImageBuilderWidget(height: MediaQuery.of(context).size.height * .3, width: double.infinity, image: chatMessages[index]['image'] ?? '')),
                    )),
            child: CircleAvatar(
              radius: 30,
              child: ImageBuilderWidget(height: 60, width: 50, image: chatMessages[index]['image'] ?? ''),
            ),
          ),
          title: Text(
            chatMessages[index]["name"] ?? '',
            style: const TextStyle(fontSize: 16, color: AppColor.blackColor, fontWeight: FontWeight.w700, fontFamily: "Ubuntu"),
          ),
          subtitle: Text(
            chatMessages[index]["message"] ?? '',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, color: AppColor.greyColor, fontWeight: FontWeight.w500, fontFamily: "Ubuntu"),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                chatMessages[index]["time"] ?? '',
                style: const TextStyle(fontSize: 10, color: AppColor.greyColor, fontWeight: FontWeight.w500, fontFamily: "Ubuntu"),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(color: AppColor.secondaryColor, shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    chatMessages[index]["totalMsg"] ?? '',
                    style: const TextStyle(fontSize: 12, color: AppColor.whiteColor, fontWeight: FontWeight.w500, fontFamily: "Ubuntu"),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabContent(String content) {
    return Center(
      child: Text(
        content,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
