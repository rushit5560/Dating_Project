import 'dart:developer';
import 'package:dater/constants/messages.dart';
import 'package:dater/controller/auth_screen_controllers/gender_target_screen_controller.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/colors.dart';
import '../../../constants/font_family.dart';
import '../../../utils/style.dart';

class RadioButtonModule extends StatelessWidget {
  RadioButtonModule({super.key});
  final genderTargetScreenController = Get.find<GenderTargetScreenController>();
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
                AppMessages.gender,
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
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        genderTargetScreenController.msgData[index].name,
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
                        value: genderTargetScreenController.msgData[index].name,
                        groupValue:
                            genderTargetScreenController.selectedvalue.value,
                        onChanged: (val) {
                          log("val : $val");
                          genderTargetScreenController.isLoading(true);
                          genderTargetScreenController.selectedvalue.value =
                              val!;
                          genderTargetScreenController.isLoading(false);
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
