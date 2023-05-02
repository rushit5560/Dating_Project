import 'dart:developer';

import 'package:dater/common_modules/custom_loader.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/font_family.dart';
import 'package:dater/controller/home_screen_controller.dart';
import 'package:dater/screens/filter_screen/filter_screen.dart';
import 'package:dater/utils/extensions.dart';
import 'package:dater/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common_modules/custom_button.dart';
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
                          GestureDetector(
                              onTap: () {
                                if (homeScreenController.selected.value ==
                                    true) {
                                  homeScreenController.understandFunction();
                                } else if (homeScreenController
                                        .selected.value ==
                                    false) {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        elevation: 50,
                                        content: StatefulBuilder(
                                          builder: (context, setState) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  "Regather",
                                                  style:
                                                      TextStyleConfig.textStyle(
                                                    fontSize: 20,
                                                    fontFamily: FontFamilyText
                                                        .sFProDisplayBold,
                                                  ),
                                                ),
                                                SizedBox(height: 2.h),
                                                Text(
                                                  "Every regather will cost you 1 coin",
                                                  style:
                                                      TextStyleConfig.textStyle(
                                                    fontSize: 14.sp,
                                                    fontFamily: FontFamilyText
                                                        .sFProDisplayRegular,
                                                  ),
                                                ),
                                                SizedBox(height: 5.h),
                                                ButtonCustom(
                                                  text: "Undestand",
                                                  onPressed: () async {
                                                    log("11");

                                                    await homeScreenController
                                                        .understandFunction();
                                                    Get.back();
                                                    log("22");
                                                  },
                                                  fontWeight: FontWeight.bold,
                                                  textsize: 14.sp,
                                                  textFontFamily: FontFamilyText
                                                      .sFProDisplayHeavy,
                                                  textColor:
                                                      AppColors.whiteColor2,
                                                  backgroundColor:
                                                      AppColors.darkOrangeColor,
                                                ).commonSymmetricPadding(
                                                    horizontal: 35),
                                                SizedBox(height: 1.h),
                                                Row(
                                                  children: [
                                                    Checkbox(
                                                      checkColor: AppColors
                                                          .lightOrangeColor,
                                                      hoverColor: AppColors
                                                          .lightOrangeColor,
                                                      activeColor: AppColors
                                                          .lightOrangeColor,
                                                      tristate: false,
                                                      side: const BorderSide(
                                                        width: 2,
                                                        color: AppColors
                                                            .blackColor,
                                                      ),
                                                      shape:
                                                          const CircleBorder(),
                                                      value:
                                                          homeScreenController
                                                              .selected.value,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          homeScreenController
                                                                  .selected
                                                                  .value =
                                                              !homeScreenController
                                                                  .selected
                                                                  .value;
                                                        });
                                                      },
                                                    ),
                                                    Text(
                                                      "don't show again",
                                                      style: TextStyleConfig
                                                          .textStyle(
                                                        fontSize: 14.sp,
                                                        fontFamily: FontFamilyText
                                                            .sFProDisplayRegular,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              child: Image.asset(AppImages.refreshImage)),
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
