import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllChatListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController searchTextFieldController = TextEditingController();
  RxBool rightSelected = true.obs;
  RxBool activeSelected = true.obs;
  RxBool panddingMess = true.obs;

}
