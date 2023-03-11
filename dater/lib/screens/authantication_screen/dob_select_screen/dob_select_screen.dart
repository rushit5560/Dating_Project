import 'package:dater/constants/colors.dart';
import 'package:dater/constants/font_family.dart';
import 'package:dater/screens/gender_select_screen/gender_select_screen.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../comman_modules/custom_appbar.dart';
import '../../../comman_modules/custom_button.dart';
import '../../../controller/auth_screen_controllers/dob_select_screen_controller.dart';
import 'dob_select_screen_widgets.dart';

class DobSelectScreen extends StatelessWidget {
  DobSelectScreen({Key? key}) : super(key: key);
  final dobSelectScreenController = Get.put(DobSelectScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightOrangeColor,
      appBar: commonAppBarModule(
        text: "What's your age !",
        backGroundColor: Colors.transparent,
        iconColor: AppColors.blackColor,
        textFontFamily: FontFamilyText.sFProDisplayHeavy,
      ),
      bottomNavigationBar: ButtonCustom(
        text: "Next",
        textFontFamily: FontFamilyText.sFProDisplayBold,
        textsize: 15,
        onPressed: () {
          Get.to(() => GenderSelectScreen());
        },
      ).commonSymmetricPadding(horizontal: 20, vertical: 10),
      body: Column(
        children: [
          DobSelectModule(),
          const SizedBox(height: 75),
          Align(
            alignment: Alignment.centerLeft,
            child: ButtonCustom(
              text: "Age notes",
              onPressed: () {},
              size: const Size(50, 0),
              fontWeight: FontWeight.bold,
              textsize: 15,
              textFontFamily: FontFamilyText.sFProDisplayHeavy,
            ),
          ),
          const SizedBox(height: 15),
          AgeNotesModule(),
          Expanded(child: Container()),
        ],
      ).commonSymmetricPadding(horizontal: 25, vertical: 20),
    );
  }
}
