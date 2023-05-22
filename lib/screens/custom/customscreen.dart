import 'dart:convert';

import 'package:bokgpt_client/widget/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../env/env.dart';
import '../../models/detailData.dart';
import '../../states/district.dart';
import 'package:http/http.dart' as http;

import '../../widget/bottomNavigator.dart';

List<DropdownMenuItem<String>> dropdownItems =
    seoulDistricts.asMap().entries.map((entry) {
  int index = entry.key;
  String district = entry.value;
  return DropdownMenuItem<String>(
    value: (index + 2).toString(),
    child: Text(district),
  );
}).toList();

class CustomScreen extends StatefulWidget {
  const CustomScreen({super.key});

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: const CustomBottomNavigator(),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
            margin: const EdgeInsets.only(top: 10),
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
            child: const Text(
              "나에게 맞는 복지서비스 찾기",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          CustomSelect(),
        ]),
      ),
    );
  }
}

class CustomSelect extends StatefulWidget {
  const CustomSelect({super.key});

  @override
  State<CustomSelect> createState() => _CustomSelectState();
}

class _CustomSelectState extends State<CustomSelect> {
  int _selectedIndex = -1;
  String _selectedAge = "";
  String _selectedSi = "";
  String _selectedDo = "";
  String _selectedEtc = "";
  var gender = ["MALE", "FEMALE", "NONE"];

  void _selectGender(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color _getColor(int index) {
    return _selectedIndex == index
        ? Color.fromRGBO(176, 185, 255, 1)
        : Colors.white;
  }

  TextStyle _getTextStyle(int index) {
    return TextStyle(
      color: _selectedIndex == index ? Colors.white : Colors.black,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      width: Get.width,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 10, top: 30),
            child: const Text(
              "지원대상 내용",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _selectGender(0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color.fromRGBO(204, 204, 204, 1),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    color: _getColor(0),
                  ),
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, right: 10, left: 10),
                  width: 80,
                  child: Text(
                    "남성",
                    style: _getTextStyle(0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _selectGender(1),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color.fromRGBO(204, 204, 204, 1),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    color: _getColor(1),
                  ),
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, right: 10, left: 10),
                  width: 80,
                  child: Text(
                    "여성",
                    style: _getTextStyle(1),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _selectGender(2),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color.fromRGBO(204, 204, 204, 1),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    color: _getColor(2),
                  ),
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, right: 10, left: 10),
                  width: 80,
                  child: Text(
                    "상관없음",
                    style: _getTextStyle(2),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(bottom: 10, top: 30),
            child: const Text(
              "나이",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: 300,
            child: DropdownButton<String>(
              isExpanded: true,
              value: _selectedAge.isNotEmpty ? _selectedAge : null,
              hint: const Text("연령대를 골라주세요"),
              onChanged: (value) {
                setState(() {
                  _selectedAge = value!;
                  // print(_selectedAge);
                });
              },
              items: const [
                DropdownMenuItem(
                  value: '1',
                  child: Text("청소년"),
                ),
                DropdownMenuItem(
                  value: "2",
                  child: Text("구분없음(전생애)"),
                ),
                DropdownMenuItem(
                  value: "3",
                  child: Text("영유아"),
                ),
                DropdownMenuItem(
                  value: "4",
                  child: Text("아동"),
                ),
                DropdownMenuItem(
                  value: "5",
                  child: Text("임신 · 출산"),
                ),
                DropdownMenuItem(
                  value: "6",
                  child: Text("중장년"),
                ),
                DropdownMenuItem(
                  value: "7",
                  child: Text("노년"),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(bottom: 10, top: 30),
            child: const Text(
              "지역",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: 300,
            child: DropdownButton<String>(
              isExpanded: true,
              value: _selectedSi.isNotEmpty ? _selectedSi : null,
              hint: const Text("시/군/구 를 선택해주세요"),
              onChanged: (value) {
                setState(() {
                  _selectedSi = value!;
                  // print(_selectedSi);
                });
              },
              items: const [
                DropdownMenuItem(
                  value: "서울특별시",
                  child: Text("서울특별시"),
                ),
              ],
            ),
          ),
          Container(
            width: 300,
            child: DropdownButton<String>(
              isExpanded: true,
              value: _selectedDo.isNotEmpty ? _selectedDo : null,
              hint: const Text("읍/면/동 을 선택해주세요"),
              onChanged: (value) {
                setState(() {
                  _selectedDo = value!;
                  // print(_selectedSi);
                });
              },
              items: dropdownItems,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(bottom: 10, top: 30),
            child: const Text(
              "지역",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: 300,
            child: DropdownButton<String>(
              isExpanded: true,
              value: _selectedEtc.isNotEmpty ? _selectedEtc : null,
              hint: const Text("시/군/구 를 선택해주세요"),
              onChanged: (value) {
                setState(() {
                  _selectedEtc = value!;
                  // print(_selectedSi);
                });
              },
              items: const [
                DropdownMenuItem(
                  value: "1",
                  child: Text("다문화·탈북민"),
                ),
                DropdownMenuItem(
                  value: "2",
                  child: Text('한부모·조손'),
                ),
                DropdownMenuItem(
                  value: "3",
                  child: Text('보훈대상자'),
                ),
                DropdownMenuItem(
                  value: "4",
                  child: Text('다자녀'),
                ),
                DropdownMenuItem(
                  value: "5",
                  child: Text('저소득'),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            padding: EdgeInsets.all(10),
            width: Get.width - 150,
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
                if (_selectedIndex == -1 ||
                    _selectedAge == "" ||
                    _selectedSi == "" ||
                    _selectedDo == "" ||
                    _selectedEtc == "") {
                  return showDialog<void>(
                    //다이얼로그 위젯 소환
                    context: context,
                    barrierDismissible: false, // 다이얼로그 이외의 바탕 눌러도 안꺼지도록 설정
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          child: ListBody(
                            //List Body를 기준으로 Text 설정
                            children: <Widget>[
                              Text('전부 다 체크해주세요'),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: Text('확인'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  print(
                      '${ENV.apiEndpoint}/welfares?lifeCycleId=${int.parse(_selectedAge)}&locationId=${int.parse(_selectedDo)}&homeTypeId=${int.parse(_selectedEtc)}&gender=${gender[_selectedIndex]}&size=100');

                  final response = await http.get(Uri.parse(
                      '${ENV.apiEndpoint}/welfares?lifeCycleId=${int.parse(_selectedAge)}&locationId=${int.parse(_selectedDo) - 1}&homeTypeId=${int.parse(_selectedEtc)}&gender=${gender[_selectedIndex]}&size=100'));
                  // print(response);

                  if (response.statusCode == 200) {
                    final jsonData =
                        jsonDecode(utf8.decode(response.bodyBytes));
                    // DetailData tmp = DetailData.fromJson(jsonData);
                    print(jsonData);
                    // print(tmp.id);
                    // setState(() {
                    //   _detData = jsonData;
                    // });
                    // print(_detData);
                  } else {
                    throw Exception('Failed to load detail data');
                  }
                  //           @RequestParam(required = false) Gender gender,
                  // @RequestParam(required = false, defaultValue = "0") Long lifeCycleId,
                  // @RequestParam(required = false, defaultValue = "0") Long locationId,
                  // @RequestParam(required = false, defaultValue = "0") Long homeTypeId,
                  // @RequestParam(required = false, defaultValue = "0") Long interestThemeId,
                  //   Map<String, dynamic> data = {
                  //     'name': ,
                  //     'email': 'hong@gildong.com',
                  //     'gender': 'MALE',
                  //     'locationId': 1,
                  //     'lifeCycleId': 1,
                  //     'password': '123',
                  //   };

                  //   String jsonStr = jsonEncode(data);
                  //   print(jsonStr);
                }
              },
              child: const Center(
                child: Text(
                  "저장하기",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
