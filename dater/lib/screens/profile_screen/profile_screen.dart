import 'package:dater/common_modules/custom_appbar.dart';
import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
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
          children: [
            Center(
              child: Container(
                height: 16.h,
                width: 16.h,
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
            )
          ],
        ).commonOnlyPadding(top: 8.h),
      ),
    );
  }
}
