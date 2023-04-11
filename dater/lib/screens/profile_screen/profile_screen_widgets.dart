import 'dart:async';

import 'package:dater/screens/settings_screen/settings_screen.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../constants/app_images.dart';
import '../../constants/colors.dart';
import '../../constants/font_family.dart';
import '../../controller/profile_screen_controller.dart';
import '../../utils/style.dart';
import '../edit_profile_screen/edit_profile_screen.dart';


class ProfileModule extends StatelessWidget {
   ProfileModule({Key? key}) : super(key: key);
 final profileScreenController = Get.find<ProfileScreenController>();
 @override
  Widget build(BuildContext context) {
    return
       Center(
            child: Stack(
              fit: StackFit.loose,
              children: [
                SizedBox(
                  //height: 17.5.h,
                  height: 170,
                  width: 150,
                  child:
                     SfRadialGauge(
                        axes: [
                          RadialAxis(
                            minimum: 0,
                            maximum: 100,
                            showLabels: false,
                            showTicks: false,
                            startAngle: 45,
                            endAngle: 405,
                            axisLineStyle: const AxisLineStyle(
                              thickness: 0.09,
                              cornerStyle: CornerStyle.bothCurve,
                              color:  AppColors.grey700Color,
                              thicknessUnit: GaugeSizeUnit.factor,
                            ),
                            pointers: <GaugePointer>[
                              RangePointer(
                                  value: profileScreenController.progressValue,
                                  width: 0.06,
                                  color: AppColors.darkOrangeColor,
                                  sizeUnit: GaugeSizeUnit.factor,
                                  enableAnimation: true,
                                  animationDuration: 100,
                                  animationType: AnimationType.linear)
                            ],
                          ),
                        ],
                    ),

                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: profileScreenController.userImages.isEmpty
                  ? Container(
                    height: 130,
                    width: 130,
                    decoration:  const BoxDecoration(
                      color: AppColors.grey700Color,
                      shape: BoxShape.circle,
                      image:  DecorationImage(
                        image: AssetImage(
                          AppImages.swiper2Image,
                        ),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  )
                  : Container(
                    height: 130,
                    width: 130,
                    decoration:  BoxDecoration(
                      color: AppColors.grey700Color,
                      shape: BoxShape.circle,
                      image:  DecorationImage(
                        image: NetworkImage(profileScreenController.userImages[0]),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 4,
                  bottom: 25,
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5.0,
                              offset: Offset(-0, 2),
                              color: AppColors.grey800Color
                          )]
                    ),
                    child: Text(
                      '${profileScreenController.progressValue.toStringAsFixed(0)}%',
                      style: TextStyle(
                        fontFamily: FontFamilyText.sFProDisplaySemibold,
                        fontSize: 11,
                      ),
                    ).commonAllSidePadding(10),
                  ),
                ),
              ],
            ),

    );
  }
}

class ProfileTextModule extends StatelessWidget {
  ProfileTextModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Get.to(()=> SettingsScreen()),
            icon: const Icon(
              Icons.settings_outlined,
              color: AppColors.darkOrangeColor,
              size: 30,
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${screenController.userName.value},${screenController.userAge.value} ',
                  style: TextStyleConfig.textStyle(
                    textColor: AppColors.grey800Color,
                    fontFamily: FontFamilyText.sFProDisplayRegular,
                    fontSize: 14.sp,
                  ),
                ),
                screenController.userVerified.value == "0"
                    ? WidgetSpan(child: Container())
                    : WidgetSpan(child: Image.asset(AppImages.rightImage))
              ],
            ),
          ),
          IconButton(
              onPressed: ()=> Get.to(()=>  EditProfileScreen(), arguments: [screenController.userDetails])!.then((value) async {
                await screenController.setDataInUserVariablesFunction();
              }),
              icon: const Icon(Icons.edit_outlined,color: AppColors.darkOrangeColor,size: 20,))
        ],
      ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Art Manager  ',
                style: TextStyleConfig.textStyle(
                  textColor: AppColors.grey800Color,
                  fontFamily: FontFamilyText.sFProDisplayRegular,
                  fontSize: 12.sp,
                ),
              ),
              WidgetSpan(child: Image.asset(AppImages.location2Image,height: 2.h,)),
              TextSpan(
                text: ' 10 miles',
                style: TextStyleConfig.textStyle(
                  textColor: AppColors.grey800Color,
                  fontFamily: FontFamilyText.sFProDisplayRegular,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.h),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: screenController.userProfilePrompts.value,
                style: TextStyleConfig.textStyle(
                  textColor: AppColors.grey800Color,
                  fontFamily: FontFamilyText.sFProDisplayRegular,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 1.h),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "Gender: ",
                style: TextStyleConfig.textStyle(
                  textColor: AppColors.grey800Color,
                  fontFamily: FontFamilyText.sFProDisplayRegular,
                  fontSize: 12.sp,
                ),
              ),
              TextSpan(
                text: screenController.userGender.value,
                style: TextStyleConfig.textStyle(
                  textColor: AppColors.darkOrangeColor,
                  fontFamily: FontFamilyText.sFProDisplayRegular,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
    ]);
  }
}


class AboutMeAllModule extends StatelessWidget {
  AboutMeAllModule({Key? key}) : super(key: key);
  final screenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    bool selected = true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        screenController.userImages.length < 2
        ? Container()
        : Container(
          height: 50.h,
          decoration: BoxDecoration(
            color: AppColors.grey500Color,
            image:  DecorationImage(
              image: NetworkImage(screenController.userImages[1]),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20))
          ),
        ),
        SizedBox(height: 2.h),
        Text('About me',
          style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplayBold,
            textColor: AppColors.grey800Color,
            //fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 1.h),
        Text(screenController.userBio.value,
          style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplayBold,
            textColor: AppColors.grey800Color,
            //fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 2.h),
        Text("Basics",
          style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplayBold,
            textColor: AppColors.grey800Color,
            //fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 2.h),
        Wrap(
          spacing: 3.0,
          children: List.generate(
            screenController.basicList.length,
                (int index) {
              return Transform(
                transform: Matrix4.identity()..scale(0.9),
                child: ChoiceChip(
                  avatar:CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(screenController.basicList[index].image),
                  ),
                  label: Text(
                    screenController.basicList[index].name,
                    // "${screenController.userHeight.value.split('.')[0]} cm",

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
        Text("Interests",
          style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplayBold,
            textColor: AppColors.grey800Color,
            //fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 2.h),
        Wrap(
          spacing: 3.0,
          children: List.generate(
            screenController.interestList.length,
                (int index) {
              return Transform(
                transform: Matrix4.identity()..scale(0.9),
                child: ChoiceChip(
                  avatar:CircleAvatar(
                    backgroundImage: AssetImage(screenController.interestList[index].image),
                  ),
                  label: Text(
                    screenController.interestList[index].name,
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
        SizedBox(height: 2.h),
        screenController.userImages.length < 3
        ? Container()
        : Container(
          height: 50.h,
          decoration:  BoxDecoration(
              color: AppColors.grey500Color,
              image:  DecorationImage(
                image: NetworkImage(
                  screenController.userImages[2],
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20))
          ),
        ),
        SizedBox(height: 2.h),
        Text("Languages I Known",
          style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplayBold,
            textColor: AppColors.grey800Color,
            //fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 2.h),
        Wrap(
          spacing: 3.0,
          children: List.generate(
            4,
                (int index) {
              return Transform(
                transform: Matrix4.identity()..scale(0.9),
                child: ChoiceChip(
                  avatar:const CircleAvatar(
                    backgroundImage: AssetImage(AppImages.languageImage),
                    backgroundColor: Colors.transparent,
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
        SizedBox(height: 2.h),
        screenController.userImages.length < 3
        ? Container()
        : Container(
          height: 50.h,
          decoration:  BoxDecoration(
              color: AppColors.grey500Color,
              image:  DecorationImage(
                image: NetworkImage(
                  screenController.userImages[2],
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
        ),
        SizedBox(height: 2.h),
        Text("${screenController.userName}'s Location",
          style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplayBold,
            textColor: AppColors.grey800Color,
            //fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 1.h),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              WidgetSpan(child: Image.asset(AppImages.location2Image,height: 2.h,)),
              TextSpan(
                text: ' New south Wales, Sydney 3 km away',
                style: TextStyleConfig.textStyle(
                  textColor: AppColors.grey800Color,
                  fontFamily: FontFamilyText.sFProDisplayRegular,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.h),
        Wrap(
          spacing: 3.0,
          children: List.generate(
            4,
                (int index) {
              return Transform(
                transform: Matrix4.identity()..scale(0.9),
                child: ChoiceChip(
                  avatar:const CircleAvatar(
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
      ],
    ).commonSymmetricPadding(horizontal: 25,vertical: 20);
  }
}

