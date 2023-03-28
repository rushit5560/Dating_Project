import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_modules/custom_appbar.dart';
import '../../constants/colors.dart';
import '../../constants/messages.dart';
import '../../controller/cookie_policy_screen_controller.dart';

class CookiePolicyScreen extends StatelessWidget {
   CookiePolicyScreen({Key? key}) : super(key: key);
final cookiePolicyScreenController = Get.put(CookiePolicyScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor2,
      appBar: commonAppBarModule(text: AppMessages.cookiePolicy),
    );
  }
}
