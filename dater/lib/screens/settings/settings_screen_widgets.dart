import 'dart:developer';
import 'package:dater/constants/messages.dart';
import 'package:dater/screens/authentication_screen/location_screen/location_screen.dart';
import 'package:dater/screens/cookie_policy_screen/cookie_policy_screen.dart';
import 'package:dater/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:dater/screens/terms_of_you_use_screen/terms_of_you_use_screen.dart';
import 'package:dater/screens/verify_your_account_screen/verify_your_account_screen.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common_modules/custom_button.dart';
import '../../constants/app_images.dart';
import '../../constants/colors.dart';
import '../../constants/font_family.dart';
import '../../utils/style.dart';

class ReferralNumberModule extends StatelessWidget {
  const ReferralNumberModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray50Color,
        borderRadius: BorderRadius.circular(19),
        boxShadow: const [
          BoxShadow(
              blurRadius: 5.0,
              offset: Offset(-0, 3),
              color: AppColors.grey800Color),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppMessages.yourReferralNumber,
            style: TextStyleConfig.textStyle(
              fontFamily: FontFamilyText.sFProDisplayBold,
              textColor: AppColors.grey800Color,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 1.h),
          Center(
              child: Container(
            height: 4.h,
            width: 30.w,
            decoration: BoxDecoration(
              color: AppColors.gray50Color,
              border: Border.all(color: AppColors.grey400Color),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                '51278223',
                style: TextStyleConfig.textStyle(
                  fontFamily: FontFamilyText.sFProDisplaySemibold,
                  textColor: AppColors.grey600Color,
                  fontSize: 12.sp,
                ),
              ),
            ),
          )),
          SizedBox(height: 1.5.h),
          Center(
            child: InkWell(
              onTap: () {
                log('message');
              },
              child: Container(
                // height: 3.1.h,
                width: 20.w,
                decoration: BoxDecoration(
                  color: AppColors.darkOrangeColor,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5.0,
                      offset: Offset(-0, 3),
                      color: AppColors.grey800Color,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    AppMessages.copy,
                    style: TextStyleConfig.textStyle(
                      fontFamily: FontFamilyText.sFProDisplayRegular,
                      textColor: AppColors.whiteColor,
                      fontSize: 12.sp,
                    ),
                  ).commonSymmetricPadding(vertical: 2),
                ),
              ),
            ),
          ),
        ],
      ).commonOnlyPadding(right: 6.w, left: 6.w, top: 2.h, bottom: 1.h),
    );
  }
}

class VerifyAccountModule extends StatelessWidget {
  const VerifyAccountModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray50Color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            offset: Offset(-0, 3),
            color: AppColors.grey800Color,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppMessages.verifyYourAccount,
            style: TextStyleConfig.textStyle(
              fontFamily: FontFamilyText.sFProDisplayBold,
              textColor: AppColors.grey800Color,
              fontSize: 14.sp,
            ),
          ),
          //SizedBox(height: 1.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppMessages.verified,
                style: TextStyleConfig.textStyle(
                  fontFamily: FontFamilyText.sFProDisplaySemibold,
                  textColor: AppColors.grey600Color,
                  fontSize: 14.sp,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.to(
                    () => VerifyYourAccountScreen(),
                  );
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.grey600Color,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ).commonOnlyPadding(right: 6.w, left: 6.w, top: 2.h, bottom: 2.h),
    );
  }
}

class PersonalInfoModule extends StatelessWidget {
  const PersonalInfoModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray50Color,
        borderRadius: BorderRadius.circular(19),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            offset: Offset(-0, 3),
            color: AppColors.grey800Color,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppMessages.personalInfo,
            style: TextStyleConfig.textStyle(
              fontFamily: FontFamilyText.sFProDisplayBold,
              textColor: AppColors.grey800Color,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppMessages.phoneNumber,
                style: TextStyleConfig.textStyle(
                  fontFamily: FontFamilyText.sFProDisplaySemibold,
                  textColor: AppColors.grey600Color,
                  fontSize: 14.sp,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.grey600Color,
                  size: 20,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppMessages.email,
                style: TextStyleConfig.textStyle(
                  fontFamily: FontFamilyText.sFProDisplaySemibold,
                  textColor: AppColors.grey600Color,
                  fontSize: 14.sp,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_outlined,
                    color: AppColors.grey600Color, size: 20),
              ),
            ],
          ),
        ],
      ).commonOnlyPadding(right: 6.w, left: 6.w, top: 2.h, bottom: 2.h),
    );
  }
}

class LocationModule extends StatelessWidget {
  const LocationModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray50Color,
        borderRadius: BorderRadius.circular(19),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            offset: Offset(-0, 3),
            color: AppColors.grey800Color,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppMessages.personalInfo,
            style: TextStyleConfig.textStyle(
              fontFamily: FontFamilyText.sFProDisplayBold,
              textColor: AppColors.grey800Color,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Image.asset(AppImages.location2Image,
                          height: 2.5.h, color: AppColors.grey600Color),
                    ),
                    TextSpan(
                      text: "  Current location ",
                      style: TextStyleConfig.textStyle(
                        textColor: AppColors.grey600Color,
                        fontSize: 16,
                        fontFamily: FontFamilyText.sFProDisplayRegular,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.check_circle_rounded,
                    color: AppColors.darkOrangeColor, size: 20),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => LocationScreen());
            },
            child: Text(
              AppMessages.addANewLocation,
              style: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplaySemibold,
                textColor: AppColors.darkOrangeColor,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ).commonOnlyPadding(right: 6.w, left: 6.w, top: 2.h, bottom: 2.h),
    );
  }
}

class ShowMeModule extends StatelessWidget {
  const ShowMeModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray50Color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            offset: Offset(-0, 3),
            color: AppColors.grey800Color,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppMessages.showMe,
            style: TextStyleConfig.textStyle(
              fontFamily: FontFamilyText.sFProDisplayBold,
              textColor: AppColors.grey800Color,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppMessages.women,
                style: TextStyleConfig.textStyle(
                  fontFamily: FontFamilyText.sFProDisplaySemibold,
                  textColor: AppColors.grey600Color,
                  fontSize: 14.sp,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.grey600Color,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ).commonOnlyPadding(right: 6.w, left: 6.w, top: 2.h, bottom: 2.h),
    );
  }
}

class CookiePolicyModule extends StatelessWidget {
  const CookiePolicyModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray50Color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            offset: Offset(-0, 3),
            color: AppColors.grey800Color,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppMessages.cookiePolicy,
            style: TextStyleConfig.textStyle(
              fontFamily: FontFamilyText.sFProDisplaySemibold,
              textColor: AppColors.darkOrangeColor,
              fontSize: 14.sp,
            ),
          ).commonSymmetricPadding(horizontal: 6.w),
          IconButton(
            onPressed: () {
              Get.to(
                () => CookiePolicyScreen(),
              );
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.grey600Color,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class TermsOfYouUseModule extends StatelessWidget {
  const TermsOfYouUseModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray50Color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            offset: Offset(-0, 3),
            color: AppColors.grey800Color,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppMessages.termsOfYouUse,
            style: TextStyleConfig.textStyle(
              fontFamily: FontFamilyText.sFProDisplaySemibold,
              textColor: AppColors.darkOrangeColor,
              fontSize: 14.sp,
            ),
          ).commonSymmetricPadding(horizontal: 6.w),
          IconButton(
            onPressed: () {
              Get.to(
                () => TermsOfYouUseScreen(),
              );
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.grey600Color,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class PrivacyPolicyModule extends StatelessWidget {
  const PrivacyPolicyModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray50Color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            offset: Offset(-0, 3),
            color: AppColors.grey800Color,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppMessages.privacyPolicy,
            style: TextStyleConfig.textStyle(
              fontFamily: FontFamilyText.sFProDisplaySemibold,
              textColor: AppColors.darkOrangeColor,
              fontSize: 14.sp,
            ),
          ).commonSymmetricPadding(horizontal: 6.w),
          IconButton(
            onPressed: () {
              Get.to(
                () => PrivacyPolicyScreen(),
              );
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.grey600Color,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class BothButtonModule extends StatelessWidget {
  const BothButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonCustom(
          backgroundColor: AppColors.lightOrangeColor,
          shadowColor: AppColors.grey800Color,
          text: AppMessages.logout,
          textColor: AppColors.gray50Color,
          textFontFamily: FontFamilyText.sFProDisplaySemibold,
          textsize: 14.sp,
          onPressed: () {
            //Get.to(() => LocationScreen());
          },
        ),
        SizedBox(height: 1.h),
        ButtonCustom(
          backgroundColor: AppColors.lightOrangeColor,
          shadowColor: AppColors.grey800Color,
          text: AppMessages.deleteAccount,
          textColor: AppColors.gray50Color,
          textFontFamily: FontFamilyText.sFProDisplaySemibold,
          textsize: 14.sp,
          onPressed: () {
            //Get.to(() => LocationScreen());
          },
        ),
      ],
    );
  }
}
