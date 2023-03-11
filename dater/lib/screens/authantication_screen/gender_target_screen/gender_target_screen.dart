import 'package:dater/constants/messages.dart';
import 'package:dater/controller/auth_screen_controllers/gender_target_screen_controller.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../comman_modules/custom_appbar.dart';
import '../../../comman_modules/custom_button.dart';
import '../../../constants/colors.dart';
import '../../../constants/font_family.dart';
import '../gender_select_screen/gender_select_screen_widgets.dart';
class GenderTargetScreen extends StatelessWidget {
  GenderTargetScreen({Key? key}) : super(key: key);
  final genderTargetScreenController = Get.put(GenderTargetScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(
        text: AppMessages.targetGenderNotes,
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
          //Get.to(() => GenderSelectScreen());
        },
      ).commonSymmetricPadding(horizontal: 20, vertical: 10),
      body: Column(
        children: [
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
          SizedBox(height: 2.h,),
          const Text('1- You can always change,your target gender later '),
        ],
      ).commonSymmetricPadding(horizontal: 25, vertical: 10),
    );
  }
}
