import 'dart:developer';

import 'package:chips_choice/chips_choice.dart';
import 'package:dater/comman_modules/custom_button.dart';
import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/font_family.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/controller/auth_screen_controllers/interests%20_screen_controller.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/style.dart';

// ignore: must_be_immutable
class InterestsWidgetModule extends StatelessWidget {
  InterestsWidgetModule({Key? key}) : super(key: key);

  final interestsScreenController = Get.find<InterestsScreenController>();
  // var selectedVal = 0;
  // bool  value = true;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: interestsScreenController.categoryList.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(AppImages.creativeImage),
              SizedBox(width: 1.w),
              Text(
                interestsScreenController.categoryList[i].categoryName,
                style: TextStyleConfig.textStyle(
                  fontFamily: "SFProDisplayRegular",
                  textColor: AppColors.blackDarkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ]),
            Wrap(
              spacing: 3.0,
              children: List.generate(
                interestsScreenController.categoryList[i].options.length,
                (int index) {
                  return Transform(
                    transform: Matrix4.identity()..scale(0.9),
                    child: ChoiceChip(
                      label: Text(
                        interestsScreenController
                            .categoryList[i].options[index].name,
                        style: TextStyleConfig.textStyle(
                          fontFamily: FontFamilyText.sFProDisplaySemibold,
                          textColor:
                              interestsScreenController.isSelectedValue == index
                                  ? AppColors.blackDarkColor
                                  : AppColors.grey600Color,
                        ),
                      ),
                      selected:
                          interestsScreenController.isSelectedValue == index,
                      selectedColor: AppColors.darkOrangeColor,
                      backgroundColor: Colors.white,
                      shape: const StadiumBorder(
                        side: BorderSide(
                          color: AppColors.grey400Color,
                          width: 1.5,
                        ),
                      ),
                      onSelected: (bool value) {
                        for (int i = 0;
                            i < interestsScreenController.categoryList.length;
                            i++) {
                          for (int j = 0;
                              j <
                                  interestsScreenController
                                      .categoryList[i].options.length;
                              j++) {
                            if (interestsScreenController
                                    .categoryList[i].options[j].isSelected ==
                                true) {
                              log("isSelected value:: ${interestsScreenController.categoryList[i].options[j].isSelected}");
                              interestsScreenController.isSelectedValue++;
                            }
                          }
                        }
                        if (interestsScreenController.isSelectedValue < 8) {
                          interestsScreenController
                                  .categoryList[i].options[index].isSelected ==
                              true;
                        } else {
                          log("isSelectedValue 8");
                        }
                        // for (int i = 0;
                        //     i <
                        //         interestsScreenController
                        //             .categoryList[i].options.length;
                        //     i++) {}
                        // setState(() {
                        // interestsScreenController.isLoading(true);
                        // selectedVal = (value ? index : null)!;
                        // interestsScreenController.isLoading(false);

                        // });
                      },
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 5,
          color: AppColors.grey300Color,
        );
      },
    );
  }
}

class SkipAndNextButtonModule extends StatelessWidget {
  SkipAndNextButtonModule({super.key});
  final interestsScreenController = Get.find<InterestsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          // flex: 5,
          child: ButtonCustom(
            text: AppMessages.skip,
            textFontFamily: FontFamilyText.sFProDisplayBold,
            textsize: 15,
            backgroundColor: AppColors.darkOrangeColor,
            textColor: AppColors.whiteColor2,
            onPressed: () {
              // Get.to(
              //   () => InterestsScreen(),
              // );
            },
          ),
        ),
        const SizedBox(width: 30),
        Text(
          "0/8 Selected",
          style: TextStyleConfig.textStyle(
              fontFamily: FontFamilyText.sFProDisplayRegular,
              textColor: AppColors.grey500Color,
              fontSize: 14.sp),
        ),
        const SizedBox(width: 30),
        Expanded(
          // flex: 5,
          child: ButtonCustom(
            text: AppMessages.next,
            textFontFamily: FontFamilyText.sFProDisplayBold,
            textsize: 15,
            backgroundColor: AppColors.darkOrangeColor,
            textColor: AppColors.whiteColor2,
            onPressed: () async {
              log("message");
              await interestsScreenController.saveInterestsFunction(
                  interestsScreenController.categoryList);

              // Get.to(
              //   () => InterestsScreen(),
              // );
            },
          ),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 25, vertical: 10);
  }
}
