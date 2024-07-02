import 'package:flutter/material.dart';
import 'package:chat_message_app/Res/colors_res.dart';
import 'package:chat_message_app/Res/component/textField_res.dart';

class EditUserProfileView extends StatefulWidget {
  const EditUserProfileView({super.key});

  @override
  State<EditUserProfileView> createState() => _EditUserStateProfileView();
}

class _EditUserStateProfileView extends State<EditUserProfileView> {
  final TextEditingController _tfcName = TextEditingController();
  final TextEditingController _tfcEmail = TextEditingController();
  final TextEditingController _tfcDescription = TextEditingController();
  final TextEditingController _tfcWebName = TextEditingController();
  final TextEditingController _tfcBio = TextEditingController();
  final TextEditingController _tfcNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.25,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: imageContainer(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                card01(),
                card02(),
                card03(),
                card04(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget imageContainer() {
    double deviceHeight = MediaQuery.of(context).size.height * 1;
    double deviceWidth = MediaQuery.of(context).size.width * 1;
    return Container(
      color: AppColor.whiteColor,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: deviceHeight * .05),
                child: Container(
                  height: deviceHeight * .25,
                  width: deviceWidth,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/user_banner_image.webp"), fit: BoxFit.cover),
                  ),
                  // color: Colors.green,
                ),
              ),
              editBannerImage(context),
            ],
          ),
          Container(
            height: 115,
            width: 115,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              shape: BoxShape.circle,
              border: Border.all(width: 3.0, color: AppColor.whiteColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget reusableTile({
    required IconData icon,
    required String title,
    required TextEditingController controller,
    required String hintTxt,
    bool showDivider = true,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          ListTile(
            onTap: () => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: AppColor.blackColor,
                  title: const Text(
                    "USER PROFILE",
                    style: TextStyle(fontSize: 18.0, color: AppColor.whiteColor, fontWeight: FontWeight.w600, fontFamily: "Kanit"),
                  ),
                  content: AppTextField(
                    controller: controller,
                    hintText: hintTxt,
                    border: BorderRadius.circular(55.0),
                    contentPadding: const EdgeInsets.all(10.0),
                    hintFont: 16.0,
                    hintColor: AppColor.secondaryColor.withOpacity(0.8),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: AppColor.whiteColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Kanit",
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Ok",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.red,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Kanit",
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            contentPadding: const EdgeInsets.all(0.0),
            leading: Icon(icon, color: Colors.blueGrey),
            trailing: const Icon(Icons.edit_outlined, color: Colors.blueGrey),
            title: Text(
              title,
              style: const TextStyle(fontSize: 16.0, color: AppColor.blackColor, fontWeight: FontWeight.w400, fontFamily: "Kanit"),
            ),
          ),
          if (showDivider)
            const Divider(
              color: AppColor.subtitleColor,
            ),
        ],
      ),
    );
  }

  Widget editBannerImage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0, bottom: MediaQuery.of(context).size.height * .05),
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: AppColor.blackColor,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.edit_outlined, color: AppColor.whiteColor),
      ),
    );
  }

  Widget card01() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Card(
        elevation: 4.0,
        color: AppColor.whiteColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "User info",
                style: TextStyle(fontSize: 14.0, fontFamily: "Kanit", fontWeight: FontWeight.w500, color: AppColor.blackColor),
              ),
              reusableTile(icon: Icons.person_outline, title: "User Name", controller: _tfcName, hintTxt: "Your name"),
              reusableTile(icon: Icons.mail_outline, title: "Email", controller: _tfcEmail, hintTxt: "Your email"),
              reusableTile(icon: Icons.today_outlined, title: "Description", controller: _tfcDescription, hintTxt: "Your description"),
              reusableTile(icon: Icons.public_outlined, title: "Website Name", controller: _tfcWebName, hintTxt: "Your website name", showDivider: false),
            ],
          ),
        ),
      ),
    );
  }

  Widget card02() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Card(
        elevation: 4.0,
        color: AppColor.whiteColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Product",
                    style: TextStyle(fontSize: 16.0, color: AppColor.blackColor, fontWeight: FontWeight.w500, fontFamily: "Kanit"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Manage",
                      style: TextStyle(fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w400, fontFamily: "Kanit"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0), color: AppColor.blackColor),
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0), color: AppColor.blackColor),
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0), color: AppColor.blackColor),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget card03() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Card(
        elevation: 4.0,
        color: AppColor.whiteColor,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            child: ListTile(
              leading: const Icon(Icons.link_outlined, color: Colors.blueGrey),
              title: const Text(
                "Facebook or Instagram account",
                style: TextStyle(fontSize: 16.0, color: AppColor.secondaryColor, fontWeight: FontWeight.w400, fontFamily: "Kanit"),
              ),
              onTap: () {},
            )),
      ),
    );
  }

  Widget card04() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Card(
        elevation: 4.0,
        color: AppColor.whiteColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "About and phone number",
                style: TextStyle(fontSize: 14.0, fontFamily: "Kanit", fontWeight: FontWeight.w500, color: AppColor.blackColor),
              ),
              reusableTile(icon: Icons.error_outline, title: "User Bio", controller: _tfcBio, hintTxt: "Your Bio"),
              reusableTile(icon: Icons.phone_outlined, title: "Number", controller: _tfcNumber, hintTxt: "Your number", showDivider: false),
            ],
          ),
        ),
      ),
    );
  }
}
