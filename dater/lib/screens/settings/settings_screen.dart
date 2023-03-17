import 'package:dater/constants/colors.dart';
import 'package:dater/screens/settings/settings_screen_widgets.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../common_modules/custom_appbar.dart';
import '../../constants/messages.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.whiteColor2,
      appBar: commonAppBarModule(text: AppMessages.settings),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 4.h),
              ReferralNumberModule(),
              SizedBox(height: 4.h),
              VerifyAccountModule(),
              SizedBox(height: 2.h),
              PersonalInfoModule(),
              SizedBox(height: 3.h),
              LocationModule(),
              SizedBox(height:3.h),
              ShowMeModule(),
              SizedBox(height: 3.h),
              CookiePolicyModule(),
              SizedBox(height: 3.5.h),
              TermsOfYouUseModule(),
              SizedBox(height: 3.5.h),
              PrivacyPolicyModule(),
              SizedBox(height: 3.5.h),
              BothButtonModule(),
              SizedBox(height: 4.h),
            ],
          ).commonSymmetricPadding(horizontal: 30),
        ),
      ),
    );
  }
}
