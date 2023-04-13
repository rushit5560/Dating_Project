import 'dart:math';
import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/font_family.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swipable_stack/swipable_stack.dart';
import '../../constants/colors.dart';
import '../../constants/enums.dart';
import '../../controller/home_screen_controller.dart';
import '../../utils/style.dart';

class CardSwipeModule extends StatelessWidget {
  CardSwipeModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return homeScreenController.suggestionList.isEmpty
        ? SizedBox(
            height: Get.height * 0.70,
            child: const Center(
              child: Text('No Matches Found'),
            ),
          )
        : Column(
            children: [
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
                      allowVerticalSwipe: false,
                      swipeAnchor: SwipeAnchor.bottom,
                      cancelAnimationCurve: Curves.bounceIn,
                      onSwipeCompleted: (index, swipeDirection) async {
                        if (swipeDirection == SwipeDirection.right) {
                          await homeScreenController.superLoveProfileFunction(
                            likedId:
                                "${homeScreenController.suggestionList[index].id}",
                            likeType: LikeType.like,
                          );
                          homeScreenController.suggestionList.removeAt(0);
                          print(
                              "homeScreenController.suggestionList[index].id ${homeScreenController.suggestionList[0].id}");
                        } else if (swipeDirection == SwipeDirection.up) {
                          await homeScreenController.superLoveProfileFunction(
                            likedId:
                                "${homeScreenController.suggestionList[index].id}",
                            likeType: LikeType.super_love,
                          );
                          homeScreenController.suggestionList.removeAt(0);
                          print(
                              "homeScreenController.suggestionList[index].id ${homeScreenController.suggestionList[0].id}");
                        } else if (swipeDirection == SwipeDirection.left) {
                          homeScreenController.suggestionList.removeAt(0);
                          print(
                              "homeScreenController.suggestionList[index].id ${homeScreenController.suggestionList[0].id}");

                          //todo - when user swipe left
                        }
                      },
                      overlayBuilder: (context, properties) {
                        final opacity = min(properties.swipeProgress, 1.0);
                        final isRight =
                            properties.direction == SwipeDirection.right;

                        return Container(
                          decoration:
                              const BoxDecoration(color: Colors.white24),
                          child: Opacity(
                            opacity: opacity,
                            child: Center(
                              child: isRight
                                  ? const Icon(
                                      Icons.favorite,
                                      color: AppColors.lightOrangeColor,
                                      size: 70,
                                    )
                                  : const Icon(
                                      Icons.close_rounded,
                                      color: AppColors.whiteColor,
                                      size: 70,
                                    ),
                            ),
                          ),
                        );
                      },
                      controller: homeScreenController.cardController,
                      itemCount: homeScreenController.suggestionList.length,
                      builder: (context, sp) {
                        // MatchPersonData singleItem = homeScreenController.matchesList[sp.index];

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
                  // Cancel Button
                  IconButton(
                    onPressed: () {
                       homeScreenController.suggestionList.removeAt(0);
                          print(
                              "homeScreenController.suggestionList[index].id ${homeScreenController.suggestionList[0].id}");
                      //todo - when user swipe left
                      // homeScreenController.cardController.next(
                      //   swipeDirection: SwipeDirection.left,
                      //   duration: const Duration(milliseconds: 600),
                      // );
                    },
                    icon: Image.asset(AppImages.cancelImage),
                  ),

                  // Star Button
                  IconButton(
                    onPressed: () async {
                      await homeScreenController.superLoveProfileFunction(
                        likedId: "${homeScreenController.singlePersonData.id}",
                        likeType: LikeType.super_love,
                      );
                       homeScreenController.suggestionList.removeAt(0);
                          print(
                              "homeScreenController.suggestionList[index].id ${homeScreenController.suggestionList[0].id}");
                    },
                    icon: Image.asset(AppImages.starImage),
                  ),

                  // Like Button
                  IconButton(
                    onPressed: () async {
                      await homeScreenController.superLoveProfileFunction(
                        likedId: "${homeScreenController.singlePersonData.id}",
                        likeType: LikeType.like,
                      );
                       homeScreenController.suggestionList.removeAt(0);
                          print(
                              "homeScreenController.suggestionList[index].id ${homeScreenController.suggestionList[0].id}");
                    },
                    icon: Image.asset(AppImages.likeImage),
                  ),
                ],
              ).commonOnlyPadding(left: 15.w, right: 15.w),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      '${homeScreenController.singlePersonData.name}, ${homeScreenController.singlePersonData.age}',
                      style: TextStyleConfig.textStyle(
                        textColor: AppColors.grey800Color,
                        fontSize: 18.sp,
                        fontFamily: FontFamilyText.sFProDisplaySemibold,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 1.w),
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
                          " ${homeScreenController.singlePersonData.distance}",
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
                    "${homeScreenController.singlePersonData.profilePrompts}",
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
    // print("object ${homeScreenController.basicList.length}");
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
            homeScreenController.basicList.length,
            (int index) {
              return Transform(
                transform: Matrix4.identity()..scale(0.9),
                child: ChoiceChip(
                  avatar: CircleAvatar(
                    backgroundImage: AssetImage(
                      homeScreenController.basicList[index].image,
                    ),
                  ).commonOnlyPadding(left: 2),
                  label: Text(
                    "smoking",
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
              AppMessages.languagesIKnow,
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
              AppMessages.locationText,
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
