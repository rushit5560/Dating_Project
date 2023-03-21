import 'package:dater/common_modules/custom_appbar.dart';
import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/font_family.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/screens/settings/settings_screen.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.whiteColor2,
      appBar: commonAppBarModule(text: AppMessages.myProfile),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  height: 17.h,
                  width: 17.h,
                  decoration: const BoxDecoration(
                    color: AppColors.grey500Color,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        AppImages.swiper2Image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: -5,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.whiteColor
                    ),
                    child: Text(
                      '85%',
                      style: TextStyle(
                        fontFamily: FontFamilyText.sFProDisplaySemibold,
                        fontSize: 11,
                      ),
                    ).commonAllSidePadding(10),
                  ),
                ),
              ],
            ),

            GestureDetector(
              onTap: () {
                Get.to(()=> SettingsScreen());
              },
              child: Image.asset(AppImages.settingImage,
              height: 50,
              width: 50,),
            ),
          ],
        ).commonOnlyPadding(top: 4.h),
      ),
    );
  }
}
