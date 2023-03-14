import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:dater/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCodeScreenController extends GetxController {
  String countryCode = Get.arguments[0] ?? "";
  String mobileNumber = Get.arguments[1] ?? "";

  RxBool isLoading = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstDigitController = TextEditingController();
  TextEditingController secondDigitController = TextEditingController();
  TextEditingController thirdDigitController = TextEditingController();
  TextEditingController fourthDigitController = TextEditingController();
  TextEditingController controller = TextEditingController();
  var userInput = "";
  var userOutput = "";

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

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['phone'] = mobileNumber;
      request.fields['verify_token'] = mobileNumber;


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
