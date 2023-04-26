import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../screens/authentication_screen/username_screen/username_screen.dart';
import '../../utils/preferences/signup_preference.dart';

class SignUpEmailScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailTextFieldController = TextEditingController();

  SignUpPreference signUpPreference = SignUpPreference();

  // Continue button click function
  Future<void> continueButtonClickFunction() async {
    if (formKey.currentState!.validate()) {
      await signUpPreference.setStringValueInPrefs(
        key: SignUpPreference.signUpEmailKey,
        value: emailTextFieldController.text.toLowerCase().trim(),
      );
      Get.to(() => UserNameScreen());
    }
  }
}
