import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/font_family.dart';
import 'package:dater/constants/messages.dart';
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
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.lightorange2,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ).commonSymmetricPadding(horizontal: 8.w),
            SizedBox(
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
        SizedBox(height: 2.h),
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
        SizedBox(height: 3.h),
        Container(
          height: 56.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage(
                AppImages.swiper1Image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
            Text(
              AppMessages.aboutMe,
              style: TextStyleConfig.textStyle(
                fontSize: 16.sp,
                fontFamily: FontFamilyText.sFProDisplaySemibold,
                textColor: AppColors.grey800Color,
              ),
            ),
          ],
        ),
        SizedBox(height: 0.5.h),
        Row(
          children: [
            Text(
              "Life is simple Don't overthink it",
              style: TextStyleConfig.textStyle(
                fontSize: 13.sp,
                fontFamily: FontFamilyText.sFProDisplaySemibold,
                textColor: AppColors.grey600Color,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        BasicInFormationModule(),
        SizedBox(height: 4.h),
        InterestsInformationModule(),
        SizedBox(height: 7.h),
        Container(
          height: 56.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage(
                AppImages.swiper1Image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        LanguagesInformationModule(),
        SizedBox(height: 7.h),
        Container(
          height: 56.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage(
                AppImages.swiper1Image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        LocationInformationModule(),
      ],
    );
  }
}

class BasicInFormationModule extends StatelessWidget {
  BasicInFormationModule({super.key});
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              AppMessages.basics,
              style: TextStyleConfig.textStyle(
                fontSize: 16.sp,
                fontFamily: FontFamilyText.sFProDisplayBold,
                textColor: AppColors.grey800Color,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Wrap(
          spacing: 3.0,
          children: List.generate(
            7,
            (int index) {
              return Transform(
                transform: Matrix4.identity()..scale(0.9),
                child: ChoiceChip(
                  avatar: const CircleAvatar(
                    backgroundImage: AssetImage(AppImages.ballImage),
                  ).commonOnlyPadding(left: 2),
                  label: Text(
                    'Socially',
                    style: TextStyleConfig.textStyle(
                      fontFamily: FontFamilyText.sFProDisplaySemibold,
                      textColor: AppColors.grey600Color,
                      fontSize: 16,
                    ),
                  ),
                  selected: homeScreenController.selected.value,
                  selectedColor: AppColors.darkOrangeColor,
                  backgroundColor: Colors.white,
                  shape: const StadiumBorder(
                    side: BorderSide(
                      color: AppColors.grey400Color,
                      width: 1.5,
                    ),
                  ),
                  onSelected: (bool value) {},
                ),
              );
            },
          ).toList(),
        )
      ],
    );
  }
}

class InterestsInformationModule extends StatelessWidget {
  InterestsInformationModule({super.key});
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              AppMessages.interests,
              style: TextStyleConfig.textStyle(
                fontSize: 16.sp,
                fontFamily: FontFamilyText.sFProDisplayBold,
                textColor: AppColors.grey800Color,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Wrap(
          spacing: 3.0,
          children: List.generate(
            5,
            (int index) {
              return Transform(
                transform: Matrix4.identity()..scale(0.9),
                child: ChoiceChip(
                  avatar: const CircleAvatar(
                    backgroundImage: AssetImage(AppImages.ballImage),
                  ).commonOnlyPadding(left: 2),
                  label: Text(
                    'Photography',
                    style: TextStyleConfig.textStyle(
                      fontFamily: FontFamilyText.sFProDisplaySemibold,
                      textColor: AppColors.grey600Color,
                      fontSize: 16,
                    ),
                  ),
                  selected: homeScreenController.selected.value,
                  selectedColor: AppColors.darkOrangeColor,
                  backgroundColor: Colors.white,
                  shape: const StadiumBorder(
                    side: BorderSide(
                      color: AppColors.grey400Color,
                      width: 1.5,
                    ),
                  ),
                  onSelected: (bool value) {},
                ),
              );
            },
          ).toList(),
        )
      ],
    );
  }
}

class LanguagesInformationModule extends StatelessWidget {
  LanguagesInformationModule({super.key});
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              AppMessages.languagesIknow,
              style: TextStyleConfig.textStyle(
                fontSize: 16.sp,
                fontFamily: FontFamilyText.sFProDisplayBold,
                textColor: AppColors.grey800Color,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Wrap(
          spacing: 3.0,
          children: List.generate(
            3,
            (int index) {
              return Transform(
                transform: Matrix4.identity()..scale(0.9),
                child: ChoiceChip(
                  avatar: const CircleAvatar(
                    backgroundImage: AssetImage(AppImages.ballImage),
                  ).commonOnlyPadding(left: 2),
                  label: Text(
                    'Japanese',
                    style: TextStyleConfig.textStyle(
                      fontFamily: FontFamilyText.sFProDisplaySemibold,
                      textColor: AppColors.grey600Color,
                      fontSize: 16,
                    ),
                  ),
                  selected: homeScreenController.selected.value,
                  selectedColor: AppColors.darkOrangeColor,
                  backgroundColor: Colors.white,
                  shape: const StadiumBorder(
                    side: BorderSide(
                      color: AppColors.grey400Color,
                      width: 1.5,
                    ),
                  ),
                  onSelected: (bool value) {},
                ),
              );
            },
          ).toList(),
        )
      ],
    );
  }
}

class LocationInformationModule extends StatelessWidget {
  LocationInformationModule({super.key});
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              AppImages.location2Image,
              height: 3.h,
              width: 3.h,
            ),
            SizedBox(width: 1.w),
            Text(
              AppMessages.locationtext,
              style: TextStyleConfig.textStyle(
                fontSize: 16.sp,
                fontFamily: FontFamilyText.sFProDisplayBold,
                textColor: AppColors.grey800Color,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Row(
          children: [
            Text(
              textAlign: TextAlign.start,
              "New South Wales, Sydney \n3 km away",
              style: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplaySemibold,
                textColor: AppColors.grey600Color,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Wrap(
          spacing: 3.0,
          children: List.generate(
            2,
            (int index) {
              return Transform(
                transform: Matrix4.identity()..scale(0.9),
                child: ChoiceChip(
                  avatar: const CircleAvatar(
                    backgroundImage: AssetImage(AppImages.ballImage),
                  ).commonOnlyPadding(left: 2),
                  label: Text(
                    'Live in New  ',
                    style: TextStyleConfig.textStyle(
                      fontFamily: FontFamilyText.sFProDisplaySemibold,
                      textColor: AppColors.grey600Color,
                      fontSize: 16,
                    ),
                  ),
                  selected: homeScreenController.selected.value,
                  selectedColor: AppColors.darkOrangeColor,
                  backgroundColor: Colors.white,
                  shape: const StadiumBorder(
                    side: BorderSide(
                      color: AppColors.grey400Color,
                      width: 1.5,
                    ),
                  ),
                  onSelected: (bool value) {},
                ),
              );
            },
          ).toList(),
        )
      ],
    );
  }
}
