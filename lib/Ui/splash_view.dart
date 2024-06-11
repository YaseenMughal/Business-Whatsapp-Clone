import 'package:chat_message_app/Constant/image_constant.dart';
import 'package:chat_message_app/Constant/widget_constant/bottom_navigation_bar.dart';
import 'package:chat_message_app/Ui/dashboard_view.dart';
import 'package:chat_message_app/Ui/login_view.dart';
import 'package:chat_message_app/services/splash_services.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  static const routeName = "/";

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  SplashServices services = SplashServices();

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        services.isLogin(context);
        // _navigateToNextScreen();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // _navigateToNextScreen() async {
  //   await Future.delayed(
  //     const Duration(seconds: 3),
  //     () => Navigator.of(context).pushReplacementNamed(BottomNavBar.routeName),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FadeTransition(
        opacity: _animation,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(
                  AppImage.mainLogo,
                  height: MediaQuery.of(context).size.height * .25,
                  width: MediaQuery.of(context).size.width * .25,
                  alignment: Alignment.center,
                ),
                const Spacer(),
                Column(
                  children: [
                    const Text(
                      "from",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Kanit",
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Image.asset(AppImage.metaLogo, cacheHeight: 15),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
