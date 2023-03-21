
import 'dart:async';

import 'package:get/get.dart';
class ProfileScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxDouble progressValue = 0.0.obs;
  startTimer() async {
    Timer(
      const Duration(milliseconds: 1500),
          () async {
        // ignore: unrelated_type_equality_checks
        if(progressValue == 100) {
        }
      },
    );
  }

  @override
  void onInit() {
    startTimer();

    super.onInit();
  }
}