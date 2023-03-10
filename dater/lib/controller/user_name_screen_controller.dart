import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserNameScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameTextFieldController = TextEditingController();
}