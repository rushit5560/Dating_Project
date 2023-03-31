import 'package:dater/common_modules/custom_loader.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/controller/home_screen_controller.dart';
import 'package:dater/screens/filter_screen/filter_screen.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/app_images.dart';
import '../favorite_screen/favorite_screen.dart';
import 'home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor2,
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => homeScreenController.isLoading.value
            ? const CustomLoader()
            : SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 2.h),
                      Row(
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
                        ],
                      ),
                      SizedBox(height: 2.h),

                      // Swipe Card
                      CardSwipeModule(),
                    ],
                  ).commonSymmetricPadding(horizontal: 30, vertical: 20),
                ),
              ),
      ),
      // bottomNavigationBar: const BottomNavigationBarModule(),
    );
  }
}
