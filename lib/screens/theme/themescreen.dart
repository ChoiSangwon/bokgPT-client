import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Themescreen extends StatefulWidget {
  const Themescreen({super.key});

  @override
  State<Themescreen> createState() => _ThemescreenState();
}

class _ThemescreenState extends State<Themescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ThemeHeader(),
          ],
        ),
      ),
    );
  }
}

class ThemeHeader extends StatefulWidget {
  const ThemeHeader({super.key});

  @override
  State<ThemeHeader> createState() => _ThemeHeaderState();
}

class _ThemeHeaderState extends State<ThemeHeader> {
  int selectedItemIndex = -1;
  List<bool> isSelectedList = List.generate(14, (_) => false);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: ListView.separated(
        scrollDirection: Axis.horizontal, // 가로 스크롤 방향 설정
        itemCount: 14, // 생성할 위젯의 개수
        separatorBuilder: (context, index) {
          return SizedBox(width: 15); // 각 아이템 사이 간격 설정
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
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
                    ? Color.fromRGBO(176, 185, 255, 1)
                    : Color.fromRGBO(233, 233, 233, 1),
                borderRadius: BorderRadius.all(Radius.circular(15)),
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
                      return Icons.accessibility;
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
                      return "입양위탁";
                    }(),
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
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

class _ThemeListState extends State<ThemeList> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
