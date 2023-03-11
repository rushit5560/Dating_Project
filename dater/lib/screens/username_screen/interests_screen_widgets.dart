import 'dart:developer';

import 'package:dater/screens/authantication_screen/add_user_photo_screen/add_user_photo_screen.dart';
import 'package:dater/screens/username_screen/interests_screen.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../comman_modules/custom_button.dart';
import '../../comman_modules/custom_textfromfiled.dart';
import '../../constants/colors.dart';
import '../../constants/messages.dart';
import '../../controller/user_name_screen_controller.dart';
import '../../utils/style.dart';

class SignUpNameScreenWidgets extends StatelessWidget {
  SignUpNameScreenWidgets({Key? key}) : super(key: key);
  final userNameScreenController = Get.find<UserNameScreenController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            AppMessages.whatSYourName,
            style: TextStyleConfig.textStyle(
              fontFamily: "SFProDisplayRegular",
              textColor: AppColors.grey800Color,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
        ]),
        SizedBox(
          height: 5.h,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            AppMessages.userName1,
            style: TextStyleConfig.textStyle(
              fontFamily: "SFProDisplayRegular",
              textColor: AppColors.grey600Color,
              fontSize: 12.sp,
            ),
          ),
        ]),
        SizedBox(
          height: 2.6.h,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            AppMessages.userName2,
            style: TextStyleConfig.textStyle(
              fontFamily: "SFProDisplayRegular",
              textColor: AppColors.grey600Color,
              fontSize: 12.sp,
            ),
          ),
        ]),
        SizedBox(
          height: 15.h,
        ),
        noShadowTextFormFiledCustom(
          fieldController: userNameScreenController.nameTextFieldController,
          hintText: AppMessages.enterYourName,
          keyboardType: TextInputType.text,
        ).commonSymmetricPadding(horizontal: 25),
        SizedBox(height: 2.h),
        ButtonCustom(
                backgroundColor: AppColors.darkOrangeColor,
                text: AppMessages.confirm,
                fontWeight: FontWeight.bold,
                textsize: 14.sp,
                textColor: AppColors.gray50Color,
                onPressed: () {
                  Get.to(
                    AddUserPhotoScreen(),
                  );
                },
                shadowColor: AppColors.grey900Color)
            .commonSymmetricPadding(horizontal: 25),
      ],
    );
  }
}
