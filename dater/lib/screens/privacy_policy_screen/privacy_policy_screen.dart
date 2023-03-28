import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_modules/custom_appbar.dart';
import '../../constants/colors.dart';
import '../../constants/messages.dart';
import '../../controller/privacy_policy_screen_controller.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({Key? key}) : super(key: key);
  final privacyPolicyScreenController = Get.put(PrivacyPolicyScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor2,
      appBar: commonAppBarModule(text: AppMessages.privacyPolicy),
    );
  }
}
