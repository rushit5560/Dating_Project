import 'dart:async';

import 'package:dater/screens/authantication_screen/login_screen/login_screen.dart';
import 'package:get/get.dart';

class SplashScreencontroller extends GetxController {
  startTimer() async {
    Timer(
      const Duration(milliseconds: 3500),
      () {
        Get.off(
          () {
            return LoginInScreen();
          },
        );
      },
    );
  }

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }
}
