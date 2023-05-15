import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../widget/appbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  String _id = "";
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        width: Get.width,
        color: Colors.white,
        child: Column(
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
              child: Center(
                child: const Text(
                  "로그인",
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
                    margin: EdgeInsets.only(bottom: 10, top: 30),
                    child: Text(
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
                          _id = value as String;
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
                    margin: EdgeInsets.only(bottom: 10, top: 30),
                    child: Text(
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
                      onSaved: (value) {
                        setState(() {
                          _password = value as String;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (value.toString().length < 8) {
                          return '8자 이상 입력';
                        }
                        if (!RegExp('[0-9]').hasMatch(value)) {
                          return '정규식';
                        }
                        return null;
                      },
                      // inputFormatters: [FilteringTextInputFormatter(RegExp('[0-9]'), allow:false), ],
                      // focusNode: _passwordFocusNode,
                      // keyboardType: TextInputType.text ,
                      // obscureText: true,
                      // decoration: InputDecoration(
                      //   labelText: "비밀번호",
                      //   suffixIcon: Icon(Icons.lock),
                      // ),
                      // textInputAction: TextInputAction.done,
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
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            // validation 이 성공하면 폼 저장하기
                            _formkey.currentState!.save();

                            // If the form is valid, display a SnackBar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(_id + '/' + _password)),
                            );
                          }
                        },
                        child: Center(
                          child: Text(
                            "로그인",
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
    );
    ;
  }
}
