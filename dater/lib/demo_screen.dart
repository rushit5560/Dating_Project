import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:dater/constants/api_url.dart';
import 'package:get/get.dart';

import 'constants/messages.dart';
import 'models.dart';

class DemoController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt successStatus = 0.obs;


  /// Update User Location
  Future<void> updateUserLocationFunction() async {
    isLoading(true);
    String url = ApiUrl.updateUserLocationApi;
    log('updateUserLocationFunction Api Url : $url');

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['token'] = AppMessages.token;

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        log('value : $value');
        UpdateLocationModel updateLocationModel = UpdateLocationModel.fromJson(json.decode(value));
        successStatus.value = updateLocationModel.statusCode;

        if(successStatus.value == 200) {
          Fluttertoast.showToast(msg: updateLocationModel.msg);
        } else {
         log('updateUserLocationFunction Else');
        }

      });

    } catch(e) {
      log('updateUserLocationFunction Error :$e');
      rethrow;
    }
    isLoading(false);
  }


  /// Get User Age
  Future<void> getUserAgeFunction() async {
    isLoading(true);
    String url = ApiUrl.getUserAgeApi;
    log('getUserAgeFunction Api Url : $url');

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['token'] = AppMessages.token;

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        log('value : $value');

        UserAgeModel userAgeModel = UserAgeModel.fromJson(json.decode(value));
        successStatus.value = userAgeModel.statusCode;

        if(successStatus.value == 200) {
          Fluttertoast.showToast(msg: userAgeModel.msg);
        } else {
          log('getUserAgeFunction Else');
        }
      });

    } catch(e) {
      log('getUserAgeFunction Error :$e');
      rethrow;
    }
    isLoading(false);
  }

  /// Send Message
  Future<void> sendChatMessageFunction() async {
    isLoading(true);
    String url = ApiUrl.sendMessageApi;
    log('sendChatMessageFunction Api Url : $url');

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['token'] = AppMessages.token;

      var response = await request.send();
    } catch(e) {
      log('sendChatMessageFunction Error :$e');
      rethrow;
    }

  }

}