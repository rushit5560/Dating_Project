import 'dart:developer';
import 'package:dater/controller/auth_screen_controllers/index_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/app_images.dart';
import '../../constants/colors.dart';
import '../favorite_screen/favorite_screen.dart';
import '../home_screen/home_screen.dart';
import '../message_screen/message_screen.dart';
import '../profile_screen/profile_screen.dart';


class IndexScreen extends StatelessWidget {
  IndexScreen({Key? key}) : super(key: key);
  //final indexScreenController = Get.put(IndexScreenController());
  final screen = [
    HomeScreen(),
    FavoriteScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: 0,
        children: screen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
          selectedItemColor: AppColors.gray50Color,
          unselectedItemColor: AppColors.blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: (index){},
          currentIndex: 0,
          items:  [
            BottomNavigationBarItem(icon: Image.asset(AppImages.homeImage,),
              label: '',
            ),
            BottomNavigationBarItem(icon: Image.asset(AppImages.favoriteImage,),
              label: '',
            ),
            BottomNavigationBarItem(icon: Image.asset(AppImages.messageImage,),
              label: '',
            ),
            BottomNavigationBarItem(icon: Image.asset(AppImages.personImage,),
              label: '',
            ),

          ],
      ),
    );
  }

/*  Widget naviBar(BuildContext context, changeIndex) {
    return 
    Container(
        height: Get.height * 0.09,
        decoration: const BoxDecoration(
            color: AppColors.gray50Color,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
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
  }*/
}
