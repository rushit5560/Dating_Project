// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'package:sizer/sizer.dart';

import 'package:dater/common_modules/custom_loader.dart';
import 'package:dater/common_modules/switch_and_slider.dart';
import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/font_family.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/utils/extensions.dart';
import 'package:dater/utils/style.dart';

import '../../constants/enums.dart';
import '../../controller/edit_profile_screen_controller.dart';

class RecodebleGridViewModule extends StatelessWidget {
  RecodebleGridViewModule({super.key});
  final editProfileScreenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => editProfileScreenController.isLoading.value
          ? const CustomLoader()
          : ReorderableGridView.builder(
              itemCount: editProfileScreenController.captureImageList.length < 9
                  ? editProfileScreenController.captureImageList.length + 1
                  : editProfileScreenController.captureImageList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              onReorder: ((oldIndex, newIndex) {
                log('oldIndex : $oldIndex');
                log('newIndex : $newIndex');
                editProfileScreenController.isLoading(true);
                if (editProfileScreenController.captureImageList.length < 9) {
                  if (oldIndex !=
                          editProfileScreenController.captureImageList.length &&
                      newIndex !=
                          editProfileScreenController.captureImageList.length) {
                    File path = editProfileScreenController.captureImageList
                        .removeAt(oldIndex);
                    editProfileScreenController.captureImageList
                        .insert(newIndex, path);
                  }
                } else {
                  File path = editProfileScreenController.captureImageList
                      .removeAt(oldIndex);
                  editProfileScreenController.captureImageList
                      .insert(newIndex, path);
                }
                editProfileScreenController.isLoading(false);
              }),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, i) {
                int lastNumber =
                    editProfileScreenController.captureImageList.length;
                // log('i : $i');
                // log('lastNumber : $lastNumber');

                return lastNumber != i
                    ? Container(
                        padding: const EdgeInsets.only(left: 5, top: 5),
                        key: ValueKey(
                            editProfileScreenController.captureImageList),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          onTap: () =>
                              editProfileScreenController.getImageFromGallery(),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.grey200Color,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: FileImage(
                                      File(
                                        editProfileScreenController
                                            .captureImageList[i].path,
                                      ),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async =>
                                    await editProfileScreenController
                                        .deleteUserImageFunction(i),
                                child: Image.asset(
                                  AppImages.cancel2,
                                  height: 20,
                                  width: 20,
                                ).commonOnlyPadding(bottom: 10, right: 10),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Stack(
                        alignment: Alignment.bottomRight,
                        key: ValueKey(
                            editProfileScreenController.captureImageList),
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.grey200Color,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ).commonOnlyPadding(left: 10, top: 10),
                          GestureDetector(
                            onTap: () async => await editProfileScreenController
                                .getImageFromGallery(),
                            child: Image.asset(
                              AppImages.add,
                              height: 20,
                              width: 20,
                            ).commonOnlyPadding(bottom: 10, right: 10),
                          )
                        ],
                      );
              },
            ),
    );
  }
}

class EditProfileScreenWidgets extends StatelessWidget {
  EditProfileScreenWidgets({super.key});
  final editProfileScreenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppMessages.holdAndDragText,
          style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplayRegular,
            textColor: AppColors.grey600Color,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            Text(
              AppMessages.myInterests,
              style: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplaySemibold,
                textColor: AppColors.grey800Color,
                fontSize: 16.sp,
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              "Get specific about the things you love",
              style: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplayRegular,
                textColor: AppColors.grey600Color,
                fontSize: 12.sp,
              ),
            )
          ],
        ),
        SizedBox(height: 5.h),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: AppColors.grey300Color,
              width: 3,
            ),
          ),
          child: Wrap(
            spacing: 3.0,
            children: List.generate(
              4,
              (int index) {
                bool selected = true;
                return Transform(
                  transform: Matrix4.identity()..scale(0.9),
                  child: ChoiceChip(
                    avatar: const CircleAvatar(
                      backgroundImage: AssetImage(AppImages.ballImage),
                    ),
                    label: Text(
                      'wfg',
                      style: TextStyleConfig.textStyle(
                        fontFamily: FontFamilyText.sFProDisplaySemibold,
                        textColor: AppColors.grey600Color,
                        fontSize: 16,
                      ),
                    ),
                    selected: selected,
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
                ).commonSymmetricPadding(horizontal: 10);
              },
            ).toList(),
          ),
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            Text(
              AppMessages.profilePrompts,
              style: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplaySemibold,
                textColor: AppColors.grey800Color,
                fontSize: 16.sp,
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              "Make your personality stand out from the crowd",
              style: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplayRegular,
                textColor: AppColors.grey600Color,
                fontSize: 12.sp,
              ),
            )
          ],
        ),
        SizedBox(height: 2.h),
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.grey300Color,
              width: 3,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: TextFormField(
                    readOnly: editProfileScreenController.onSelected.value
                        ? false
                        : true,
                    cursorColor: AppColors.lightOrangeColor,
                    decoration: InputDecoration(
                      hintText: "Life is simple Don't overthink it",
                      hintStyle: TextStyleConfig.textStyle(
                        fontFamily: FontFamilyText.sFProDisplayRegular,
                        textColor: AppColors.grey600Color,
                        fontSize: 15.sp,
                      ),
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
                    ),
                    style: TextStyleConfig.textStyle(
                      fontFamily: FontFamilyText.sFProDisplayRegular,
                      fontSize: 15.sp,
                      textColor: AppColors.grey600Color,
                    ),
                  ),
                ),
              ),
              Obx(
                () => Transform.scale(
                  scale: 0.7,
                  child: FlutterSwitch(
                    // toggleSize: 40.0,
                    activeColor: AppColors.darkOrangeColor,
                    activeToggleColor: AppColors.blackColor,
                    inactiveToggleColor: AppColors.blackColor,
                    inactiveSwitchBorder: Border.all(
                      width: 3,
                      color: AppColors.blackColor,
                    ),
                    activeSwitchBorder: Border.all(
                      width: 3,
                      color: AppColors.blackColor,
                    ),
                    onToggle: (value) {
                      editProfileScreenController.isLoading(true);
                      editProfileScreenController.onSelected.value = value;
                      editProfileScreenController.isLoading(false);
                    },
                    value: editProfileScreenController.onSelected.value,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            Text(
              AppMessages.myBio,
              style: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplaySemibold,
                textColor: AppColors.grey800Color,
                fontSize: 16.sp,
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              "Write a fun and punchy intro",
              style: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplayRegular,
                textColor: AppColors.grey600Color,
                fontSize: 12.sp,
              ),
            )
          ],
        ),
        SizedBox(height: 2.h),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.grey300Color,
              width: 3,
            ),
          ),
          child: TextFormField(
            cursorColor: AppColors.lightOrangeColor,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "A little bit about you ...",
              hintStyle: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplayRegular,
                textColor: AppColors.grey600Color,
                fontSize: 15.sp,
              ),
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
            ),
            style: TextStyleConfig.textStyle(
              fontFamily: FontFamilyText.sFProDisplayRegular,
              fontSize: 15.sp,
              textColor: AppColors.grey600Color,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            Text(
              AppMessages.myBasics,
              style: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplaySemibold,
                textColor: AppColors.grey800Color,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        MyBasicRowmodule(
          gesOnTap: () {},
          image: AppImages.workImage,
          lableText: "Work",
          text: "Add",
        ),
        MyBasicRowmodule(
          gesOnTap: () {},
          image: AppImages.educationImage,
          lableText: "Education",
          text: "Add",
        ),
        MyBasicRowmodule(
          gesOnTap: () {},
          image: AppImages.covedImage,
          lableText: "Coved dating",
          text: "Add",
        ),
        MyBasicRowmodule(
          gesOnTap: () {},
          image: AppImages.genderImage,
          lableText: "Gender",
          text: "Add",
        ),
        MyBasicRowmodule(
          gesOnTap: () {},
          image: AppImages.location3Image,
          lableText: "Location",
          text: "Add",
        ),
        MyBasicRowmodule(
          gesOnTap: () {},
          image: AppImages.homeTownImage,
          lableText: "Hometown",
          text: "Add",
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            Text(
              AppMessages.moreAboutMe,
              style: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplaySemibold,
                textColor: AppColors.grey800Color,
                fontSize: 16.sp,
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              "Cover things most people are curious about",
              style: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplayRegular,
                textColor: AppColors.grey600Color,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            Image.asset(AppImages.heightImage),
            SizedBox(width: 3.w),
            Text(
              AppMessages.height,
              style: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplayRegular,
                textColor: AppColors.grey600Color,
                fontSize: 15.sp,
              ),
            ),
            // const Spacer(),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text(
                      textAlign: TextAlign.end,
                      "${editProfileScreenController.endVal.value.toStringAsFixed(0)} cm",
                      style: TextStyleConfig.textStyle(
                        fontFamily: FontFamilyText.sFProDisplayRegular,
                        textColor: AppColors.grey600Color,
                        fontSize: 13.sp,
                      ),
                    ),
                    SliderTheme(
                      data: const SliderThemeData(trackHeight: 1),
                      child: Slider(
                        min: 0,
                        max: 220,
                        activeColor: AppColors.lightOrangeColor,
                        inactiveColor: AppColors.darkGreyColor,
                        value: editProfileScreenController.endVal.value,
                        onChanged: (double value) {
                          editProfileScreenController.isLoading(true);
                          // editProfileScreenController.startVal.value = value.start;
                          // editProfileScreenController.startVal.value = 0;
                          editProfileScreenController.endVal.value = value;
                          editProfileScreenController.isLoading(false);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
        // Exercise
        FilterRowmodule(
          image: AppImages.exerciseImage,
          lableText: "Exercise",
          text1: "No",
          text2: "Sometimes",
          text3: "Yes",
          containerColor1: editProfileScreenController.exerciseValue == MoreAboutMe.no ? AppColors.lightOrangeColor : AppColors.grey500Color,
          containerColor2: editProfileScreenController.exerciseValue == MoreAboutMe.sometimes ? AppColors.lightOrangeColor : AppColors.grey500Color,
          containerColor3: editProfileScreenController.exerciseValue == MoreAboutMe.yes ? AppColors.lightOrangeColor : AppColors.grey500Color,
          gesOnTap1: () {
            editProfileScreenController.exerciseValue = MoreAboutMe.no;
            editProfileScreenController.loadUI();
          },
          gesOnTap2: () {
            editProfileScreenController.exerciseValue = MoreAboutMe.sometimes;
            editProfileScreenController.loadUI();
          },
          gesOnTap3: () {
            editProfileScreenController.exerciseValue = MoreAboutMe.yes;
            editProfileScreenController.loadUI();
          },
        ),

        // Drinking
        FilterRowmodule(
          image: AppImages.drinkingImage,
          lableText: "Drinking",
          text1: "No",
          text2: "Socially",
          text3: "Yes",
          containerColor1: editProfileScreenController.drinkingValue == MoreAboutMe.no ? AppColors.lightOrangeColor : AppColors.grey500Color,
          containerColor2: editProfileScreenController.drinkingValue == MoreAboutMe.sometimes ? AppColors.lightOrangeColor : AppColors.grey500Color,
          containerColor3: editProfileScreenController.drinkingValue == MoreAboutMe.yes ? AppColors.lightOrangeColor : AppColors.grey500Color,
          gesOnTap1: () {
            editProfileScreenController.drinkingValue = MoreAboutMe.no;
            editProfileScreenController.loadUI();
          },
          gesOnTap2: () {
            editProfileScreenController.drinkingValue = MoreAboutMe.sometimes;
            editProfileScreenController.loadUI();
          },
          gesOnTap3: () {
            editProfileScreenController.drinkingValue = MoreAboutMe.yes;
            editProfileScreenController.loadUI();
          },
        ),

        // Smoking
        FilterRowmodule(
          image: AppImages.smokingImage,
          lableText: "Smoking",
          text1: "No",
          text2: "Socially",
          text3: "Yes",
          containerColor1: editProfileScreenController.smokingValue == MoreAboutMe.no ? AppColors.lightOrangeColor : AppColors.grey500Color,
          containerColor2: editProfileScreenController.smokingValue == MoreAboutMe.sometimes ? AppColors.lightOrangeColor : AppColors.grey500Color,
          containerColor3: editProfileScreenController.smokingValue == MoreAboutMe.yes ? AppColors.lightOrangeColor : AppColors.grey500Color,
          gesOnTap1: () {
            editProfileScreenController.smokingValue = MoreAboutMe.no;
            editProfileScreenController.loadUI();
          },
          gesOnTap2: () {
            editProfileScreenController.smokingValue = MoreAboutMe.sometimes;
            editProfileScreenController.loadUI();
          },
          gesOnTap3: () {
            editProfileScreenController.smokingValue = MoreAboutMe.yes;
            editProfileScreenController.loadUI();
          },
        ),

        // Kids
        /*FilterRowmodule(
          image: AppImages.kidsImage,
          lableText: "Kids",
          text1: "No",
          gesOnTap1: () {
            editProfileScreenController.isLoading(true);

            editProfileScreenController.kidsgNoSelected.value =
                !editProfileScreenController.kidsgNoSelected.value;
            editProfileScreenController.isLoading(false);
          },
          containerColor1: editProfileScreenController.kidsgNoSelected.value
              ? AppColors.lightOrangeColor
              : AppColors.grey500Color,
          text2: "Want someday",
          gesOnTap2: () {
            editProfileScreenController.isLoading(true);

            editProfileScreenController.kidsSociallySelected.value =
                !editProfileScreenController.kidsSociallySelected.value;
            editProfileScreenController.isLoading(false);
          },
          containerColor2:
              editProfileScreenController.kidsSociallySelected.value
                  ? AppColors.lightOrangeColor
                  : AppColors.grey500Color,
          text3: "Yes",
          gesOnTap3: () {
            editProfileScreenController.isLoading(true);

            editProfileScreenController.kidsYesSelected.value =
                !editProfileScreenController.kidsYesSelected.value;
            editProfileScreenController.isLoading(false);
          },
          containerColor3: editProfileScreenController.kidsYesSelected.value
              ? AppColors.lightOrangeColor
              : AppColors.grey500Color,
        ),*/
        FilterRowmodule(
          image: AppImages.kidsImage,
          lableText: "Kids",
          text1: "No",
          text2: "Want someday",
          text3: "Yes",
          containerColor1: editProfileScreenController.kidsValue == MoreAboutMe.no ? AppColors.lightOrangeColor : AppColors.grey500Color,
          containerColor2: editProfileScreenController.kidsValue == MoreAboutMe.sometimes ? AppColors.lightOrangeColor : AppColors.grey500Color,
          containerColor3: editProfileScreenController.kidsValue == MoreAboutMe.yes ? AppColors.lightOrangeColor : AppColors.grey500Color,
          gesOnTap1: () {
            editProfileScreenController.kidsValue = MoreAboutMe.no;
            editProfileScreenController.loadUI();
          },
          gesOnTap2: () {
            editProfileScreenController.kidsValue = MoreAboutMe.sometimes;
            editProfileScreenController.loadUI();
          },
          gesOnTap3: () {
            editProfileScreenController.kidsValue = MoreAboutMe.yes;
            editProfileScreenController.loadUI();
          },
        ),

        MyBasicRowmodule(
          gesOnTap: () {},
          image: AppImages.educationImage,
          lableText: "Education level",
          text: "Undergraduate Degree",
        ),
        MyBasicRowmodule(
          gesOnTap: () {},
          image: AppImages.starImage,
          lableText: "Education level",
          text: "Sagittarius",
        ),
        MyBasicRowmodule(
          gesOnTap: () {},
          image: AppImages.politicsImage,
          lableText: "Politics",
          text: "Add",
        ),
        MyBasicRowmodule(
          gesOnTap: () {},
          image: AppImages.religionImage,
          lableText: "Religion",
          text: "Add",
        ),
        MyBasicRowmodule(
          gesOnTap: () {},
          image: AppImages.lookingForImage,
          lableText: "Looking for",
          text: "Relationship",
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            Text(
              AppMessages.languages,
              style: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplaySemibold,
                textColor: AppColors.grey800Color,
                fontSize: 16.sp,
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              "Choose the languages you know",
              style: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplayRegular,
                textColor: AppColors.grey600Color,
                fontSize: 12.sp,
              ),
            )
          ],
        ),
        SizedBox(height: 3.h),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: AppColors.grey300Color,
              width: 3,
            ),
          ),
          child: Wrap(
            spacing: 3.0,
            children: List.generate(
              4,
              (int index) {
                bool selected = true;
                return Transform(
                  transform: Matrix4.identity()..scale(0.9),
                  child: ChoiceChip(
                    avatar: const CircleAvatar(
                      backgroundImage: AssetImage(AppImages.ballImage),
                    ),
                    label: Text(
                      'wfg',
                      style: TextStyleConfig.textStyle(
                        fontFamily: FontFamilyText.sFProDisplaySemibold,
                        textColor: AppColors.grey600Color,
                        fontSize: 16,
                      ),
                    ),
                    selected: selected,
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
                ).commonSymmetricPadding(horizontal: 10);
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class MyBasicRowmodule extends StatelessWidget {
  Function() gesOnTap;
  String lableText;
  String image;
  String text;
  MyBasicRowmodule({
    Key? key,
    required this.gesOnTap,
    required this.lableText,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gesOnTap,
      child: Row(
        children: [
          Image.asset(image),
          SizedBox(width: 3.w),
          Text(
            lableText,
            style: TextStyleConfig.textStyle(
              fontFamily: FontFamilyText.sFProDisplayRegular,
              textColor: AppColors.grey600Color,
              fontSize: 15.sp,
            ),
          ),
          Expanded(
            child: Text(
              textAlign: TextAlign.end,
              text,
              style: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplayRegular,
                textColor: AppColors.grey600Color,
                fontSize: 14.sp,
              ),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.grey600Color,
          ),
        ],
      ),
    ).commonOnlyPadding(bottom: 2.h);
  }
}

class FilterRowmodule extends StatelessWidget {
  String lableText;
  String image;
  String text1;
  String text2;
  String text3;
  Function() gesOnTap1;
  Function() gesOnTap2;
  Function() gesOnTap3;
  Color containerColor1;
  Color containerColor2;
  Color containerColor3;

  FilterRowmodule({
    Key? key,
    required this.lableText,
    required this.image,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.gesOnTap1,
    required this.gesOnTap2,
    required this.gesOnTap3,
    required this.containerColor1,
    required this.containerColor2,
    required this.containerColor3,
  }) : super(key: key);
  final editProfileScreenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
        ),
        SizedBox(width: 3.w),
        Text(
          lableText,
          style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplayRegular,
            textColor: AppColors.grey600Color,
            fontSize: 15.sp,
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 12.w,
              child: Column(
                children: [
                  Text(
                    text1,
                    style: TextStyleConfig.textStyle(
                      fontFamily: FontFamilyText.sFProDisplayRegular,
                      textColor: AppColors.grey600Color,
                      fontSize: 12.sp,
                    ),
                  ),
                  InkWell(
                    onTap: gesOnTap1,
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: containerColor1,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 27.w,
              child: Column(
                children: [
                  Text(
                    text2,
                    style: TextStyleConfig.textStyle(
                      fontFamily: FontFamilyText.sFProDisplayRegular,
                      textColor: AppColors.grey600Color,
                      fontSize: 12.sp,
                    ),
                  ),
                  InkWell(
                    onTap: gesOnTap2,
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: containerColor2,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 12.w,
              child: Column(
                children: [
                  Text(
                    text3,
                    style: TextStyleConfig.textStyle(
                      fontFamily: FontFamilyText.sFProDisplayRegular,
                      textColor: AppColors.grey600Color,
                      fontSize: 12.sp,
                    ),
                  ),
                  InkWell(
                    onTap: gesOnTap3,
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: containerColor3,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    ).commonOnlyPadding(bottom: 2.h);
  }
}
