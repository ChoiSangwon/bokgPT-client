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
        color: Colors.white,
        child: Column(
          children: [
            ThemeHeader(),
            ThemeList(),
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
  final List<NewsArticle> articles = [
    NewsArticle(title: "서울시 재난 지원금", summary: "현금지급"),
    NewsArticle(title: "Article 2", summary: "Summary 2"),
    NewsArticle(title: "Article 3", summary: "Summary 3"),
    NewsArticle(title: "Article 4", summary: "Summary 4"),
    NewsArticle(title: "Article 5", summary: "Summary 5"),
    NewsArticle(title: "Article 6", summary: "Summary 6"),
    NewsArticle(title: "Article 7", summary: "Summary 7"),
    NewsArticle(title: "Article 8", summary: "Summary 8"),
    NewsArticle(title: "Article 9", summary: "Summary 9"),
    NewsArticle(title: "Article 10", summary: "Summary 10"),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child:
            // height: Get.height - 166,
            ListView.builder(
          itemCount: articles.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // 아이템을 클릭했을 때 수행할 작업
                print("Clicked article $index");
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      articles[index].title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      articles[index].summary,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
