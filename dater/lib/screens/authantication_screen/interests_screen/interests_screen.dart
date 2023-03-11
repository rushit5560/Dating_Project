import 'package:dater/comman_modules/custom_loader.dart';
import 'package:dater/constants/colors.dart';
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Obx(
          () => interestsScreen1Controller.isLoading.value
              ? const CustomLoader()
              : Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    const InterestsWidgetModule(),
                    // SizedBox(height: 3.h,),
                    // SportsWidgetsModule(),
                  ],
                ),
        ),
      ),
    );
  }
}
