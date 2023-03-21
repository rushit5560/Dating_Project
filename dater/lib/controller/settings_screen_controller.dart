import 'package:dater/utils/preferences/signup_preference.dart';
import 'package:dater/utils/preferences/user_preference.dart';
import 'package:get/get.dart';

import '../screens/authentication_screen/login_screen/login_screen.dart';

class SettingsScreenController extends GetxController{
  RxBool isLoading = false.obs;

  UserPreference userPreference = UserPreference();
  SignUpPreference signUpPreference = SignUpPreference();


  logOutButtonFunction() async {
    await userPreference.clearUserAllDataFromPrefs();
    await signUpPreference.clearSignUpDataFromPrefs();
    Get.offAll(() => LoginInScreen());
  }
}