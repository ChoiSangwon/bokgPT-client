import 'dart:convert';

import 'package:bokgpt_client/screens/custom/customscreen.dart';
import 'package:bokgpt_client/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../env/env.dart';
import '../../states/district.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  String _email = "";
  String _name = "";
  String _password = "";
  String _confirmPassword = "";

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

  List<DropdownMenuItem<String>> dropdownItems =
      seoulDistricts.asMap().entries.map((entry) {
    int index = entry.key;
    String district = entry.value;
    return DropdownMenuItem<String>(
      value: (index + 2).toString(),
      child: Text(district),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, right: 10, left: 10),
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
                child: const Center(
                  child: Text(
                    "회원가입 및 정보등록",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 30),
                      child: const Text(
                        "이름",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        onSaved: (value) {
                          setState(() {
                            _name = value as String;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          if (value.length < 2) {
                            return "2글자 이상 입력해주세요";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 30),
                      child: const Text(
                        "이메일",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        onSaved: (value) {
                          setState(() {
                            _email = value as String;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      child: const Text(
                        "비밀번호",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.always,
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        onSaved: (value) {
                          setState(() {
                            _password = value as String;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          if (value.toString().length < 5) {
                            return '5자 이상 입력';
                          }
                          if (!RegExp('[0-9a-zA-Z]').hasMatch(value)) {
                            return '정규식';
                          }
                          return null;
                        },
                        // inputFormatters: [FilteringTextInputFormatter(RegExp('[0-9]'), allow:false), ],
                        // focusNode: _passwordFocusNode,
                        // keyboardType: TextInputType.text ,
                        obscureText: true,
                        // decoration: InputDecoration(
                        //   labelText: "비밀번호",
                        //   suffixIcon: Icon(Icons.lock),
                        // ),
                        // textInputAction: TextInputAction.done,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      child: const Text(
                        "비밀번호 확인",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.always,
                        onSaved: (value) {
                          setState(() {
                            _password = value as String;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          if (value.toString().length < 5) {
                            return '5자 이상 입력';
                          }
                          if (!RegExp('[0-9]').hasMatch(value)) {
                            return '정규식';
                          }
                          if (value.toString() != _password.toString()) {
                            return "비밀번호와 다릅니다.";
                          }

                          return null;
                        },
                        obscureText: true,
                      ),
                    ),
                    Container(
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
                                      color: const Color.fromRGBO(
                                          204, 204, 204, 1),
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
                                      color: const Color.fromRGBO(
                                          204, 204, 204, 1),
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
                                      color: const Color.fromRGBO(
                                          204, 204, 204, 1),
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
                              value:
                                  _selectedAge.isNotEmpty ? _selectedAge : null,
                              hint: const Text("연령대를 골라주세요"),
                              onChanged: (value) {
                                setState(() {
                                  _selectedAge = value!;
                                  // print(_selectedAge);
                                });
                              },
                              items: const [
                                DropdownMenuItem(
                                  value: "1",
                                  child: Text("10살"),
                                ),
                                DropdownMenuItem(
                                  value: "2",
                                  child: Text("20살"),
                                ),
                                DropdownMenuItem(
                                  value: "3",
                                  child: Text("30살"),
                                ),
                                DropdownMenuItem(
                                  value: "4",
                                  child: Text("40살"),
                                ),
                                DropdownMenuItem(
                                  value: "5",
                                  child: Text("50살"),
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
                              value:
                                  _selectedSi.isNotEmpty ? _selectedSi : null,
                              hint: const Text("시를 선택해주세요"),
                              onChanged: (value) {
                                setState(() {
                                  _selectedSi = value!;
                                  // print(_selectedSi);
                                });
                              },
                              items: const [
                                DropdownMenuItem(
                                  value: "전체",
                                  child: Text("전체"),
                                ),
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
                              value:
                                  _selectedDo.isNotEmpty ? _selectedDo : null,
                              hint: const Text("구를 선택해주세요"),
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
                              "가구유형",
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
                              value:
                                  _selectedEtc.isNotEmpty ? _selectedEtc : null,
                              hint: const Text("가구유형을 선택해주세요"),
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
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 40, bottom: 20),
                        padding: EdgeInsets.all(15),
                        width: 200,
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
                            if (!_formkey.currentState!.validate() ||
                                _selectedIndex == -1 ||
                                _selectedAge == "" ||
                                _selectedSi == "" ||
                                _selectedDo == "" ||
                                _selectedEtc == "") {
                              return showDialog<void>(
                                //다이얼로그 위젯 소환
                                context: context,
                                barrierDismissible:
                                    false, // 다이얼로그 이외의 바탕 눌러도 안꺼지도록 설정
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
                              _formkey.currentState!.save();

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(_email + '/' + _password)),
                              );
                              final url = Uri.parse(
                                  '${ENV.apiEndpoint}/members'); // 대상 URL을 입력하세요.
                              final data = {
                                "name": _name,
                                "email": _email,
                                "password": _password,
                                "gender": gender[_selectedIndex],
                                "locationId": int.parse(_selectedDo),
                                "lifeCycleId": int.parse(_selectedAge),
                                "homeTypeId": int.parse(_selectedEtc)
                                // "email": "aaaaa@naver.com",
                                // "pad": "string",
                                // "name": "strinaag",
                                // "gender": "MALE",
                                // "locationId": 1,
                                // "lifeCycleId": 1,
                                // "homeTypeId": 1
                              };
                              print(data);

                              final headers = {
                                'Content-Type': 'application/json'
                              };
                              final body = jsonEncode(data);

                              final response = await http.post(url,
                                  headers: headers, body: body);

                              if (response.statusCode == 200 ||
                                  response.statusCode == 201) {
                                // 성공적으로 요청이 처리됨
                                print('POST 요청이 성공하였습니다.');
                                print('응답 본문: ${response.body}');
                                Get.toNamed("/");
                              } else {
                                // 요청이 실패함
                                print('POST 요청이 실패하였습니다.');
                                print('응답 코드: ${response.statusCode}');
                              }
                            }
                          },
                          child: const Center(
                            child: Text(
                              "회원가입",
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
            ],
          ),
        ),
      ),
    );
  }
}
