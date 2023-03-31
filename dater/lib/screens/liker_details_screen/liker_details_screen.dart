import 'package:dater/constants/colors.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../common_modules/custom_loader.dart';
import '../../constants/app_images.dart';
import '../../controller/liker_details_screen_controller.dart';
import '../favorite_screen/favorite_screen.dart';
import '../filter_screen/filter_screen.dart';
import 'liker_details_screen_widgets.dart';

class LikerDetailsScreen extends StatelessWidget {
  LikerDetailsScreen({Key? key}) : super(key: key);
  final likerDetailsScreenController = Get.put(LikerDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => likerDetailsScreenController.isLoading.value
        ? const CustomLoader()
        : SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 4.h),
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppImages.refreshImage),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => FavoriteScreen());
                      },
                      child: Image.asset(AppImages.hardImage),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                              () => FilterScreen(),
                        );
                      },
                      child: Image.asset(AppImages.menuImage),
                    ),


                    // Swipe Card
                    LikerCardSwipeModule(),
                  ],
                ),
                SizedBox(height: 2.h),*/
                LikerCardSwipeModule(),
              ],
            ).commonSymmetricPadding(horizontal: 30, vertical: 20),
          ),
        ),
      ),

      /*bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.gray50Color,
          unselectedItemColor: AppColors.blackColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            // indexScreenController.homeScreenShow.value = false;
            indexScreenController.changeIndex(index);
          },
          currentIndex: indexScreenController.selectedIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                AppImages.balanceImage,
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
      ),*/
    );
  }
}
