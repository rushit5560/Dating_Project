import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SignUpPreference {
  static String signUpEmailKey = "signUpEmailKey";
  static String signUpLocationKey = "signUpLocationKey";
  static String signUpFNameKey = "signUpFNameKey";
  static String userImage1Key = "userImage1Key";
  static String userImage2Key = "userImage2Key";
  static String userImage3Key = "userImage3Key";
  static String userDobKey = "userDobKey";
  static String userSexualityKey = "userSexualityKey";
  static String userGenderKey = "userGenderKey";
  static String targetGenderKey = "targetGenderKey";
  static String userGoalKey = "userGoalKey";
  static String userInterestKey = "userInterestKey";

  Future<void> setStringValueInPrefs({required String key, required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    log('prefs value :${prefs.getString(key)}');
  }

  Future<void> setListValueInPrefs({required String key, required List<String> value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
    log('prefs list value :${prefs.getStringList(key)}');
  }

  Future<String> getStringFromPrefs({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(key) ?? "";
    return value;
  }


}