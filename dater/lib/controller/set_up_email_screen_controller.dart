import 'package:dater/screens/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/authentication_screen/location_screen/location_screen.dart';
import '../../utils/preferences/signup_preference.dart';

class SetUpEmailScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailTextFieldController = TextEditingController();

  SignUpPreference signUpPreference = SignUpPreference();



  // Continue button click function
  Future<void> continueButtonOnClickFunction() async {
    if(formKey.currentState!.validate()) {
      await signUpPreference.setStringValueInPrefs(
        key: SignUpPreference.signUpEmailKey,
        value: emailTextFieldController.text.toLowerCase().trim(),
      );
      Get.to(() => SettingsScreen());
    }

  }
}