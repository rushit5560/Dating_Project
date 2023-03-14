import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {

  static String userMobileNoKey = "userMobileNoKey";
  static String userTokenKey = "userTokenKey"; // This is temp token
  static String userVerifyTokenKey = "userVerifyTokenKey"; // This is main token




  Future<void> setStringValueInPrefs({required String key, required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    log('prefs value :${prefs.getString(key)}');
  }

  Future<String> getStringFromPrefs({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(key) ?? "";
    return value;
  }

}