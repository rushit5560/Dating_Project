import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../constants/api_url.dart';
import '../../constants/enums.dart';
import '../../constants/messages.dart';
import '../../model/authentication_model/country_code_list_model/country_code_list.dart';
import '../../model/authentication_model/country_code_list_model/country_code_list_model.dart';
import '../../model/authentication_model/login_screen_model/login_model.dart';
import '../../screens/authentication_screen/verify_code_screen/verify_code_screen.dart';
import '../../utils/preferences/user_preference.dart';

class PersonalInfoScreenController extends GetxController{
  //AuthAs authAs = Get.arguments[0];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  //List<CountryData> searchCountryCodeList = [];
  //List<CountryData> countryCodeList = [];
 // CountryData selectCountryCodeValue = CountryData();

 // String finalMobileNumber = "";
  //UserPreference userPreference = UserPreference();

  // When select on country
/*  Future<void> getCountryCodesFunction() async {
    isLoading(true);
    // String url = ApiUrl.getCountryCodeApi;
    // log('Country Code List Api Url :$url');

    try {
      CountryListModel countryListModel = CountryListModel.fromJson(json.decode(CountryModel.countryList));
      countryCodeList.addAll(countryListModel.countryList);
      searchCountryCodeList = countryCodeList;
      selectCountryCodeValue = countryCodeList[0];
      countryCodeController.text = "${selectCountryCodeValue.emoji} "
          "${selectCountryCodeValue.dialCode} ${selectCountryCodeValue.code}";
    } catch (e) {
      log('getCountryCodesFunction Error :$e');
      rethrow;
    }

    isLoading(false);
  }

  Future<void> loginUsingMobileNumberFunction() async {
    isLoading(true);
    String url = ApiUrl.loginApi;
    log('loginUsingMobileNumberFunction Api Url : $url');

    try {
      // String countryCode = selectCountryCodeValue.split(" ")[1];
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // request.fields['phone'] = "$countryCode${phoneNumberController.text}";
      request.fields['phone'] = "${selectCountryCodeValue.dialCode}${phoneNumberController.text}";

      log('Fields : ${request.fields}');

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        log('value : $value');

        LoginModel loginModel = LoginModel.fromJson(json.decode(value));

        if (loginModel.statusCode == 200) {
          // Set Mobile number & token in prefs
          await userPreference.setStringValueInPrefs(
            key: UserPreference.userMobileNoKey,
            value: phoneNumberController.text,
          );
          await userPreference.setStringValueInPrefs(
            key: UserPreference.userTokenKey,
            value: loginModel.verifyToken,
          );

          Get.to(
                () => VerifyCodeScreen(),
            arguments: [
              selectCountryCodeValue.dialCode,
              phoneNumberController.text.trim(),
              authAs,
            ],
          );
        } else if (loginModel.statusCode == 400) {
          Fluttertoast.showToast(msg: loginModel.msg);
        } else {
          Fluttertoast.showToast(msg: AppMessages.apiCallWrong);
        }
      });
    } catch (e) {
      log('loginUsingMobileNumberFunction Error :e');
      rethrow;
    }

    isLoading(false);
  }

  // Continue Button Function
  Future<void> onContinueButtonClickFunction() async {
    if (formKey.currentState!.validate()) {
      // String finalMobileNumber = "";

      // List<String> countryNameAndCodeList = selectCountryCodeValue.value.split(" ");
      // String countryCode =
      //     countryNameAndCodeList[1].replaceAll("+", "").replaceAll("-", "");
      // log('countryCode :$countryCode');

      log('Mobile Number :${phoneNumberController.text.trim()}');

      finalMobileNumber = "${selectCountryCodeValue.dialCode}${phoneNumberController.text.trim()}";
      log('finalMobileNumber : $finalMobileNumber');

      if (authAs == AuthAs.register) {
        await loginUsingMobileNumberFunction();
      } else if (authAs == AuthAs.login) {
        await loginUsingMobileNumberFunction();
      }
    }
  }

  onCountrySelectFunction(CountryData singleItem) {
    isLoading(true);
    countryCodeController.text =
    "${singleItem.emoji} ${singleItem.dialCode} ${singleItem.code}";
    selectCountryCodeValue = singleItem;
    isLoading(false);
    Get.back();
    searchCountryCodeList = countryCodeList;
    searchController.clear();
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  initMethod() async {
    phoneNumberController.text = await userPreference.getStringFromPrefs(key: UserPreference.userMobileNoKey);
    await getCountryCodesFunction();
  }*/
}