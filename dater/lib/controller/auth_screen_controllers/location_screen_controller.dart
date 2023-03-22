import 'package:dater/screens/location_permission_sreen/location_permission%20screen.dart';
import 'package:dater/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController searchTextFieldController = TextEditingController();
 

  @override
  void onInit() {

    super.onInit();
  }
}
