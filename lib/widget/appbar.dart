import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  // final bool allowBackButton;
  // final String title;
  // final Widget? titleWidget;
  // final Color color;

  ///actions는 AppBarButton 내부에서만 사용할 수 있도록 제작
  // final List<Widget>? actions;
  // final String goingBackString;
  // final bool isTitleCentered;

  // final void Function()? onTapBack;

  // CustomAppBar(
  //     {Key? key,
  //     this.allowBackButton = true,
  //     this.goingBackString = '',
  //     // required this.title,
  //     this.actions,
  //     this.onTapBack,
  //     this.isTitleCentered = true,
  //     this.titleWidget,
  //     this.color = Colors.black})
  //     : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      // title: Image.asset(
      //   'assets/images/appbar.png',
      //   scale: 1.5,
      //   // width: 40,
      //   // height: 40,
      // ),
      // title: const Text(
      //   'bokgPT',
      //   style: TextStyle(
      //     fontSize: 18,
      //     fontWeight: FontWeight.w700,
      //     overflow: TextOverflow.ellipsis,
      //   ),
      // ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Text(
      //       'bokgPT',
      //       style: TextStyle(
      //         fontSize: 18,
      //         fontWeight: FontWeight.w700,
      //         overflow: TextOverflow.ellipsis,
      //       ),
      //     ),
      //   ],
      // ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(
          //   width: 110,
          // ),
          Image.asset(
            'assets/images/splash.png',
            scale: 30,
            // width: 40,
            // height: 40,
          ),
          const Text(
            'bokgPT',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Container(
          //   width: 110,
          //   alignment: Alignment.centerRight,
          //   child: GestureDetector(
          //     onTap: () {
          //       Get.toNamed('/signin');
          //     },
          //     child: Icon(Icons.person),
          //   ),
          // ),
          // SizedBox(
          //   width: 100,
          // ),
        ],
      ),

      // leadingWidth: (goingBackString == '') ? 50 : 70,
      // leading: () {
      // print(goingBackString);
      //   if (allowBackButton) {
      //     if (goingBackString != '') {
      //       return InkWell(
      //           onTap: onTapBack ??
      //               () {
      //                 Get.back();
      //               },
      //           overlayColor: MaterialStateProperty.all(
      //             Colors.transparent,
      //           ),
      //           child: Center(
      //             child: Text(
      //               goingBackString,
      //               style: const TextStyle(
      //                 color: Colors.black,
      //                 fontSize: 15,
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             ),
      //           ));
      //     }
      //     return GestureDetector(
      //       onTap: onTapBack ?? () => Get.back(),
      //       behavior: HitTestBehavior.translucent,
      //       child: const Center(child: Icon(Icons.chevron_left_rounded)),
      //     );
      //   }

      //   return Container();
      // }(),
      // actions: actions,
    );
  }
}

// class GoingBackButton extends StatelessWidget {
//   final Function? func;
//   const GoingBackButton({this.func, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 40,
//       left: 20,
//       child: GestureDetector(
//         onTap: () {
//           Get.back();
//         },
//         child: Container(
//           padding: const EdgeInsets.all(5),
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.white,
//           ),
//           child: const Icon(
//             Icons.chevron_left_rounded,
//             size: 40,
//           ),
//         ),
//       ),
//     );
//   }
// }
