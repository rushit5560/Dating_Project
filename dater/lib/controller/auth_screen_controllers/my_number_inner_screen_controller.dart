import 'dart:convert';
import 'dart:developer';
import 'package:dater/constants/messages.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:dater/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/authentication_model/login_screen_model/login_model.dart';
import '../../screens/authentication_screen/verify_code/verify_code.dart';

class MyNumberInnerScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();

  List<String> countryCodeList = [];
  RxString selectCountryCodeValue = "BD 880".obs;

  String finalMobileNumber = "";

  Future<void> getCountryCodesFunction() async {
    isLoading(true);
    String url = ApiUrl.getCountryCodeApi;
    log('Country Code List Api Url :$url');

    try {

      http.Response response = await http.get(Uri.parse(url));
      // log('response : ${response.body}');

      if(response.statusCode == 200) {
        String mainResponse = response.body.toString();
        // Json Response convert into List
        List<String> singleObjectList = mainResponse.substring(1, mainResponse.length - 1).split(", ");

        // Make single object for all positions in list
        for(var item in singleObjectList) {
          List<String> tempSingleItem = item.split(": ");
          String fString = tempSingleItem[0] == "" ? "" : tempSingleItem[0].substring(1, tempSingleItem[0].length -1);
          String lString = tempSingleItem[1] == "" ? "" : tempSingleItem[1].substring(1, tempSingleItem[1].length -1);
          countryCodeList.add("$fString $lString");
        }
        log('countryCodeList : ${countryCodeList.length}');


      } else {
        log('Status code : ${response.statusCode}');
      }


    } catch(e) {
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
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['phone'] = phoneNumberController.text;

      var response = await request.send();

      response.stream
          .transform(utf8.decoder)
          .listen((value) async {
            log('value : $value');

            LoginModel loginModel = LoginModel.fromJson(json.decode(value));


            if(loginModel.statusCode == 200) {
              // Fluttertoast.showToast(msg: loginModel.msg);
              String countryCode = selectCountryCodeValue.value.split(" ")[1];
              Get.to(()=> VerifyCodeScreen(),
              arguments: [
                countryCode,
                phoneNumberController.text.trim(),
              ],
              );
            } else if(loginModel.statusCode == 400) {
              Fluttertoast.showToast(msg: loginModel.msg);
            } else {
              Fluttertoast.showToast(msg: AppMessages.apiCallWrong);
            }
      });

    } catch(e) {
     log('loginUsingMobileNumberFunction Error :e');
      rethrow;
    }

    isLoading(false);
  }

  // Continue Button Function
  Future<void> onContinueButtonClickFunction() async {
    if(formKey.currentState!.validate()) {
      // String finalMobileNumber = "";

       List<String> countryNameAndCodeList =selectCountryCodeValue.value.split(" ");
       String countryCode = countryNameAndCodeList[1].replaceAll("+", "").replaceAll("-", "");
       log('countryCode :$countryCode');

       log('Mobile Number :${phoneNumberController.text.trim()}');

      finalMobileNumber = "$countryCode${phoneNumberController.text.trim()}";
      log('finalMobileNumber : $finalMobileNumber');
      await loginUsingMobileNumberFunction();


    }
  }



  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  initMethod() async {
    await getCountryCodesFunction();
  }

}
