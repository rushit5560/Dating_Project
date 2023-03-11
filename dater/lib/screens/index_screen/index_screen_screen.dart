import 'dart:developer';

import 'package:dater/controller/auth_screen_controllers/index_screen_controller.dart';
import 'package:dater/screens/favorite_screen/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_images.dart';
import '../../constants/colors.dart';
import '../home_screen/home_screen.dart';
import '../message_screen/message_screen.dart';
import '../profile_screen/profile_screen.dart';

class IndexScreen extends StatelessWidget {
   IndexScreen({Key? key}) : super(key: key);
  final indexScreenController = Get.put(IndexScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  naviBar(context,));
  }
  Widget naviBar(BuildContext context, changeIndex) {
    return
    Container(
      height: Get.height * 0.09,
      decoration:  const BoxDecoration(
        color: AppColors.gray50Color,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
        boxShadow: [
          BoxShadow(color: AppColors.grey700Color, blurRadius: 25.0,),
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              changeIndex.call(0);
              log("${indexScreenController.menuIndex.value}");
              indexScreenController.menuIndex.value = 0;
            },
            child: SizedBox(
              height: 40.h,
             // width: 30,
              child: Image.asset(
                AppImages.homeImage,
                color: AppColors.blackColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              changeIndex.call(1);
              log("${indexScreenController.menuIndex.value}");
              indexScreenController.menuIndex.value = 1;
            },
            child: SizedBox(
              height: 40.h,
              //width: 30,
              child: Image.asset(AppImages.favoriteImage,
                color: AppColors.blackColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              changeIndex.call(2);
              log("${indexScreenController.menuIndex.value}");
              indexScreenController.menuIndex.value = 1;
            },
            child: SizedBox(
              height: 40.h,
              //width: 30,
              child: Image.asset(AppImages.messageImage,
                color: AppColors.blackColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              changeIndex.call(3);
              log("${indexScreenController.menuIndex.value}");
              indexScreenController.menuIndex.value = 1;
            },
            child: SizedBox(
              height: 40.h,
              //width: 30,
              child: Image.asset(AppImages.personImage,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

/*   Widget get(BuildContext context) {
     final IndexScreenController indexScreenController =
     Get.put(IndexScreenController(), permanent: false);
     return
       SafeArea(
         child: Scaffold(
           bottomNavigationBar: buildBottomNavigationMenu(context, indexScreenController),
           body: Obx(() => IndexedStack(
             index: indexScreenController.tabIndex.value,
             children: [
               HomeScreen(),
               FavoriteScreen(),
               MessageScreen(),
               ProfileScreen(),
             ],
           )),
         ));
   }
}*/




