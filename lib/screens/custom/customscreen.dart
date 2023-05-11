import 'package:bokgpt_client/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

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
      body: Column(children: [
        CustomSelect(),
      ]),
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
      padding: EdgeInsets.only(left: 20, right: 20),
      width: Get.width,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 10),
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
                "나에게 맞는 복지서비스 찾기",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 10, top: 30),
              child: Text(
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
                        color: Color.fromRGBO(204, 204, 204, 1),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      color: _getColor(0),
                    ),
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
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
                        color: Color.fromRGBO(204, 204, 204, 1),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      color: _getColor(1),
                    ),
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
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
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
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
              margin: EdgeInsets.only(bottom: 10, top: 30),
              child: Text(
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
                hint: Text("Select an item"),
                onChanged: (value) {
                  setState(() {
                    _selectedAge = value!;
                    print(_selectedAge);
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: "Item 1",
                    child: Text("10살"),
                  ),
                  DropdownMenuItem(
                    value: "Item 2",
                    child: Text("20살"),
                  ),
                  DropdownMenuItem(
                    value: "Item 3",
                    child: Text("30살"),
                  ),
                  DropdownMenuItem(
                    value: "Item 4",
                    child: Text("40살"),
                  ),
                  DropdownMenuItem(
                    value: "Item 5",
                    child: Text("50살"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
