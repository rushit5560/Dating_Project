import 'package:dater/utils/preferences/signup_preference.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../screens/authentication_screen/gender_select_screen/gender_select_screen.dart';

class DobSelectScreenController extends GetxController {

  RxString dobString = "YYYY".obs;
  DateTime tempDobString = DateTime.now();

  SignUpPreference signUpPreference = SignUpPreference();

  setDobInStringFunction() {
    dobString.value = DateFormat("yyyy").format(tempDobString);
    Get.back();
  }


  Future<void> nextButtonFunction() async {
    if(dobString.value == "YYYY") {
      Fluttertoast.showToast(msg: "Please select DOB Year");
    } else {
      await signUpPreference.setStringValueInPrefs(key: SignUpPreference.userDobKey, value: dobString.value);
      Get.to(() => GenderSelectScreen());
    }
  }

}