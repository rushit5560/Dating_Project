import 'package:dater/controller/auth_screen_controllers/index_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_images.dart';
import '../../constants/colors.dart';
import '../favorite_screen/favorite_screen.dart';
import '../home_screen/home_screen.dart';
import '../message_screen/message_screen.dart';
import '../profile_screen/profile_screen.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({Key? key}) : super(key: key);
  final indexScreenController = Get.put(IndexScreenController());
  final screen = [
    HomeScreen(),
    const FavoriteScreen(),
    const MessageScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: indexScreenController.selectedIndex.value,
          children: screen,
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          //padding: EdgeInsets.all(3),
          height: Get.height * 0.10,
          decoration: const BoxDecoration(
              //color: AppColors.gray50Color,
              // borderRadius: BorderRadius.only(topLeft: Radius.circular(500), topRight: Radius.circular(500)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey700Color,
                  blurRadius: 25.0,
                ),
              ]),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: AppColors.gray50Color,
            unselectedItemColor: AppColors.blackColor,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: (index) {
              indexScreenController.changeIndex(index);
            },
            currentIndex: indexScreenController.selectedIndex.value,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppImages.homeImage,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppImages.favoriteImage,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppImages.messageImage,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppImages.personImage,
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
