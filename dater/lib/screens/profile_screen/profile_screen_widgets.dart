import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../constants/app_images.dart';
import '../../constants/colors.dart';
import '../../constants/font_family.dart';
import '../../controller/auth_screen_controllers/profile_screen_controller.dart';
import '../../utils/style.dart';

class ProfileModule extends StatelessWidget {
   ProfileModule({Key? key}) : super(key: key);
 final profileScreenController = Get.find<ProfileScreenController>();
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Stack(
            fit: StackFit.loose,
            children: [
              SizedBox(
                height: 17.5.h,
                width: 17.5.h,
                child: SfRadialGauge(
                    axes: [
                      RadialAxis(
                        minimum: 0,
                        maximum: 100,
                        showLabels: false,
                        showTicks: false,
                        startAngle: 30,
                        endAngle: 385,
                        axisLineStyle: const AxisLineStyle(
                          thickness: 0.06,
                          cornerStyle: CornerStyle.bothCurve,
                          color: AppColors.darkOrangeColor,
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                        pointers: <GaugePointer>[
                          RangePointer(
                              value: profileScreenController.progressValue.value,
                              width: 0.05,
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
                left: 7,
                top: 7,
                child: Container(
                  height: 15.7.h,
                  width: 15.7.h,
                  decoration:  const BoxDecoration(
                    color: AppColors.grey500Color,
                    shape: BoxShape.circle,
                    image:  DecorationImage(
                      image: AssetImage(
                        AppImages.swiper2Image,
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 2,
                bottom: 15,
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
  const ProfileTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.settings_outlined,color: AppColors.darkOrangeColor,size: 30,)),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Eliza Williams,23 ',
                  style: TextStyleConfig.textStyle(
                    textColor: AppColors.grey800Color,
                    fontFamily: FontFamilyText.sFProDisplayRegular,
                    fontSize: 14.sp,
                  ),
                ),
                WidgetSpan(child: Image.asset(AppImages.rightImage))
              ],
            ),
          ),
          IconButton(onPressed: (){}, icon: const Icon(Icons.edit_outlined,color: AppColors.darkOrangeColor,size: 20,))
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
                text: ' 10 miles  ',
                style: TextStyleConfig.textStyle(
                  textColor: AppColors.grey800Color,
                  fontFamily: FontFamilyText.sFProDisplayRegular,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "Feminist Cats. Other stuff that's mildly interesting.",
                style: TextStyleConfig.textStyle(
                  textColor: AppColors.grey800Color,
                  fontFamily: FontFamilyText.sFProDisplayRegular,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "Gender",
                style: TextStyleConfig.textStyle(
                  textColor: AppColors.grey800Color,
                  fontFamily: FontFamilyText.sFProDisplayRegular,
                  fontSize: 12.sp,
                ),
              ),
              TextSpan(
                text: "Woman",
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
  const AboutMeAllModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool selected = true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50.h,
          decoration:  const BoxDecoration(
            color: AppColors.grey500Color,
            image:  DecorationImage(
              image: AssetImage(
                AppImages.swiper1Image,
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))
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
        Text("Life is simple Don't overthink it",
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
        SizedBox(height: 2.h),
        Container(
          height: 50.h,
          decoration:  const BoxDecoration(
              color: AppColors.grey500Color,
              image:  DecorationImage(
                image: AssetImage(
                  AppImages.swiper1Image,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))
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
        SizedBox(height: 2.h),
        Container(
          height: 50.h,
          decoration:  const BoxDecoration(
              color: AppColors.grey500Color,
              image:  DecorationImage(
                image: AssetImage(
                  AppImages.swiper1Image,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
        ),
        SizedBox(height: 2.h),
        Text("Eliza's Location",
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
    ).commonSymmetricPadding(horizontal: 20);
  }
}

