import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_modules/custom_appbar.dart';
import '../../constants/colors.dart';
import '../../constants/messages.dart';
import '../../controller/terms_of_you_use_screen_controller.dart';

class TermsOfYouUseScreen extends StatelessWidget {
  TermsOfYouUseScreen({Key? key}) : super(key: key);
  final termsOfYouUseScreenController = Get.put(TermsOfYouUseScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor2,
      appBar: commonAppBarModule(text: AppMessages.termsOfYouUse),
    );
  }
}
