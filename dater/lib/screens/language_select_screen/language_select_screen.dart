import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/language_select_screen_controller.dart';

class LanguageSelectScreen extends StatelessWidget {
  LanguageSelectScreen({Key? key}) : super(key: key);
  final languageSelectScreenController = Get.put(LanguageSelectScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
