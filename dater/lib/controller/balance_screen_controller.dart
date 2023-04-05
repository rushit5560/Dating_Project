import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:dater/constants/api_url.dart';
import 'package:get/get.dart';

import '../constants/messages.dart';
import '../model/balance_screen_model/coin_model.dart';
class BalanceScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxInt successStatus = 0.obs;

  RxString coinValue = "0".obs;

  /// Get My Coins
  Future<void> getMyCoinsFunction() async {
    isLoading(true);
    String url = ApiUrl.getCoinsApi;
    log('getMyCoinsFunction Api Url : $url');

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['token'] = AppMessages.token;

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        log('value : $value');
        CoinModel coinModel = CoinModel.fromJson(json.decode(value));
        successStatus.value = coinModel.statusCode;

        if(successStatus.value == 200) {
          coinValue.value = coinModel.msg;
          log('coinValue.value : ${coinValue.value}');
        } else {
          log('getMyCoinsFunction Else');
        }



      });
    } catch(e) {
      log('getMyCoinsFunction Error :$e');
      rethrow;
    }
    isLoading(false);
  }


  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    await getMyCoinsFunction();
  }
}