import 'dart:convert';
import 'dart:developer';

import 'package:dater/constants/api_url.dart';
import 'package:dater/model/gender_select_screen_model/get_gender_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GenderSelectScreenController extends GetxController {
  RxString selectedvalue = "Female".obs;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<Msg> msgData = [];

  Future<void> geGenderFunction() async {
    isLoading(true);

    String url = ApiUrl.getGenderApi;
    log("geGenderFunction get url: $url");

    try {
      http.Response response = await http.get(Uri.parse(url));

      GetGenderModel getGenderModel =
          GetGenderModel.fromJson(json.decode(response.body));

      // isSuccessStatus =response.statusCode ;

      if (response.statusCode == 200) {
        log("response.statusCode: ${response.statusCode}");
        log("response.body: ${response.body}");
        msgData = getGenderModel.msg;

        log("msgData: $msgData");
      } else {
        log("geGenderFunction Error");
      }
    } catch (e) {
      log("geGenderFunction Error $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    geGenderFunction();
    super.onInit();
  }
}
