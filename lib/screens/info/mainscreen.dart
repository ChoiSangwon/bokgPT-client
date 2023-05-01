import 'package:bokgpt_client/screens/theme/themescreen.dart';
import 'package:bokgpt_client/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:bokgpt_client/env/env.dart";
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bokgpt_client/widget/widgets.dart';
import 'package:bokgpt_client/models/themelist.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          //나에게 맞는 시설 추천
          RecommendBokji(),
          //테마별 보기
          ThemeBokji(),
          //최신 게시물
          communityBokji(),
        ],
      )),
    );
  }
}

class RecommendBokji extends StatefulWidget {
  const RecommendBokji({super.key});

  @override
  State<RecommendBokji> createState() => _RecommendBokjiState();
}

class _RecommendBokjiState extends State<RecommendBokji> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                      offset: const Offset(2, 2), // changes position of shadow
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
      ],
    );
  }
}

var ThemeList1 = [
  {"name": "신체건강", "Icon": Icons.health_and_safety},
  {"name": "서민금융", "Icon": Icons.money},
  {"name": "임신출산", "Icon": Icons.pregnant_woman},
  {"name": "주거", "Icon": Icons.health_and_safety},
  {"name": "보호돌봄", "Icon": Icons.health_and_safety},
  {"name": "문화여가", "Icon": Icons.health_and_safety},
];

class ThemeBokji extends StatefulWidget {
  const ThemeBokji({super.key});

  @override
  State<ThemeBokji> createState() => _ThemeBokjiState();
}

class _ThemeBokjiState extends State<ThemeBokji> {
  List<InterestTheme> _data = [];
  @override
  Future<void> _fetchData(int themeId) async {
    final response = await http.get(Uri.parse(
        '${ENV.apiEndpoint}/welfares/interest-themes/${themeId}?page=0&size=10&sort=string'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes))["content"]
          as List<dynamic>;
      // print(jsonData);
      final List<InterestTheme> data = jsonData
          .map((e) => InterestTheme.fromJson(e as Map<String, dynamic>))
          .toList();
      setState(() {
        _data = data;
      });
      print(data);
    } else {
      throw Exception('Failed to load data from endpoint.');
    }
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
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
                height: 180,
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
                      offset: const Offset(2, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: 550,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 520,
                          height: 75,
                          margin: EdgeInsets.only(bottom: 5),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal, // 가로 스크롤 방향 설정
                            itemCount: 7, // 생성할 위젯의 개수
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 15); // 각 아이템 사이 간격 설정
                            },
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        child: SizedBox(
                                          child: Text("$index"),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  width: 60,
                                  height: 70,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        () {
                                          if (index == 0) {
                                            return Icons.health_and_safety;
                                          }
                                          if (index == 1) {
                                            return Icons.money;
                                          }
                                          if (index == 2) {
                                            return Icons.pregnant_woman;
                                          }
                                          if (index == 3) {
                                            return Icons.home;
                                          }
                                          if (index == 4) {
                                            return Icons.volunteer_activism;
                                          }
                                          if (index == 5) {
                                            return Icons.work;
                                          }
                                          return Icons.movie;
                                        }(),
                                        size: 50,
                                      ),
                                      Text(
                                        () {
                                          if (index == 0) {
                                            return "신체건강";
                                          }
                                          if (index == 1) {
                                            return "서민금융";
                                          }
                                          if (index == 2) {
                                            return "임신출산";
                                          }
                                          if (index == 3) {
                                            return "주거";
                                          }
                                          if (index == 4) {
                                            return "보호돌봄";
                                          }
                                          if (index == 5) {
                                            return "일자리";
                                          }
                                          return "문화여가";
                                        }(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: 520,
                          height: 75,
                          margin: EdgeInsets.only(top: 5),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal, // 가로 스크롤 방향 설정
                            itemCount: 7, // 생성할 위젯의 개수
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 15); // 각 아이템 사이 간격 설정
                            },
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  await _fetchData(index + 1);
                                  print(_data);
                                  Get.toNamed('/theme', arguments: _data);
                                  // showDialog(
                                  //   context: context,
                                  //   builder: (context) {
                                  //     return Dialog(
                                  //       child: SizedBox(
                                  //         child: Text("${index + 7}"),
                                  //       ),
                                  //     );
                                  //   },
                                  // );
                                },
                                child: Container(
                                  width: 60,
                                  height: 70,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        () {
                                          if (index == 0) {
                                            return Icons.warning;
                                          }
                                          if (index == 1) {
                                            return Icons.baby_changing_station;
                                          }
                                          if (index == 2) {
                                            return Icons.book;
                                          }
                                          if (index == 3) {
                                            return Icons.tag_faces_rounded;
                                          }
                                          if (index == 4) {
                                            return Icons.account_balance;
                                          }
                                          if (index == 5) {
                                            return Icons.handyman;
                                          }
                                          return Icons.accessibility;
                                        }(),
                                        size: 50,
                                      ),
                                      Text(
                                        () {
                                          if (index == 0) {
                                            return "안전위기";
                                          }
                                          if (index == 1) {
                                            return "보육";
                                          }
                                          if (index == 2) {
                                            return "교육";
                                          }
                                          if (index == 3) {
                                            return "정신건강";
                                          }
                                          if (index == 4) {
                                            return "법률";
                                          }
                                          if (index == 5) {
                                            return "생활지원";
                                          }
                                          return "입양위탁";
                                        }(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class communityBokji extends StatefulWidget {
  const communityBokji({super.key});

  @override
  State<communityBokji> createState() => _communityBokjiState();
}

class _communityBokjiState extends State<communityBokji> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                      offset: const Offset(2, 2), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
