import 'dart:math';

import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swipable_stack/swipable_stack.dart';

import '../../constants/app_images.dart';
import '../../constants/colors.dart';
import '../../constants/enums.dart';
import '../../constants/font_family.dart';
import '../../constants/messages.dart';
import '../../controller/liker_details_screen_controller.dart';
import '../../utils/style.dart';


class LikerCardSwipeModule extends StatelessWidget {
  LikerCardSwipeModule({Key? key}) : super(key: key);
  final likerDetailsScreenController = Get.find<LikerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            // Container(
            //   height: 56.h,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(
            //         AppImages.lightorange1,
            //       ),
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // ).commonSymmetricPadding(horizontal: 16.w),
            /*Container(
              height: 53.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.lightorange2,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ).commonSymmetricPadding(horizontal: 8.w),*/
            SizedBox(
              height: 50.h,
              child: SwipableStack(
                allowVerticalSwipe: false,
                swipeAnchor: SwipeAnchor.bottom,
                cancelAnimationCurve: Curves.bounceIn,
                onSwipeCompleted: (index, swipeDirection) async {
                  if(swipeDirection == SwipeDirection.right) {
                    await likerDetailsScreenController.superLoveProfileFunction(
                      likedId: "${likerDetailsScreenController.userDetails.id}",
                      likeType: LikeType.like,
                    );
                  } else if(swipeDirection == SwipeDirection.up) {
                    await likerDetailsScreenController.superLoveProfileFunction(
                      likedId: "${likerDetailsScreenController.userDetails.id}",
                      likeType: LikeType.super_love,
                    );
                  } else if(swipeDirection == SwipeDirection.left) {
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
                controller: likerDetailsScreenController.cardController,
                itemCount: 1, // Only single user data
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
                await likerDetailsScreenController.superLoveProfileFunction(
                  likedId: "${likerDetailsScreenController.userDetails.id}",
                  likeType: LikeType.super_love,
                );
              },
              icon: Image.asset(AppImages.starImage),
            ),

            // Like Button
            IconButton(
              onPressed: () async {
                await likerDetailsScreenController.superLoveProfileFunction(
                  likedId: "${likerDetailsScreenController.userDetails.id}",
                  likeType: LikeType.like,
                );
              },
              icon: Image.asset(AppImages.likeImage),
            ),
          ],
        ).commonOnlyPadding(left: 15.w, right: 15.w),
        SizedBox(height: 2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${likerDetailsScreenController.userDetails.name}, ${likerDetailsScreenController.userDetails.age}',
              style: TextStyleConfig.textStyle(
                textColor: AppColors.grey800Color,
                fontSize: 18.sp,
                fontFamily: FontFamilyText.sFProDisplaySemibold,
                fontWeight: FontWeight.w500,
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
                text: "${likerDetailsScreenController.userDetails.work} ",
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
              "${likerDetailsScreenController.userDetails.bio}",
              style: TextStyleConfig.textStyle(
                fontSize: 13.sp,
                fontFamily: FontFamilyText.sFProDisplaySemibold,
                textColor: AppColors.grey600Color,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        LikerBasicInFormationModule(),
        SizedBox(height: 4.h),
        LikerInterestsInformationModule(),
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
        LikerLanguagesInformationModule(),
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
        LikerLocationInformationModule(),
      ],
    );
  }
}


class LikerBasicInFormationModule extends StatelessWidget {
  LikerBasicInFormationModule({super.key});

  final likerDetailsScreenController = Get.find<LikerDetailsScreenController>();

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
                  selected: likerDetailsScreenController.selected.value,
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

class LikerInterestsInformationModule extends StatelessWidget {
  LikerInterestsInformationModule({super.key});

  final likerDetailsScreenController = Get.find<LikerDetailsScreenController>();

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
        likerDetailsScreenController.userDetails.interest!.isEmpty
        ? Container()
        : Wrap(
          spacing: 3.0,
          children: List.generate(
            likerDetailsScreenController.userDetails.interest!.length,
                (int index) {
              return Transform(
                transform: Matrix4.identity()..scale(0.9),
                child: ChoiceChip(
                  avatar: const CircleAvatar(
                    backgroundImage: AssetImage(AppImages.ballImage),
                  ).commonOnlyPadding(left: 2),
                  label: Text(
                    likerDetailsScreenController.userDetails.interest![index].name,
                    style: TextStyleConfig.textStyle(
                      fontFamily: FontFamilyText.sFProDisplaySemibold,
                      textColor: AppColors.grey600Color,
                      fontSize: 16,
                    ),
                  ),
                  selected: likerDetailsScreenController.selected.value,
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

class LikerLanguagesInformationModule extends StatelessWidget {
  LikerLanguagesInformationModule({super.key});

  final likerDetailsScreenController = Get.find<LikerDetailsScreenController>();

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
                  selected: likerDetailsScreenController.selected.value,
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

class LikerLocationInformationModule extends StatelessWidget {
  LikerLocationInformationModule({super.key});

  final likerDetailsScreenController = Get.find<LikerDetailsScreenController>();

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
                  selected: likerDetailsScreenController.selected.value,
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