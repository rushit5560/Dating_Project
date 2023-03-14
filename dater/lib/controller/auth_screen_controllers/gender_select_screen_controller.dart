import 'dart:convert';
import 'dart:developer';

import 'package:dater/constants/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/authentication_model/gender_select_screen_model/get_gender_model.dart';
import '../../screens/authentication_screen/gender_target_screen/gender_target_screen.dart';
import '../../utils/preferences/signup_preference.dart';

class GenderSelectScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List<Msg> genderList = [];
  Msg selectedGenderValue = Msg(id: "1", name: "Female");
  String selectedGenderValueId = "";

  SignUpPreference signUpPreference = SignUpPreference();

  Future<void> geGenderFunction() async {
    isLoading(true);
    String url = ApiUrl.getGenderApi;
    log("geGenderFunction get url: $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      GenderModel getGenderModel = GenderModel.fromJson(json.decode(response.body));

      if (response.statusCode == 200) {

        // Set api list in local list
        genderList = getGenderModel.msg;
        // Set Initial Value from api in local variable
        genderList.isNotEmpty ? selectedGenderValue = genderList[0] : null;

        log("selectedGenderValue: $selectedGenderValue");
        // log("selectedGenderValueId: $selectedGenderValueId");
      } else {
        log("geGenderFunction Error");
      }
    } catch (e) {
      log("geGenderFunction Error $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }


  void radioButtonOnChangeFunction(Msg selectedValue) {
    isLoading(true);
    selectedGenderValue = selectedValue;
    isLoading(false);
  }

  Future<void> nextButtonFunction() async {
    await signUpPreference.setStringValueInPrefs(
      key: SignUpPreference.userGenderKey,
      value: selectedGenderValue.id,
    );
    Get.to(() => GenderTargetScreen());
  }

  @override
  void onInit() {
    geGenderFunction();
    super.onInit();
  }
}
