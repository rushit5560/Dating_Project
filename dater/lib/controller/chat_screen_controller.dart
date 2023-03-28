import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatScreenController extends GetxController{
  var isEmojiVisible = false.obs;
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  void onInit() {
    super.onInit();
    focusNode.addListener(() {
      if(focusNode.hasFocus){
        isEmojiVisible.value = false;
      }
    });
  }
  @override
  void onClose() {
    super.onClose();
    textEditingController.selection;
  }
}