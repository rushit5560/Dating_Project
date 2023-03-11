import 'dart:developer';
import 'package:dater/constants/messages.dart';
import 'package:dater/controller/auth_screen_controllers/gender_target_screen_controller.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/colors.dart';
import '../../../constants/font_family.dart';
import '../../../utils/style.dart';

class GenderTargetRadioButtonModule extends StatelessWidget {
  GenderTargetRadioButtonModule({super.key});
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

class GenderTargetNotesModule extends StatelessWidget {
  const GenderTargetNotesModule({Key? key}) : super(key: key);

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
                number: AppMessages.targetgendernumber1,
                text: AppMessages.YouCanAlwaysChangeYourTargetGenderLater,
              ),
              _singleItemModule(
                number: AppMessages.targetgendernumber2,
                text: AppMessages.Youwillonlyseepeopleyouaretargeting,
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
