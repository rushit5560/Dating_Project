import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/font_family.dart';
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
  final homeScreenController = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   height: 50.h,
        //   child: SwipeableCardsSection(
        //     cardController: homeScreenController.cardController,
        //     context: context,
        //     items: List.generate(homeScreenController.images.length, (index) {
        //       return Image.asset(homeScreenController.images[index]);
        //     })
        //   ),
        // )
        Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 56.h,
              decoration: const BoxDecoration(
                // color: AppColors.lightOrangeColor,
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.lightorange1,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ).commonSymmetricPadding(horizontal: 16.w),
            Container(
              height: 53.h,
              decoration: const BoxDecoration(
                // color: AppColors.lightOrangeColor,
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.lightorange2,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ).commonSymmetricPadding(horizontal: 8.w),
            Positioned(
              child: SizedBox(
                height: 50.h,
                child: SwipableStack(
                  // allowVerticalSwipe: false,
                  swipeAnchor: SwipeAnchor.bottom,

                  cancelAnimationCurve: Curves.bounceIn,
                  // overlayBuilder: (context, swipeProperty) {
                  //   re
                  // },
                  controller: homeScreenController.cardController,
                  itemCount: 5,
                  //itemCount: imageList.length,
                  builder: (
                    context,
                    index,
                  ) {
                    return Image.asset(
                      AppImages.swiper1Image,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 1.5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => homeScreenController.cardController.rewind(),
              icon: Image.asset(AppImages.cancelImage),
            ),
            IconButton(
              onPressed: () =>
                  homeScreenController.cardController.currentIndex = 0,
              icon: Image.asset(AppImages.starImage),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(AppImages.likeImage),
            ),
          ],
        ).commonOnlyPadding(left: 15.w, right: 15.w),
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Eliza Williams, 23',
              style: TextStyleConfig.textStyle(
                textColor: AppColors.grey800Color,
                fontSize: 18.sp,
                fontFamily: FontFamilyText.sFProDisplaySemibold,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 1.w,
            ),
            Image.asset(AppImages.rightImage),
          ],
        ),
        SizedBox(height: 1.h),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "Art Manager ",
                style: TextStyleConfig.textStyle(
                  textColor: AppColors.grey600Color,
                  fontSize: 16,
                  fontFamily: FontFamilyText.sFProDisplayRegular,
                  // fontWeight: FontWeight.normal,
                ),
              ),
              WidgetSpan(
                child: Image.asset(AppImages.location2Image, height: 2.h),
              ),
              TextSpan(
                text:
                    " 10 miles Feminist. Cats. Other Stuff that's mildly interesting",
                style: TextStyleConfig.textStyle(
                  textColor: AppColors.grey600Color,
                  fontSize: 16,
                  fontFamily: FontFamilyText.sFProDisplayRegular,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
