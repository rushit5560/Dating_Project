import 'package:dater/comman_modules/custom_appbar.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/font_family.dart';
import 'package:dater/controller/gender_screen_controller.dart';
import 'package:dater/utils/extensions.dart';
import 'package:dater/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class GenderSelectScreen extends StatelessWidget {
  GenderSelectScreen({super.key});
  final genderScreenController = Get.put(GenderScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(
        text: "What's your gender !",
        backGroundColor: Colors.transparent,
        iconColor: AppColors.darkOrangeColor,
        textFontFamily: FontFamilyText.sFProDisplayHeavy,
      ),
      body: Column(
        children: [
          SizedBox(height: 2.h),
          Container(
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
                            Text(genderScreenController.gender[index]),
                            Obx(() => Radio(
                                value: genderScreenController.selectedval.value,
                                groupValue: genderScreenController.selectedval,
                                onChanged: (val) {
                                
                                  genderScreenController.selectedval.value;
                                })),
                          ],
                        );
                      }),
                ),
              ],
            ).commonSymmetricPadding(horizontal: 25, vertical: 10),
          ),
        ],
      ).commonSymmetricPadding(horizontal: 25, vertical: 10),
    );
  }
}
