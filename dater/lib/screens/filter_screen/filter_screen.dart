import 'package:dater/common_modules/custom_appbar.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/font_family.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/controller/filter_screen_controller.dart';
import 'package:dater/utils/extensions.dart';
import 'package:dater/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});
  final filterScreenController = Get.put(FilterScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(text: AppMessages.filter),
      backgroundColor: AppColors.whiteColor2,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppMessages.filterScreentext,
                  style: TextStyleConfig.textStyle(
                    fontFamily: FontFamilyText.sFProDisplayRegular,
                    fontSize: 15.sp,
                    textColor: AppColors.grey500Color,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppMessages.whatIsTheirAge,
                      style: TextStyleConfig.textStyle(
                        fontFamily: FontFamilyText.sFProDisplaySemibold,
                        textColor: AppColors.grey600Color,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.grey400Color,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppMessages.addThisFilter,
                        style: TextStyleConfig.textStyle(
                          fontFamily: FontFamilyText.sFProDisplayRegular,
                          textColor: AppColors.blackDarkColor,
                          fontSize: 15.sp,
                        ),
                      ),
                      Obx(
                        () => Transform.scale(
                          scale: 0.7,
                          child: FlutterSwitch(
                            // toggleSize: 40.0,
                            activeColor: AppColors.darkOrangeColor,
                            activeToggleColor: AppColors.blackColor,
                            inactiveToggleColor: AppColors.blackColor,
                            inactiveSwitchBorder: Border.all(
                              width: 3,
                              color: AppColors.blackColor,
                            ),
                            activeSwitchBorder: Border.all(
                              width: 3,
                              color: AppColors.blackColor,
                            ),
                            onToggle: (bool value) {
                              filterScreenController.isLoading(true);
                              filterScreenController.onSelected.value = value;
                              filterScreenController.isLoading(false);
                            },
                            value: filterScreenController.onSelected.value,
                          ),
                        ),
                      )
                    ],
                  ).commonOnlyPadding(left: 10.w, right: 1.w),
                ),
              ],
            ),
          ],
        ).commonSymmetricPadding(horizontal: 25),
      ),
    );
  }
}
