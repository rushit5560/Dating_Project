import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/font_family.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/utils/extensions.dart';
import 'package:dater/utils/style.dart';
import 'package:flutter/material.dart';
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

        // const Spacer(),
      ],
    );
  }
}

class TextFormFieldModule extends StatelessWidget {
  const TextFormFieldModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            offset: Offset(12, 0),
            color: AppColors.grey600Color,
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.grey200Color,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintText: AppMessages.typeAMessage,
                  hintStyle: TextStyleConfig.textStyle(
                    fontFamily: FontFamilyText.sFProDisplayRegular,
                    textColor: AppColors.grey400Color,
                  ),
                  prefix: Image.asset(
                    AppImages.emojiImage,
                  ).commonOnlyPadding(top: 10, right: 10),
                ),
              ).commonSymmetricPadding(horizontal: 4.w),
            ).commonSymmetricPadding(horizontal: 10.w),
          ),
        ],
      ),
    );
  }
}
