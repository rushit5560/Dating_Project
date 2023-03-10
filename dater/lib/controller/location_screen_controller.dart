import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController searchTextFieldController = TextEditingController();
}