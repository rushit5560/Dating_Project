import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/font_family.dart';
import 'package:dater/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

class ChatScreenWidgets extends StatelessWidget {
  const ChatScreenWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 3,
              color: AppColors.darkOrangeColor,
            ),
            image: const DecorationImage(
              image: AssetImage(
                AppImages.swiper1Image,
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          "Simon Carter, 23",
          style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplaySemibold,
            textColor: AppColors.grey800Color,
            fontSize: 18.sp,
          ),
        ),
        SizedBox(height: 1.h),
        Text(
          "You’re friends on Gather",
          style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplayMedium,
            textColor: AppColors.grey600Color,
            fontSize: 15.sp,
          ),
        ),
        SizedBox(height: 1.h),
        Text(
          "Lives in California, USA",
          style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplayRegular,
            textColor: AppColors.grey400Color,
            fontSize: 13.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          "Say hi to your new Gather friend, Simon.",
          style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplayMedium,
            textColor: AppColors.grey600Color,
            fontSize: 13.sp,
          ),
        ),
        const Spacer(),
        const TextFormFieldModule()
      ],
    );
  }
}

class TextFormFieldModule extends StatelessWidget {
  const TextFormFieldModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: AppColors.grey500Color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(),
    );
  }
}
