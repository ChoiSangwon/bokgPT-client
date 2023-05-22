import 'package:get/get.dart';
import 'package:flutter/material.dart';

List body_item = [
  Text("home"),
  Text("music"),
  Text("apps"),
];
List nameList = [
  "/",
  "/",
  "/signin",
];

class CustomBottomNavigator extends StatefulWidget {
  const CustomBottomNavigator({super.key});

  @override
  State<CustomBottomNavigator> createState() => _CustomBottomNavigatorState();
}

class _CustomBottomNavigatorState extends State<CustomBottomNavigator> {
  int current_index = 1;
  // Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //현재 index 변수에 저장
      currentIndex: current_index,
      //tap -> index 변경
      onTap: (index) {
        print('index test : ${index}');
        setState(() {
          current_index = index;
          if (index == 1) {
            Get.offAllNamed(nameList[index]);
          } else {
            Get.toNamed(nameList[index]);
          }
        });
      },
      //BottomNavi item list
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.music_note),
          label: 'Music',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'login',
        ),
      ],
      //selected된 item color
      selectedItemColor: Color.fromRGBO(176, 185, 255, 1),
      //unselected된 item color
      unselectedItemColor: Colors.grey,
      //unselected된 label text
      showUnselectedLabels: true,
      //BottomNavigationBar Type -> fixed = bottom item size고정
      //BottomNavigationBar Type -> shifting = bottom item selected 된 item이 확대
      // type: BottomNavigationBarType.shifting,
    );
  }
}
