import 'package:dater/comman_modules/custom_button.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/controller/my_number_inner_screen_controller.dart';
import 'package:dater/screens/verify_code/verify_code.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../comman_modules/custom_appbar.dart';
import '../../../constants/messages.dart';
import 'my_number_inner_screen_widgets.dart';

class MyNumberInnerScreen extends StatelessWidget {
  MyNumberInnerScreen({Key? key}) : super(key: key);
  final myNumberInnerScreenController =
      Get.put(MyNumberInnerScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBarModule(text: AppMessages.myNumberIs),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            TextFormFiledModule(),
            SizedBox(height: 4.h),
            const TextCustomModule(),
            SizedBox(height: 7.h),
            ButtonCustom(
              size: const Size(double.infinity, 50),
              backgroundColor: AppColors.lightOrangeColor,
              shadowColor: Colors.blueGrey,
              text: AppMessages.continueButton,
              textColor: AppColors.whiteColor2,
              fontWeight: FontWeight.bold,
              textsize: 14.sp,
              onPressed: () {
                Get.to(
                  () => VerifyCodeScreen(),
                );
              },
            ),
          ],
        ).commonSymmetricPadding(horizontal: 15),
      ),
    );
  }
}
