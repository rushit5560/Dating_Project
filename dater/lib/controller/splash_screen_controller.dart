import 'dart:async';

import 'package:dater/constants/enums.dart';
import 'package:dater/screens/authentication_screen/login_screen/login_screen.dart';
import 'package:dater/screens/index_screen/index_screen_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../utils/preferences/user_preference.dart';

class SplashScreencontroller extends GetxController {
  AuthAs authAs = AuthAs.login;

  UserPreference userPreference = UserPreference();

  startTimer() async {
    Timer(
      const Duration(milliseconds: 1500),
      () async {
        bool isUserLoggedIn = await userPreference.getBoolFromPrefs(key: UserPreference.isUserLoggedInKey);
        if(isUserLoggedIn == true) {
          Get.offAll(()=> IndexScreen());
        } else {
          Get.off(() => LoginInScreen());
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
