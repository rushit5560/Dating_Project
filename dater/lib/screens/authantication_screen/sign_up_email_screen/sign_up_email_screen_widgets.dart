import 'dart:developer';

import 'package:dater/comman_modules/custom_textfromfiled.dart';
import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/controller/auth_screen_controllers/sign_up_email_screen_controller.dart';
import 'package:dater/screens/authantication_screen/location_screen/location_screen.dart';
import 'package:dater/utils/extensions.dart';
import 'package:dater/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../comman_modules/custom_button.dart';

class SignUpEmailScreenWidgets extends StatelessWidget {
  SignUpEmailScreenWidgets({super.key});
  final signUpEmailScreenController = Get.find<SignUpEmailScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10.5.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.gray50Color,
            image: const DecorationImage(
              image: AssetImage(AppImages.locationImage),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          AppMessages.whatsYourEmail,
          style: TextStyleConfig.textStyle(
            fontFamily: "SFProDisplayRegular",
            textColor: AppColors.grey800Color,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        SizedBox(height: 2.h),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: AppMessages.donTLoseAccessToYourAccount,
            style: TextStyleConfig.textStyle(
              fontFamily: "SFProDisplayRegular",
              textColor: AppColors.grey600Color,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 2.h),
        noShadowTextFormFiledCustom(
          fieldController: signUpEmailScreenController.emailTextFieldController,
          hintText: AppMessages.enterYourEmail,
          keyboardType: TextInputType.text,
        ).commonSymmetricPadding(horizontal: 10),
        SizedBox(height: 2.h),
        ButtonCustom(
          backgroundColor: AppColors.lightOrangeColor,
          shadowColor: Colors.blueGrey,
          text: AppMessages.skipButton,
          textColor: AppColors.gray50Color,
          fontWeight: FontWeight.bold,
          size: const Size(150, 0),
          textsize: 14.sp,
          onPressed: () {
            Get.to(() => LocationScreen());
          },
        ),
        SizedBox(height: 2.h),
        ButtonCustom(
          backgroundColor: AppColors.lightOrangeColor,
          shadowColor: Colors.blueGrey,
          text: AppMessages.continueButton,
          textColor: AppColors.gray50Color,
          fontWeight: FontWeight.bold,
          size: const Size(150, 0),
          textsize: 14.sp,
          onPressed: () {
            Get.to(() => LocationScreen());
          },
        ),
      ],
    );
  }
}
