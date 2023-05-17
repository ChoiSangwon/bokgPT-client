import 'package:bokgpt_client/widget/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import "package:bokgpt_client/env/env.dart";
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bokgpt_client/models/themelist.dart';
import 'package:bokgpt_client/models/detailData.dart';

class Themescreen extends StatefulWidget {
  const Themescreen({super.key});

  @override
  State<Themescreen> createState() => _ThemescreenState();
}

class _ThemescreenState extends State<Themescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            ThemeHeader(
              onDataChanged: (data) {
                // onDataChanged 콜백 추가
                setState(() {
                  _data = data; // _data 변경
                });
              },
            ),
            ThemeList(),
          ],
        ),
      ),
    );
  }
}

class ThemeHeader extends StatefulWidget {
  final void Function(List<InterestTheme>) onDataChanged;

  const ThemeHeader({super.key, required this.onDataChanged});
  @override
  State<ThemeHeader> createState() => _ThemeHeaderState();
}

List<InterestTheme> _data = Get.arguments[0];

class _ThemeHeaderState extends State<ThemeHeader> {
  int selectedItemIndex = Get.arguments[1];
  List<bool> isSelectedList =
      List.generate(15, (index) => index == Get.arguments[1] ? true : false);

  Future<void> _fetchData(int themeId) async {
    final response = await http.get(Uri.parse(
        '${ENV.apiEndpoint}/welfares/interest-themes/${themeId}?page=0&size=10&sort=string'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes))["content"]
          as List<dynamic>;
      print(jsonData);
      final List<InterestTheme> data = jsonData
          .map((e) => InterestTheme.fromJson(e as Map<String, dynamic>))
          .toList();
      setState(() {
        _data = data;
      });
      // print(_data);
      widget.onDataChanged(data);
    } else {
      throw Exception('Failed to load data from endpoint.');
    }
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollToSelectedItem();
    });
  }

  void _scrollToSelectedItem() {
    final double itemWidth = 50; // 각 아이템의 너비
    final double separatorWidth = 15; // 각 아이템 사이 간격의 너비
    final double scrollPosition = (itemWidth + separatorWidth) *
        selectedItemIndex; // 선택된 인덱스에 해당하는 스크롤 위치
    _scrollController.jumpTo(scrollPosition);
  }

  @override
  Widget build(BuildContext context) {
    // print(_data);
    return Container(
      height: 90,
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: ListView.separated(
        scrollDirection: Axis.horizontal, // 가로 스크롤 방향 설정
        itemCount: 15, // 생성할 위젯의 개수
        controller: _scrollController,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 15); // 각 아이템 사이 간격 설정
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _fetchData(index + 1);
              setState(() {
                // 선택된 인덱스 저장
                selectedItemIndex = index;
                // 모든 아이템의 선택 상태를 false로 초기화
                isSelectedList.fillRange(0, isSelectedList.length, false);
                // 선택한 아이템의 선택 상태를 true로 변경
                isSelectedList[index] = true;
              });
            },
            child: Container(
              width: 60,
              height: 70,
              decoration: BoxDecoration(
                color: isSelectedList[index]
                    ? const Color.fromRGBO(176, 185, 255, 1)
                    : const Color.fromRGBO(233, 233, 233, 1),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
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
                      if (index == 6) {
                        return Icons.movie;
                      }
                      if (index == 7) {
                        return Icons.warning;
                      }
                      if (index == 8) {
                        return Icons.baby_changing_station;
                      }
                      if (index == 9) {
                        return Icons.book;
                      }
                      if (index == 10) {
                        return Icons.tag_faces_rounded;
                      }
                      if (index == 11) {
                        return Icons.account_balance;
                      }
                      if (index == 12) {
                        return Icons.handyman;
                      }
                      if (index == 13) {
                        return Icons.accessibility;
                      }
                      return Icons.e_mobiledata;
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
                        return "서민금융";
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
                      if (index == 6) {
                        return "문화여가";
                      }
                      if (index == 7) {
                        return "안전위기";
                      }
                      if (index == 8) {
                        return "보육";
                      }
                      if (index == 9) {
                        return "교육";
                      }
                      if (index == 10) {
                        return "정신건강";
                      }
                      if (index == 11) {
                        return "법률";
                      }
                      if (index == 12) {
                        return "생활지원";
                      }
                      if (index == 13) {
                        return "입양위탁";
                      }
                      return "기타";
                    }(),
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ThemeList extends StatefulWidget {
  const ThemeList({super.key});

  @override
  State<ThemeList> createState() => _ThemeListState();
}

class NewsArticle {
  final String title;
  final String summary;
  NewsArticle({required this.title, required this.summary});
}

class _ThemeListState extends State<ThemeList> {
  late DetailData _detData;
  Future fetchDetailData(int detailId) async {
    final response =
        await http.get(Uri.parse('${ENV.apiEndpoint}/welfares/${detailId}'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      DetailData tmp = DetailData.fromJson(jsonData);
      print(jsonData);
      // print(tmp.id);
      _detData = tmp;
      // setState(() {
      //   _detData = jsonData;
      // });
      // print(_detData);
    } else {
      throw Exception('Failed to load detail data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child:
            // height: Get.height - 166,
            ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async {
                await fetchDetailData(_data[index].id);
                Get.toNamed('/detail', arguments: _detData);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: Container(
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _data[index].title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        _data[index].title,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
