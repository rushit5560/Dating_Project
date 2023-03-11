import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyNumberInnerScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();
  RxString dropdownvalue = 'In +91'.obs;
  var country = [
    'In +91',
    'Pk +92',
    'Pu +02',
  ];
}
