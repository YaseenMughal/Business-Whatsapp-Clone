import 'package:chat_message_app/Constant/widget_constant/bottom_navigation_bar.dart';
import 'package:chat_message_app/Controller/forgot_password_controller.dart';
import 'package:chat_message_app/Controller/login_controller.dart';
import 'package:chat_message_app/Controller/signup_controller.dart';
import 'package:chat_message_app/Res/colors_res.dart';
import 'package:chat_message_app/Ui/dashboard_view.dart';
import 'package:chat_message_app/Ui/forgot_password_view.dart';
import 'package:chat_message_app/Ui/login_view.dart';
import 'package:chat_message_app/Ui/popUpMenuItem/Settings_view.dart';
import 'package:chat_message_app/Ui/signup_view.dart';
import 'package:chat_message_app/Ui/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignupController()),
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => ForgotPasswordController()),
      ],
      child: MaterialApp(
        title: 'Chat Message\nClone App',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            scaffoldBackgroundColor: AppColor.whiteColor,
            appBarTheme: const AppBarTheme(
                color: AppColor.primaryColor, titleTextStyle: TextStyle(fontSize: 18.0, color: AppColor.whiteColor, fontWeight: FontWeight.w400, fontFamily: "Kanit"))),
        debugShowCheckedModeBanner: false,
        routes: {
          SplashView.routeName: (BuildContext context) => const SplashView(),
          LoginView.routeName: (BuildContext context) => const LoginView(),
          SignUpView.routeName: (BuildContext context) => const SignUpView(),
          DashboardView.routeName: (BuildContext context) => const DashboardView(),
          BottomNavBar.routeName: (BuildContext context) => const BottomNavBar(),
          SettingView.routeName: (BuildContext context) => const SettingView(),
          ForgotPasswordView.routeName: (BuildContext context) => const ForgotPasswordView(),
          // ForgetView.routeName: (BuildContext context) => const ForgetView(),
          // DashboardView.routeName: (BuildContext context) => const DashboardView(),
          // AppNavigationBar.routeName: (BuildContext context) => const AppNavigationBar(),
        },
      ),
    );
  }
}
