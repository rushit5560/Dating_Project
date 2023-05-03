import 'dart:math';
import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/font_family.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swipable_stack/swipable_stack.dart';
import '../../common_modules/custom_button.dart';
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
                        homeScreenController.currentUserIndex.value = index;
                        int finalIndex = index + 1;
                        print('Swipe Complete finalIndex : $finalIndex');

                        if (swipeDirection == SwipeDirection.right) {
                          await homeScreenController.superLoveProfileFunction(
                            likedId:
                                "${homeScreenController.suggestionList[0].id}",
                            likeType: LikeType.like,
                            swipeCard: true,
                            index: finalIndex,
                          );
                        } else if (swipeDirection == SwipeDirection.left) {
                          // print("Swipe Cancel Button: ${homeScreenController.suggestionList[0].id}");
                          if(finalIndex == homeScreenController.suggestionList.length) {
                            homeScreenController.suggestionList = [];
                            homeScreenController.loadUI();
                          } else {
                            homeScreenController.setChangedUserData(finalIndex);
                            homeScreenController.loadUI();
                          }
                        } else if (swipeDirection == SwipeDirection.up) {
                          await homeScreenController
                              .understandSuperLoveFunction(finalIndex);
                        }

                        /*if (swipeDirection == SwipeDirection.right) {
                          if (homeScreenController.isLikeButtonClick.value == false) {
                            await homeScreenController.superLoveProfileFunction(
                              likedId: "${homeScreenController.suggestionList[index].id}",
                              likeType: LikeType.like,
                              swipeCard: true,
                            );
                            print("Swipe Like Button: ${homeScreenController.suggestionList[0].id}");
                            homeScreenController.isLikeButtonClick(true);
                          } else {
                            homeScreenController.isLikeButtonClick(false);
                          }
                        }*/

                        /*else if (swipeDirection == SwipeDirection.up) {
                          if (homeScreenController.isStarButtonClick.value == false) {
                            await homeScreenController.superLoveProfileFunction(
                              likedId: "${homeScreenController.suggestionList[index].id}",
                              likeType: LikeType.super_love,
                              swipeCard: true,
                            );
                            print("Swipe Up Button: ${homeScreenController.suggestionList[0].id}");
                          } else {
                            homeScreenController.isStarButtonClick(false);
                          }
                        }*/

                        /*else if (swipeDirection == SwipeDirection.left) {
                          if (homeScreenController.isCancelButtonClick.value == false) {
                            homeScreenController.suggestionList.removeAt(0);
                            print("Swipe Cancel Button: ${homeScreenController.suggestionList[0].id}");
                            homeScreenController.setChangedUserData();
                            homeScreenController.isCancelButtonClick(true);
                            //todo - when user swipe left
                          } else {
                            homeScreenController.isCancelButtonClick(false);
                          }
                        }*/
                      },
                      overlayBuilder: (context, properties) {
                        final opacity = min(properties.swipeProgress, 1.0);
                        // final isRight =
                        //     properties.direction == SwipeDirection.right;

                        SwipeDirectionEnum swipeDirectionEnum =
                            properties.direction == SwipeDirection.right
                                ? SwipeDirectionEnum.right
                                : properties.direction == SwipeDirection.left
                                    ? SwipeDirectionEnum.left
                                    : SwipeDirectionEnum.up;

                        return Container(
                          decoration:
                              const BoxDecoration(color: Colors.white24),
                          child: Opacity(
                            opacity: opacity,
                            child: Center(
                              child:
                                  swipeDirectionEnum == SwipeDirectionEnum.right
                                      ? const Icon(
                                          Icons.favorite,
                                          color: AppColors.lightOrangeColor,
                                          size: 70,
                                        )
                                      : swipeDirectionEnum ==
                                              SwipeDirectionEnum.left
                                          ? const Icon(
                                              Icons.close_rounded,
                                              color: AppColors.whiteColor,
                                              size: 70,
                                            )
                                          : const Icon(
                                              Icons.star_border_rounded,
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

                        return homeScreenController.userImageList.isEmpty
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  AppImages.swiper1Image,
                                  width: double.infinity,
                                  fit: BoxFit.fill,//todo
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  homeScreenController.suggestionList[homeScreenController.currentUserIndex.value].images![0].imageUrl,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, obj, st) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        AppImages.swiper1Image,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                    );
                                  },
                                ),
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
                      homeScreenController.cardController.next(
                        swipeDirection: SwipeDirection.left,
                      );
                      /*homeScreenController.isCancelButtonClick(true);
                      homeScreenController.suggestionList.removeAt(0);
                      if(homeScreenController.suggestionList.isEmpty) {
                        homeScreenController.suggestionList.clear();
                        homeScreenController.suggestionList = [];
                      } else {
                        homeScreenController.setChangedUserData();
                      }
                      print(
                          "Button Click Cancel: ${homeScreenController.suggestionList[0].id}");
                      //todo - when user swipe left
                      homeScreenController.loadUI();

                      homeScreenController.cardController.next(
                        swipeDirection: SwipeDirection.left,
                        duration: const Duration(milliseconds: 600),
                      );
                      homeScreenController.isCancelButtonClick(false);*/
                    },
                    icon: Image.asset(AppImages.cancelImage),
                  ),

                  // Star Button
                  IconButton(
                    onPressed: () async {
                      homeScreenController.isStarButtonClick(true);

                      if (homeScreenController.selectedSuperLove.value ==
                          true) {
                        homeScreenController.cardController.next(
                          swipeDirection: SwipeDirection.up,
                          duration: const Duration(milliseconds: 1000),
                        );
                        //todo
                      } else if (homeScreenController.selectedSuperLove.value ==
                          false) {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              elevation: 50,
                              content: StatefulBuilder(
                                builder: (context, setState) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Super love",
                                        style: TextStyleConfig.textStyle(
                                          fontSize: 20,
                                          fontFamily:
                                              FontFamilyText.sFProDisplayBold,
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      Text(
                                        "Every super love will cost you 4 coins",
                                        style: TextStyleConfig.textStyle(
                                          fontSize: 12.sp,
                                          fontFamily: FontFamilyText
                                              .sFProDisplayRegular,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      ButtonCustom(
                                        text: "Undestand",
                                        onPressed: () async {
                                          Get.back();
                                          homeScreenController.cardController
                                              .next(
                                            swipeDirection: SwipeDirection.up,
                                            duration: const Duration(
                                                milliseconds: 1000),
                                          );
                                        },
                                        fontWeight: FontWeight.bold,
                                        textsize: 14.sp,
                                        textFontFamily:
                                            FontFamilyText.sFProDisplayHeavy,
                                        textColor: AppColors.whiteColor2,
                                        backgroundColor:
                                            AppColors.darkOrangeColor,
                                      ).commonSymmetricPadding(horizontal: 35),
                                      SizedBox(height: 1.h),
                                      Row(
                                        children: [
                                          Checkbox(
                                            checkColor:
                                                AppColors.lightOrangeColor,
                                            hoverColor:
                                                AppColors.lightOrangeColor,
                                            activeColor:
                                                AppColors.lightOrangeColor,
                                            tristate: false,
                                            side: const BorderSide(
                                              width: 2,
                                              color: AppColors.blackColor,
                                            ),
                                            shape: const CircleBorder(),
                                            value: homeScreenController
                                                .selectedSuperLove.value,
                                            onChanged: (value) {
                                              setState(() {
                                                homeScreenController
                                                        .selectedSuperLove
                                                        .value =
                                                    !homeScreenController
                                                        .selectedSuperLove
                                                        .value;
                                              });
                                            },
                                          ),
                                          Text(
                                            "don't show again",
                                            style: TextStyleConfig.textStyle(
                                              fontSize: 14.sp,
                                              fontFamily: FontFamilyText
                                                  .sFProDisplayRegular,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                },
                              ),
                            );
                          },
                        );
                      }
                      print(
                          "Button Click Star ${homeScreenController.suggestionList[0].id}");
                    },
                    icon: Image.asset(AppImages.starImage),
                  ),

                  // Like Button
                  IconButton(
                    onPressed: () async {
                      homeScreenController.cardController.next(
                        swipeDirection: SwipeDirection.right,
                      );
                      /*homeScreenController.isLikeButtonClick(true);
                      await homeScreenController.superLoveProfileFunction(
                        likedId: "${homeScreenController.singlePersonData.id}",
                        likeType: LikeType.like,
                        swipeCard: false,
                      );
                      homeScreenController.cardController.next(
                        swipeDirection: SwipeDirection.right,
                      );
                      print(
                          "Button Click Like ${homeScreenController.suggestionList[0].id}");*/
                    },
                    icon: Image.asset(AppImages.likeImage),
                  ),
                ],
              ).commonOnlyPadding(left: 15.w, right: 15.w),
              SizedBox(height: 2.h),
              RichText(
                text: TextSpan(
                  text:
                      '${homeScreenController.name.value}, ${homeScreenController.age.value}',
                  style: TextStyleConfig.textStyle(
                    textColor: AppColors.grey800Color,
                    fontSize: 18.sp,
                    fontFamily: FontFamilyText.sFProDisplaySemibold,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    homeScreenController.verifiedUser.value == "0"
                        ? WidgetSpan(
                            child: SizedBox(width: 1.w),
                          )
                        : const WidgetSpan(child: SizedBox()),
                    homeScreenController.verifiedUser.value == "0"
                        ? WidgetSpan(
                            child: Image.asset(AppImages.rightImage)
                                .commonOnlyPadding(bottom: 5),
                          )
                        : const WidgetSpan(child: SizedBox()),
                  ],
                ),
              ),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${homeScreenController.singlePersonData.name}, ${homeScreenController.singlePersonData.age}',
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
              ),*/
              SizedBox(height: 1.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${homeScreenController.work.value} ",
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
                      text: " ${homeScreenController.distance.value}",
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
              homeScreenController.suggestionList[homeScreenController.currentUserIndex.value].images!.length > 2
                  ? SizedBox(
                      height: 56.h,
                      width: Get.width,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(15),
                      // ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          homeScreenController
                              .suggestionList[
                                  homeScreenController.currentUserIndex.value]
                              .images![1]
                              .imageUrl,
                          fit: BoxFit.fill,
                          errorBuilder: (context, obj, st) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                AppImages.swiper1Image,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : Container(),
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
                    "${homeScreenController.bio}",
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
              homeScreenController.suggestionList[homeScreenController.currentUserIndex.value].images!.length > 3
                  ? SizedBox(
                height: 56.h,
                width: Get.width,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(15),
                // ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    homeScreenController
                        .suggestionList[
                    homeScreenController.currentUserIndex.value]
                        .images![2]
                        .imageUrl,
                    fit: BoxFit.fill,
                    errorBuilder: (context, obj, st) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          AppImages.swiper1Image,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  ),
                ),
              )
                  : Container(),
              /*Container(
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
              ),*/
              SizedBox(height: 5.h),
              LanguagesInformationModule(),
              SizedBox(height: 7.h),

              UserImageShowModule(
                imageListIndex: 4,
                imageShowIndex: 3,
              ),
              UserImageShowModule(
                imageListIndex: 5,
                imageShowIndex: 4,
              ),
              UserImageShowModule(
                imageListIndex: 6,
                imageShowIndex: 5,
              ),
              UserImageShowModule(
                imageListIndex: 7,
                imageShowIndex: 6,
              ),
              UserImageShowModule(
                imageListIndex: 8,
                imageShowIndex: 7,
              ),
              UserImageShowModule(
                imageListIndex: 9,
                imageShowIndex: 8,
              ),


              // SizedBox(height: 5.h),
              LocationInformationModule(),
            ],
          );
  }
}

class UserImageShowModule extends StatelessWidget {
  final int imageListIndex;
  final int imageShowIndex;

  UserImageShowModule(
      {Key? key, required this.imageListIndex, required this.imageShowIndex})
      : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController
                .suggestionList[screenController.currentUserIndex.value]
                .images!
                .length >
            imageListIndex
        ? SizedBox(
            height: 56.h,
            width: Get.width,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(15),
            // ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                screenController
                    .suggestionList[screenController.currentUserIndex.value]
                    .images![imageShowIndex]
                    .imageUrl,
                fit: BoxFit.fill,
                errorBuilder: (context, obj, st) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      AppImages.swiper1Image,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),
            ),
          ).commonSymmetricPadding(vertical: 15)
        : Container();
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
                    homeScreenController.basicList[index].name,
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
            homeScreenController.interestList.length,
            (int index) {
              return Transform(
                transform: Matrix4.identity()..scale(0.9),
                child: ChoiceChip(
                  avatar: const CircleAvatar(
                    backgroundImage: AssetImage(AppImages.ballImage),
                  ).commonOnlyPadding(left: 2),
                  label: Text(
                    homeScreenController.interestList[index],
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
            homeScreenController.languageList.length,
            (int index) {
              return Transform(
                transform: Matrix4.identity()..scale(0.9),
                child: ChoiceChip(
                  avatar: const CircleAvatar(
                    backgroundImage: AssetImage(AppImages.ballImage),
                  ).commonOnlyPadding(left: 2),
                  label: Text(
                    homeScreenController.languageList[index],
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
              "${homeScreenController.name}${AppMessages.locationText}",
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
              "${homeScreenController.homeTown.value}, Sydney \n${homeScreenController.distance.value}",
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
                    index == 0 ? homeScreenController.homeTown.value : 'Sydney',
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
