import 'dart:convert';
import 'dart:developer';
import 'package:dater/constants/messages.dart';
import 'package:dater/utils/preferences/user_preference.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:dater/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/enums.dart';
import '../../model/authentication_model/verify_code_screen_model/account_active_model.dart';
import '../../screens/authentication_screen/sign_up_email_screen/sign_up_email_screen.dart';

class VerifyCodeScreenController extends GetxController {
  String countryCode = Get.arguments[0] ?? "";
  String mobileNumber = Get.arguments[1] ?? "";
  AuthAs authAs = Get.arguments[2];

  RxBool isLoading = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstDigitController = TextEditingController();
  TextEditingController secondDigitController = TextEditingController();
  TextEditingController thirdDigitController = TextEditingController();
  TextEditingController fourthDigitController = TextEditingController();
  TextEditingController controller = TextEditingController();
  var userInput = "";
  var userOutput = "";

  UserPreference userPreference = UserPreference();

  final List<String> buttons = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "*",
    "0",
    "#",
  ];



  Future<void> activateAccountFunction() async {
    isLoading(true);
    String url = ApiUrl.accountActiveApi;
    log('activateAccountFunction Api Url : $url');


    String verifyToken = await userPreference.getStringFromPrefs(key: UserPreference.userTokenKey);

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['phone'] = "$countryCode$mobileNumber";
      request.fields['verify_token'] = verifyToken;

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        log('Active Value : $value');

        AccountActiveModel accountActiveModel = AccountActiveModel.fromJson(json.decode(value));

        if(accountActiveModel.statusCode == 200) {
          log('Msg : ${accountActiveModel.msg}');
          await userPreference.setStringValueInPrefs(
            key: UserPreference.userVerifyTokenKey,
            value: accountActiveModel.token,
          );
          Get.off(() => SignUpEmailScreen());
        } else if(accountActiveModel.statusCode == 400) {
          Fluttertoast.showToast(msg: accountActiveModel.msg);
        } else {
          Fluttertoast.showToast(msg: AppMessages.apiCallWrong);
        }
      });
    } catch(e) {
      log('activateAccountFunction Error :$e');
      rethrow;
    }
  }


  @override
  void onInit() {
    log('countryCode : $countryCode');
    log('mobileNumber : $mobileNumber');
    super.onInit();
  }
 
}
