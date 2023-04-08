import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:dater/utils/preferences/user_preference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/api_url.dart';
import '../model/home_screen_model/matches_model.dart';

class AllChatListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController searchTextFieldController = TextEditingController();
  RxBool rightSelected = true.obs;
  RxBool activeSelected = true.obs;
  RxBool panddingMess = true.obs;


  List<MatchPersonData> matchesList = [];
  UserPreference userPreference = UserPreference();

  /// Get Matches Function
  Future<void> getMatchesFunction() async {
    isLoading(true);
    String url = ApiUrl.matchesApi;
    log('Matches Api Url :$url');

    try {
      String verifyToken = await userPreference.getStringFromPrefs(key: UserPreference.userVerifyTokenKey);
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['token'] = verifyToken;

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        log("value :$value");
        MatchesModel matchesModel = MatchesModel.fromJson(json.decode(value));
        matchesList.clear();
        if(matchesModel.msg.isNotEmpty) {
          matchesList.addAll(matchesModel.msg);
          log('matchesList : ${matchesList.length}');
        }
      });
    } catch (e) {
      log('getMatchesFunction Error :$e');
      rethrow;
    }

    isLoading(false);
  }


}
