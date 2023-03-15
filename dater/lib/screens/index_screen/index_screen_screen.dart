import 'package:dater/controller/auth_screen_controllers/index_screen_controller.dart';
import 'package:dater/screens/balance_screen/balance_screen.dart';
import 'package:dater/screens/chat_screen/chat_sreen.dart';
import 'package:dater/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_images.dart';
import '../../constants/colors.dart';
import '../favorite_screen/favorite_screen.dart';
import '../profile_screen/profile_screen.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({Key? key}) : super(key: key);
  final indexScreenController = Get.put(IndexScreenController());
  final screen = [
    const BalanceScreen(),
     FavoriteScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  Future<bool> willPopCallback() async {
    if (indexScreenController.homeScreenShow.value == false) {
      indexScreenController.homeScreenShow.value = true;
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => willPopCallback(),
      child: Scaffold(
        body: Obx(
          () => indexScreenController.homeScreenShow.value
              ? HomeScreen()
              : Obx(
                  () => IndexedStack(
                    index: indexScreenController.selectedIndex.value,
                    children: screen,
                  ),
                ),
        ),

        //  Obx(
        //   () => IndexedStack(
        //     index: indexScreenController.selectedIndex.value,
        //     children: screen,
        //   ),
        // ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.gray50Color,
            unselectedItemColor: AppColors.blackColor,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: (index) {
              indexScreenController.homeScreenShow.value = false;
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
