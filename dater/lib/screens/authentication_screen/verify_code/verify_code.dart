import 'dart:developer';

import 'package:dater/common_modules/custom_appbar.dart';
import 'package:dater/common_modules/custom_button.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/controller/auth_screen_controllers/verification_code_screen_controller.dart';
import 'package:dater/screens/authentication_screen/sign_up_email_screen/sign_up_email_screen.dart';
import 'package:dater/screens/authentication_screen/verify_code/verify_code_widgets.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class VerifyCodeScreen extends StatelessWidget {
  VerifyCodeScreen({super.key});
  final verifyCodeScreenController = Get.put(VerifyCodeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.whiteColor2,
      appBar: commonAppBarModule(text: AppMessages.myCodeIs),

      // .commonSymmetricPadding(horizontal: 25, vertical: 30),
      body: Column(
        children: [
          SizedBox(height: 2.h),
          VerificationCodeFieldModule(),
          SizedBox(height: 13.h),
          ResendButtonModule(),
          const Spacer(),
          KeyBoardeCustomModule()
        ],
      ).commonSymmetricPadding(horizontal: 10),


      bottomNavigationBar: ButtonCustom(
          backgroundColor: AppColors.darkOrangeColor,
          text: AppMessages.submit,
          fontWeight: FontWeight.bold,
          textsize: 14.sp,
          textColor: AppColors.gray50Color,
          onPressed: () {

            if(verifyCodeScreenController.controller.text.length == 4) {
              // log('Controller Text : ${verifyCodeScreenController.controller.text}');
              Get.to(
                    () => SignUpEmailScreen(),
              );
            } else {
              Fluttertoast.showToast(msg: AppMessages.enterValidCode);
            }


          },
          shadowColor: AppColors.grey900Color)
          .commonOnlyPadding(left: 25, right: 25, bottom: 30),
    );
  }
}