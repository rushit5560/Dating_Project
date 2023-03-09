import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/controller/splash_screen_controller.dart';
import 'package:dater/utils/extensions.dart';
import 'package:dater/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final splashScreencontroller = Get.put(SplashScreencontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height,
              decoration: const BoxDecoration(
                // gradient: LinearGradient(
                //   begin: FractionalOffset.topRight,
                //   end: FractionalOffset.bottomLeft,
                //   colors: [
                //     Color(0xff0d69ff).withOpacity(0.0),
                //     Color(0xff0069ff).withOpacity(0.8),
                //   ],
                // ),
                image: DecorationImage(
                  image: AssetImage(AppImages.splashScreenImage),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                    // AppColors.accentColor.withOpacity(0.7),
                    AppColors.lightOrangeColor,

                    BlendMode.multiply,
                  ),

                  // opacity: 0.5,
                ),
              ),
            ),
            // Container(
            //   width: Get.width,
            //   height: Get.height,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(AppImages.colorImage),
            //       fit: BoxFit.fill,
            //       opacity: 0.2,
            //       // colorFilter: ColorFilter.mode(
            //       //   // AppColors.accentColor.withOpacity(0.7),
            //       //   AppColors.darkOrangeColor,
            //       //   BlendMode.multiply,
            //       // ),
            //     ),
            //   ),
            // ),
            // Container(
            //   width: Get.width,
            //   height: Get.height,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(AppImages.colorImage),
            //       fit: BoxFit.fill,
            //       opacity: 0.2,
            //       // colorFilter: ColorFilter.mode(
            //       //   // AppColors.accentColor.withOpacity(0.7),
            //       //   AppColors.darkOrangeColor,
            //       //   BlendMode.multiply,
            //       // ),
            //     ),
            //   ),
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  AppMessages.findWhat,
                  style: TextStyleConfig.textStyle(
                    fontFamily: "lucidaCalligraphyItalic",
                    textColor: AppColors.whiteColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  AppMessages.completsYou,
                  style: TextStyleConfig.textStyle(
                    fontFamily: "lucidaCalligraphyItalic",
                    textColor: AppColors.whiteColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 25.h),
                SizedBox(
                  width: 90,
                  height: 90,
                  child: Image.asset(AppImages.locationImage),
                ),
                SizedBox(height: 1.h),
                Text(
                  textAlign: TextAlign.center,
                  AppMessages.gather,
                  style: TextStyleConfig.textStyle(
                    textColor: AppColors.whiteColor,
                    fontFamily: "SFProDisplayRegular",
                    fontSize: 23.sp,
                  ),
                )
              ],
            ).commonOnlyPadding(top: 30),
          ],
        ),
      ),
    );
  }
}
