import 'dart:convert';
import 'dart:developer';
import 'package:dater/constants/messages.dart';
import 'package:dater/screens/index_screen/index_screen.dart';
import 'package:dater/utils/preferences/user_preference.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:dater/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/enums.dart';
import '../../model/authentication_model/verify_code_screen_model/account_active_model.dart';
import '../../model/authentication_model/verify_code_screen_model/resend_code_model.dart';
import '../../screens/authentication_screen/sign_up_email_screen/sign_up_email_screen.dart';
import '../../utils/preferences/signup_preference.dart';

class VerifyCodeScreenController extends GetxController {
  String countryCode = Get.arguments[0] ?? "";
  String mobileNumber = Get.arguments[1] ?? "";
  AuthAs authAs = Get.arguments[2];
  ComingFrom comingFrom = Get.arguments[3] ?? ComingFrom.registerScreen;

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
  SignUpPreference signUpPreference = SignUpPreference();

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
  
  // Active Account
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

          if(accountActiveModel.msg.toLowerCase() == "Account already activated".toLowerCase()) {

            await userPreference.setStringValueInPrefs(
              key: UserPreference.userVerifyTokenKey,
              value: accountActiveModel.token,
            );
            await userPreference.setBoolValueInPrefs(
              key: UserPreference.isUserCreatedKey,
              value: true,
            );
            await signUpPreference.setBoolValueInPrefs(
              key: SignUpPreference.isUserFirstTimeKey,
              value: false,
            );
            await userPreference.setBoolValueInPrefs(
              key: UserPreference.isUserLoggedInKey,
              value: true,
            );

            if(comingFrom == ComingFrom.changeNumberScreen) {
              Get.back();
              Get.back();
            } else {
              Get.offAll(() => IndexScreen());
            }
          }
          else {

            await userPreference.setStringValueInPrefs(
              key: UserPreference.userVerifyTokenKey,
              value: accountActiveModel.token,
            );
            if(authAs == AuthAs.register) {
              Get.off(() => SignUpEmailScreen());
            } else if(authAs == AuthAs.login) {
              await userPreference.setBoolValueInPrefs(
                key: UserPreference.isUserCreatedKey,
                value: true,
              );
              await userPreference.setBoolValueInPrefs(
                key: UserPreference.isUserLoggedInKey,
                value: true,
              );
              if(comingFrom == ComingFrom.changeNumberScreen) {
                Get.back();
                Get.back();
              } else {
                Get.offAll(() => IndexScreen());
              }
            }
          }

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

  // Resend Code
  Future<void> resendCodeFunction() async {
    isLoading(true);
    String url = ApiUrl.resendCodeApi;
    log('Resend Code Api Url :$url');
    
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['phone'] = "$countryCode$mobileNumber";

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        log('Resend code response :$value');

        ResendCodeModel resendCodeModel = ResendCodeModel.fromJson(json.decode(value));

        if(resendCodeModel.statusCode == 200) {
          Fluttertoast.showToast(msg: resendCodeModel.msg);
          firstDigitController.clear();
          secondDigitController.clear();
          thirdDigitController.clear();
          fourthDigitController.clear();
          controller.clear();
        } else if(resendCodeModel.statusCode == 400) {
          Fluttertoast.showToast(msg: resendCodeModel.msg);
        } else {
          Fluttertoast.showToast(msg: AppMessages.apiCallWrong);
        }
      });

    } catch(e) {
      log('resendCodeFunction Error :$e');
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
