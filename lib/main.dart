import 'package:bokgpt_client/screens/infoscreen/infoscreen.dart';
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
        title: 'bokGpt',
        theme: ThemeData(
          //   primaryColor: Colors.black,
          //   // primarySwatch: Colors.yellow,
          fontFamily: 'pretendard',
        ),
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // Image.asset("assets/images/splash.png"),
                  Text(
                    "bokgPT",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                ],
              )),
          body: MainScreen(),
        ));
  }
}
