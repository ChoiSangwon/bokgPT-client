// import 'package:bokgpt_client/screens/infoscreen/infoscreen.dart';
import 'package:bokgpt_client/screens/detail/detailscreen.dart';
import 'package:bokgpt_client/screens/info/mainscreen.dart';
import 'package:bokgpt_client/screens/login/login.dart';
import 'package:bokgpt_client/screens/login/signUp.dart';
import 'package:bokgpt_client/screens/theme/themescreen.dart';
import 'package:bokgpt_client/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
      getPages: [
        GetPage(name: '/', page: () => MainScreen()),
        GetPage(name: '/theme', page: () => Themescreen()),
        GetPage(name: '/detail', page: () => DetailScreen()),
        GetPage(name: '/signup', page: () => SignUp()),
        GetPage(name: '/signin', page: () => SignIn())
      ],
      theme: ThemeData(
        //   primaryColor: Colors.black,
        //   // primarySwatch: Colors.yellow,
        fontFamily: 'pretendard',
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   title: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: const [
        //       // Image.asset("assets/images/splash.png"),
        //       // Icon(Icons.bulb)
        //       Text(
        //         "bokgPT",
        //         style: TextStyle(
        //           color: Colors.black,
        //           fontWeight: FontWeight.w500,
        //           fontSize: 22,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        body: SignUp(),
      ),
    );
  }
}
