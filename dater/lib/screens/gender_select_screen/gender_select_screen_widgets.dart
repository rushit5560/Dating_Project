import 'dart:developer';

import 'package:dater/constants/colors.dart';
import 'package:dater/constants/font_family.dart';
import 'package:dater/controller/gender_screen_controller.dart';
import 'package:dater/utils/extensions.dart';
import 'package:dater/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RadioButtonModule extends StatelessWidget {
  RadioButtonModule({super.key});
  final genderScreenController = Get.find<GenderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
        border: Border.all(
          color: AppColors.grey300Color,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Gender",
                style: TextStyleConfig.textStyle(
                  fontFamily: FontFamilyText.sFProDisplayBold,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: genderScreenController.gender.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        genderScreenController.gender[index],
                        style: TextStyleConfig.textStyle(
                          fontFamily: FontFamilyText.sFProDisplayRegular,
                          fontSize: 15.sp,
                          textColor: AppColors.grey600Color,
                        ),
                      ),
                    ),
                    Obx(
                      () => Radio(
                        activeColor: AppColors.darkOrangeColor,
                        value: genderScreenController.gender[index],
                        groupValue: genderScreenController.selectedvalue.value,
                        onChanged: (val) {
                          log("val : $val");
                          genderScreenController.isLoading(true);
                          genderScreenController.selectedvalue.value = val!;
                          genderScreenController.isLoading(false);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ).commonSymmetricPadding(horizontal: 25, vertical: 10),
    );
  }
}
