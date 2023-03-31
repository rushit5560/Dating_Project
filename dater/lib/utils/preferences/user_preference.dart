import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {

  static String userMobileNoKey = "userMobileNoKey"; // String
  static String userTokenKey = "userTokenKey"; // This is temp token // String
  static String userVerifyTokenKey = "userVerifyTokenKey"; // This is main token // String
  static String isUserCreatedKey = "isUserCreatedKey"; // bool
  static String isUserLoggedInKey = "isUserLoggedInKey"; // bool
  static String isSeeWhoLikesYouKey = "isSeeWhoLikesYouKey"; // String


  Future<void> clearUserAllDataFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove(userMobileNoKey);
    prefs.remove(userTokenKey);
    prefs.remove(userVerifyTokenKey);
    prefs.remove(isUserLoggedInKey);

    // prefs.setString(userMobileNoKey, '');
    prefs.setString(userTokenKey, '');
    prefs.setString(userVerifyTokenKey, '');
    prefs.setBool(isUserLoggedInKey, false);
  }



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

  Future<void> setBoolValueInPrefs({required String key, required bool value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
    log('prefs value :${prefs.getBool(key)}');
  }

  Future<bool> getBoolFromPrefs({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool value = prefs.getBool(key) ?? true;
    return value;
  }

  Future<bool> getUserLoggedInFromPrefs({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool value = prefs.getBool(key) ?? false;
    return value;
  }

}