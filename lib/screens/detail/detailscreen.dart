import 'package:bokgpt_client/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import "package:bokgpt_client/env/env.dart";
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bokgpt_client/models/detailData.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

var data = {
  "id": 316,
  "serviceId": "WLF00003258",
  "serviceTitle": "아동발달지원계좌(디딤씨앗통장)지원",
  "startDate": "2009-01-01",
  "endDate": "9999-12-31",
  "department": "아동권리과",
  "summary": "취약계층 아동의 사회진출 시 학자금･취업･창업･주거마련 등에 소요되는 초기비용 마련을 위한 자산형성을 지원합니다.",
  "supportedBy":
      "아동발달지원계좌(디딤씨앗통장) 지원대상은 다음과 같습니다.\n\n\n\n\n(보호대상아동) 만 18세 미만의 아동복지시설(아동양육시설, 공동생활가정) 보호아동, 가정위탁 보호아동, 장애인생활시설 아동, 소년소녀가정 아동\n\n\n(기초생활수급가구 아동) 중위소득 40% 이하의 수급 가구(생계, 의료 급여)의 만12세부터 만17세까지 아동 중 신규 선정하여 만18세 미만까지 지원\n\n\n(기 가입 아동 중 가정복귀 및 탈수급가구 아동)\n\n\n- 보호대상아동이 가정회복으로 중도에 가정으로 복귀하는 아동도 계속 지원\n\n\n- 기초생활수급가구 아동 또한, 해당 가정이 중위소득 40%를 초과해도 계속 지원\n\n\n\n\n정부(지자체)의 유사 자산형성지원사업과 중복 지원이 불가합니다.\n\n\n\n희망플러스(서울시), 꿈나래(서울시) 통장 등과 중복지원 금지\n\n\n서울시는\n꿈나래통장\n 사업과 지원가구 중복 가능성을 고려하여 기초수급자 아동 사업지역에서 제외\n\n\n다만, 지원대상 및 사업취지를 고려하여,\n희망키움통장\n과는 중복지원 가능('13.1.1~)",
  "selectionCriteria": "지원대상의 내용을 참고해주시기 바랍니다.",
  "serviceContent":
      "아동발달지원계좌(디딤씨앗통장) 지원대상은 다음과 같습니다.\n\n\n\n\n(보호대상아동) 만 18세 미만의 아동복지시설(아동양육시설, 공동생활가정) 보호아동, 가정위탁 보호아동, 장애인생활시설 아동, 소년소녀가정 아동\n\n\n(기초생활수급가구 아동) 중위소득 40% 이하의 수급 가구(생계, 의료 급여)의 만12세부터 만17세까지 아동 중 신규 선정하여 만18세 미만까지 지원\n\n\n(기 가입 아동 중 가정복귀 및 탈수급가구 아동)\n\n\n- 보호대상아동이 가정회복으로 중도에 가정으로 복귀하는 아동도 계속 지원\n\n\n- 기초생활수급가구 아동 또한, 해당 가정이 중위소득 40%를 초과해도 계속 지원\n\n\n\n\n정부(지자체)의 유사 자산형성지원사업과 중복 지원이 불가합니다.\n\n\n\n희망플러스(서울시), 꿈나래(서울시) 통장 등과 중복지원 금지\n\n\n서울시는\n꿈나래통장\n 사업과 지원가구 중복 가능성을 고려하여 기초수급자 아동 사업지역에서 제외\n\n\n다만, 지원대상 및 사업취지를 고려하여,\n희망키움통장\n과는 중복지원 가능('13.1.1~)",
  "lastModifiedAt": "2023-03-28",
  "detailLink":
      "https://www.bokjiro.go.kr/ssis-teu/twataa/wlfareInfo/moveTWAT52011M.do?wlfareInfoId=WLF00003258",
  "view": 135610,
  "location": {"id": 1, "main": "정부", "detail": "정부"},
  "supportCycle": {"id": 2, "cycle": "월"},
  "homeTypes": [
    {"id": 6, "type": "저소득"}
  ],
  "interestThemes": [
    {"id": 2, "theme": "서민금융"},
    {"id": 14, "theme": "입양·위탁"}
  ],
  "lifeCycles": [
    {"id": 3, "lifeTime": "청소년"}
  ],
  "targetCharacteristics": [
    {"id": 2, "characteristic": "장애인"},
    {"id": 21, "characteristic": "소년소녀가장가구"}
  ],
  "offerWays": [
    {"id": 6, "way": "현금지급"}
  ],
  "enrollWays": [
    {"id": 1, "way": "인터넷"},
    {"id": 6, "way": "방문"}
  ]
};

class _DetailScreenState extends State<DetailScreen> {
  var value = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "${value.serviceTitle}", // serviceTitle
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 10),
                child: Text(
                  "서비스 요약",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromRGBO(233, 83, 155, 1),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
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
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: Text(
                  "${value.summary}", // summary
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10, top: 10),
                child: Text(
                  "지역 및 대상",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color.fromRGBO(225, 225, 225, 1),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "지역",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "전체",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: Get.width,
                      color: const Color.fromRGBO(225, 225, 225, 1),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "대상",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "청소년",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 10),
                child: Text(
                  "지원주기 및 제공유형",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color.fromRGBO(225, 225, 225, 1),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "지원주기",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "1회성",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: Get.width,
                      color: const Color.fromRGBO(225, 225, 225, 1),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "제공유형",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "현금지급",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 10),
                child: Text(
                  "지원대상 내용",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color.fromRGBO(225, 225, 225, 1),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.all(5),
                child: Text(
                  // "아동발달지원계좌(디딤씨앗통장) 지원대상은 다음과 같습니다.\n\n(보호대상아동) 만 18세 미만의 아동복지시설(아동양육시설, 공동생활가정) 보호아동, 가정위탁 보호아동, 장애인생활시설 아동, 소년소녀가정 아동\n\n\n(기초생활수급가구 아동) 중위소득 40% 이하의 수급 가구(생계, 의료 급여)의 만12세부터 만17세까지 아동 중 신규 선정하여 만18세 미만까지 지원\n\n\n(기 가입 아동 중 가정복귀 및 탈수급가구 아동)\n\n\n- 보호대상아동이 가정회복으로 중도에 가정으로 복귀하는 아동도 계속 지원\n\n\n- 기초생활수급가구 아동 또한, 해당 가정이 중위소득 40%를 초과해도 계속 지원\n\n\n정부(지자체)의 유사 자산형성지원사업과 중복 지원이 불가합니다.\n\n\n희망플러스(서울시), 꿈나래(서울시) 통장 등과 중복지원 금지\n\n\n서울시는 꿈나래통장 사업과 지원가구 중복 가능성을 고려하여 기초수급자 아동 사업지역에서 제외\n\n다만, 지원대상 및 사업취지를 고려하여,\n희망키움통장\n과는 중복지원 가능('13.1.1~)",
                  "${value.supportedBy}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 10),
                child: Text(
                  "선정기준 내용",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color.fromRGBO(225, 225, 225, 1),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.all(5),
                child: Text(
                  "${value.selectionCriteria}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  padding: EdgeInsets.all(15),
                  width: Get.width - 100,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(176, 185, 255, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 0,
                        blurRadius: 5.0,
                        offset: const Offset(2, 2),
                      ),
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      final url = Uri.parse('${value.detailLink}'); //서비스 url
                      if (await canLaunchUrl(url)) {
                        launchUrl(url, mode: LaunchMode.externalApplication);
                      }
                    },
                    child: Center(
                      child: Text(
                        "서비스 신청하러 가기",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
