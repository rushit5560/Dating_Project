import 'package:dater/comman_modules/custom_button.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/screens/authantication_screen/sign_up_email_screen/sign_up_email_screen.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../comman_modules/custom_appbar.dart';
import '../../../constants/messages.dart';
import 'my_number_inner_screen_widgets.dart';

class MyNumberInnerScreen extends StatelessWidget {
  const MyNumberInnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBarModule(text: AppMessages.myNumberIs),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const TextFormFiledModule(),
            SizedBox(height: 4.h),
            const TextCustomModule(),
            SizedBox(height: 7.h),
            ButtonCustom(
              size: const Size(double.infinity, 50),
              backgroundColor: AppColors.lightOrangeColor,
              shadowColor: Colors.blueGrey,
              text: AppMessages.continueButton,
              textColor: AppColors.gray50Color,
              fontWeight: FontWeight.bold,
              textsize: 14.sp,
              onPressed: () {
                Get.to(() => const SignUpEmailScreen());
              },
            ),
          ],
        ).commonSymmetricPadding(horizontal: 15),
      ),
    );
  }
}
