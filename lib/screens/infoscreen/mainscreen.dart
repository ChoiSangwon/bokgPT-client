import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //나에게 맞는 시설 추천
          Container(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 15),
                  child: const Text(
                    "복지피티",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Text(
                  "한눈에 보는 복지정보",
                  style: TextStyle(
                    color: Color.fromRGBO(131, 131, 131, 1),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.warning,
                              size: 40,
                            ),
                            Text(
                              '아직 서비스 준비중입니다',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Stack(
              children: [
                Container(
                  width: Get.width - 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(240, 241, 249, 1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 0,
                        blurRadius: 5.0,
                        offset:
                            const Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: Get.width - 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.search,
                        size: 40,
                      ),
                      Text(
                        "나에게 맞는 복지서비스 찾기",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //테마별 보기
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(bottom: 10),
                  child: const Text(
                    "테마별 보기",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  width: Get.width - 60,
                  height: 160,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(240, 249, 243, 1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 0,
                        blurRadius: 5.0,
                        offset:
                            const Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(bottom: 10),
                  child: const Text(
                    "최신 게시물",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  width: Get.width - 60,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(249, 248, 240, 1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 0,
                        blurRadius: 5.0,
                        offset:
                            const Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
