import 'package:dater/constants/app_images.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swipable_stack/swipable_stack.dart';

import '../../constants/colors.dart';
import '../../controller/home_screen_controller.dart';
import '../../utils/style.dart';

class CardSwipeModule extends StatelessWidget {
    CardSwipeModule({Key? key}) : super(key: key);
 final  controller = SwipableStackController();
 final homeScreenController =  Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
          child: SwipableStack(
            controller: controller,
            itemCount: 5,
            //itemCount: imageList.length,
            builder: (context,index,) {
            return  Image.asset(AppImages.swiper1Image);
          },
      ),
        ),
        SizedBox(height: 1.5.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: ()=> controller.rewind(),
                icon: Image.asset(AppImages.cancelImage)),
            IconButton(onPressed: ()=> controller.currentIndex = 0,
                icon: Image.asset(AppImages.starImage)),
            IconButton(onPressed: (){} ,
                icon: Image.asset(AppImages.likeImage)),
          ],
        ).commonOnlyPadding(left: 15.w,right: 15.w),
        SizedBox(height: 2.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Eliza Williams, 23',
              style: TextStyleConfig.textStyle(
                textColor: AppColors.blackColor,
                fontSize: 18.sp,
                fontFamily: "SFProDisplayBlack",
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 1.w,),
            Image.asset(AppImages.rightImage),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Art Manager',
              style: TextStyleConfig.textStyle(
                textColor: AppColors.grey500Color,
                fontSize: 12.sp,
                fontFamily: "SFProDisplayBlack",
                fontWeight: FontWeight.normal,
              ),),
            SizedBox(width: 1.w,),
            Image.asset(AppImages.location2Image,height: 2.h),
            SizedBox(width: 1.w,),
            Text('10 miles',
              style: TextStyleConfig.textStyle(
                textColor: AppColors.grey500Color,
                fontSize: 12.sp,
                fontFamily: "SFProDisplayBlack",
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text("Feminist. Cats. Other Stuff that's mildly",
              style: TextStyleConfig.textStyle(
                textColor: AppColors.grey500Color,
                fontSize: 12.sp,
                fontFamily: "SFProDisplayBlack",
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text('interesting',
              style: TextStyleConfig.textStyle(
                textColor: AppColors.grey500Color,
                fontSize: 12.sp,
                fontFamily: "SFProDisplayBlack",
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
    ]);
  }
}

