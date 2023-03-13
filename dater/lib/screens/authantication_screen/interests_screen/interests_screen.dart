import 'package:dater/comman_modules/custom_appbar.dart';
import 'package:dater/comman_modules/custom_loader.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/font_family.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/controller/auth_screen_controllers/interests%20_screen_controller.dart';
import 'package:dater/screens/authantication_screen/interests_screen/interests_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class InterestsScreen extends StatelessWidget {
  InterestsScreen({Key? key}) : super(key: key);
  final interestsScreen1Controller = Get.put(InterestsScreen1Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey200Color,
      appBar: commonAppBarModule(
        text: AppMessages.whatsyourinterests,
        backGroundColor: Colors.transparent,
        iconColor: AppColors.darkOrangeColor,
        textFontFamily: FontFamilyText.sFProDisplayHeavy,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Obx(
          () => interestsScreen1Controller.isLoading.value
              ? const CustomLoader()
              : SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      InterestsWidgetModule(),
                      // SizedBox(height: 3.h,),
                      // SportsWidgetsModule(),
                    ],
                  ),
                ),
        ),
      ),
      bottomNavigationBar: SkipAndNextButtonModule(),
    );
  }
}
