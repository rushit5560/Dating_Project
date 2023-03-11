
import 'package:dater/comman_modules/custom_appbar.dart';
import 'package:dater/comman_modules/custom_button.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/font_family.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/controller/gender_select_screen_controller.dart';
import 'package:dater/screens/authantication_screen/gender_select_screen/gender_select_screen_widgets.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class GenderSelectScreen extends StatelessWidget {
  GenderSelectScreen({super.key});
  final genderSelectScreenController = Get.put(GenderSelectScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(
        text: "What's your gender !",
        backGroundColor: Colors.transparent,
        iconColor: AppColors.darkOrangeColor,
        textFontFamily: FontFamilyText.sFProDisplayHeavy,
      ),
      bottomNavigationBar: ButtonCustom(
        text: "Next",
        textFontFamily: FontFamilyText.sFProDisplayBold,
        textsize: 15,
        backgroundColor: AppColors.darkOrangeColor,
        textColor: AppColors.whiteColor2,
        onPressed: () {
          Get.to(() => GenderSelectScreen());
        },
      ).commonSymmetricPadding(horizontal: 20, vertical: 10),
      body: Column(
        children: [
          SizedBox(height: 2.h),
          RadioButtonModule(),
          SizedBox(height: 6.h),
          Align(
            alignment: Alignment.centerLeft,
            child: ButtonCustom(
              text: AppMessages.genderNotes,
              onPressed: () {},
              size: const Size(50, 0),
              fontWeight: FontWeight.bold,
              textsize: 15,
              textFontFamily: FontFamilyText.sFProDisplayHeavy,
              textColor: AppColors.whiteColor2,
              backgroundColor: AppColors.greyColor,
            ),
          ),
          SizedBox(height: 3.h),
          GenderNotesModule()
        ],
      ).commonSymmetricPadding(horizontal: 25, vertical: 10),
    );
  }
}
