import 'dart:developer';

import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/button_custom.dart';
class PosterImageModule extends StatelessWidget {
  const PosterImageModule({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      Stack(
        children: [
          Container(
          height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.gray50Color,
          image: const DecorationImage(
            image: AssetImage(AppImages.posterImage),
            fit: BoxFit.fitWidth,
          ),
        ),
    ).commonOnlyPadding(left: 5.w,right: 5.w),
          const LocationImageModule().commonOnlyPadding(top: 39.h),
      ]);
  }
}

class LocationImageModule extends StatelessWidget {
  const LocationImageModule({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
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
      );
  }
}

class WhatsYourNameEmailModule extends StatelessWidget {
  const WhatsYourNameEmailModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
     /* crossAxisAlignment: CrossAxisAlignment.center,*/
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text('''What's Your email?''',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp)),
          ],
        ),
        SizedBox(height: 2.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text('''Don't lose access to Your account ''',maxLines: 1,style: TextStyle(color: AppColors.grey500Color,fontSize: 13.sp)),
          ],
        ),
        //SizedBox(height: 2.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('''so We can contact you, But its optional ! ''',maxLines: 1,style: TextStyle(color: AppColors.grey500Color,fontSize: 13.sp)),
          ],
        ),
        SizedBox(height: 3.h,),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 5.7.h,
                margin:  EdgeInsets.only(left: 6.w, right: 6.w),
                child:
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "Enter your email",
                    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: AppColors.grey400Color)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: AppColors.grey400Color)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: AppColors.grey400Color)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: AppColors.grey400Color)),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonCustom(text: 'Skip', onPressed: () {log('message');},),
          ],
        )
      ],
    );
  }
}

