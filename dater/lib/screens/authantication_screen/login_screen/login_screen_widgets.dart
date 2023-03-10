import 'package:dater/comman_modules/custom_button.dart';
import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/screens/authantication_screen/my_number_inner_screen/my_number_inner_screen.dart';
import 'package:dater/utils/extensions.dart';
import 'package:dater/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ColumnWidgets extends StatelessWidget {
  const ColumnWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 45,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30.w,
                      width: 30.w,
                      child: Image.asset(AppImages.locationImage),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Text(
                  AppMessages.gather,
                  style: TextStyleConfig.textStyle(
                    fontSize: 23.sp,
                    textColor: AppColors.lightOrangeColor,
                  ),
                ),
              ],
            )),
        Expanded(
          flex: 55,
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppMessages.authScreen1,
                      style: TextStyleConfig.textStyle(
                        textColor: AppColors.whiteColor,
                        fontFamily: "SFProDisplayRegular",
                        fontSize: 13.sp,
                      ),
                    ),
                    TextSpan(
                      text: AppMessages.terms,
                      style: TextStyleConfig.textStyle(
                        textColor: AppColors.whiteColor,
                        fontFamily: "SFProDisplayRegular",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: AppMessages.authText2,
                      style: TextStyleConfig.textStyle(
                        textColor: AppColors.whiteColor,
                        fontFamily: "SFProDisplayRegular",
                        fontSize: 13.sp,
                      ),
                    ),
                    TextSpan(
                      text: AppMessages.privacyPolicy,
                      style: TextStyleConfig.textStyle(
                        textColor: AppColors.whiteColor,
                        fontFamily: "SFProDisplayRegular",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: AppMessages.and,
                      style: TextStyleConfig.textStyle(
                        textColor: AppColors.whiteColor,
                        fontFamily: "SFProDisplayRegular",
                        fontSize: 13.sp,
                      ),
                    ),
                    TextSpan(
                      text: AppMessages.cookissPolicy,
                      style: TextStyleConfig.textStyle(
                        textColor: AppColors.whiteColor,
                        fontFamily: "SFProDisplayRegular",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7.h),
              ButtonCustomLoginAndSignUp(
                image: AppImages.mobileImage,
                onPressed: () {
                  Get.to(() => MyNumberInnerScreen());
                },
                text: AppMessages.signUpWithphoneNumber,
                textsize: 14.sp,
                textColor: AppColors.grey900Color,
              ),
              SizedBox(height: 2.h),
              ButtonCustomLoginAndSignUp(
                image: AppImages.mobileImage,
                onPressed: () {
                  Get.to(() => MyNumberInnerScreen());
                },
                text: AppMessages.signInWithphoneNumber,
                textsize: 14.sp,
                textColor: AppColors.grey900Color,
              ),
              SizedBox(height: 3.h),
              Text(
                textAlign: TextAlign.center,
                AppMessages.referralNumber,
                style: TextStyleConfig.textStyle(
                    fontSize: 15.sp, fontFamily: "SFProDisplayBold"),
              ).commonSymmetricPadding(horizontal: 15),
              const Spacer(),
              Text(
                AppMessages.termsOfUseAndPrivacyPolice,
                style: TextStyleConfig.textStyle(
                  textColor: AppColors.whiteColor,
                ),
              )
            ],
          ).commonSymmetricPadding(horizontal: 10),
        )
      ],
    );
  }
}
