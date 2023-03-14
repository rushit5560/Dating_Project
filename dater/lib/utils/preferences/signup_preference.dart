

import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SignUpPreference {
  static String signUpEmailKey = "signUpEmailKey";
  static String signUpLocationKey = "signUpLocationKey";
  static String signUpFNameKey = "signUpFNameKey";

  setStringValueInPrefs({required String key, required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    log('prefs value :${prefs.getString(key)}');
  }
}