import 'dart:developer';

import 'package:dater/constants/colors.dart';
import 'package:dater/constants/font_family.dart';
import 'package:dater/controller/auth_screen_controllers/gender_select_screen_controller.dart';
import 'package:dater/utils/extensions.dart';
import 'package:dater/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RadioButtonModule extends StatelessWidget {
  RadioButtonModule({super.key});
  final genderSelectScreenController = Get.find<GenderSelectScreenController>();

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
            height: 300,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: genderSelectScreenController.msgData.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        genderSelectScreenController.msgData[index].name,
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
                        value: genderSelectScreenController.msgData[index].name,
                        groupValue:
                            genderSelectScreenController.selectedvalue.value,
                        onChanged: (val) {
                          log("val : $val");
                          genderSelectScreenController.isLoading(true);
                          genderSelectScreenController.selectedvalue.value =
                              val!;
                          genderSelectScreenController.isLoading(false);
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

class GenderNotesModule extends StatelessWidget {
  const GenderNotesModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 15,
          child: Container(),
        ),
        Expanded(
          flex: 85,
          child: Column(
            children: [
              _singleItemModule(
                number: '1- ',
                text: 'You can alwaysb change, your gender later',
              ),
              _singleItemModule(
                number: '2- ',
                text: 'Try to choose which, best describes you ',
              ),
              _singleItemModule(
                number: '3- ',
                text: 'You can add more about your gender later on',
              ),
              _singleItemModule(
                number: '4- ',
                text:
                    'You will only be shown to people looking to date your gender',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _singleItemModule({required String number, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: TextStyle(
            fontFamily: FontFamilyText.sFProDisplayRegular,
            fontSize: 18,
            color: AppColors.grey500Color,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: FontFamilyText.sFProDisplayRegular,
              fontSize: 18,
              color: AppColors.grey500Color,
            ),
          ),
        ),
      ],
    ).commonSymmetricPadding(vertical: 6);
  }
}
