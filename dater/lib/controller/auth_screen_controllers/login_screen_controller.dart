import 'package:get/get.dart';

import '../../utils/preferences/signup_preference.dart';

class LoginInScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isUserFirstTime = true.obs;
  SignUpPreference signUpPreference = SignUpPreference();




  Future<void> getUserFirstTimeOrNot() async {
    isLoading(true);
    isUserFirstTime.value = await signUpPreference.getBoolFromPrefs(key: SignUpPreference.isUserFirstTimeKey);
    // isUserFirstTime.value = false;
    isLoading(false);
  }

  @override
  void onInit() {
    getUserFirstTimeOrNot();
    super.onInit();
  }

}