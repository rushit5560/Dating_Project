import 'dart:developer';
import 'package:dater/constants/messages.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/colors.dart';
import '../../../constants/font_family.dart';
import '../../../controller/auth_screen_controllers/goal_select_screen_controller.dart';
import '../../../utils/style.dart';

class GoalRadioButtonModule extends StatelessWidget {
  GoalRadioButtonModule({super.key});
  final goalSelectScreenController = Get.find<GoalSelectScreenController>();

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
                AppMessages.goal,
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
              itemCount: goalSelectScreenController.goleDataList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        goalSelectScreenController.goleDataList[index].name,
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
                        value:
                            goalSelectScreenController.goleDataList[index].name,
                        groupValue:
                            goalSelectScreenController.selectedvalue.value,
                        onChanged: (val) {
                          log("val : $val");
                          goalSelectScreenController.isLoading(true);
                          goalSelectScreenController.selectedvalue.value = val!;
                          goalSelectScreenController.isLoading(false);
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

class GoalselectNotesModule extends StatelessWidget {
  const GoalselectNotesModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              _singleItemModule(
                number: AppMessages.goalselectednumber,
                text: AppMessages.goalScreenNoteText,
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
