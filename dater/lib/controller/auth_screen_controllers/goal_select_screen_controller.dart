import 'dart:convert';
import 'dart:developer';

import 'package:dater/constants/api_url.dart';
import 'package:dater/model/authantication_model/select_screen_model/gole_select_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GoalSelectScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxString selectedvalue = "Serious relationship".obs;
  List<GoleData> goleDataList = [];

  Future<void> getGoalListFunction() async {
    isLoading(true);

    String url = ApiUrl.getGoalApi;
    log("getGoalListFunction get url: $url");

    try {
      http.Response response = await http.get(Uri.parse(url));

      GoleModel getGoleModel =
          GoleModel.fromJson(json.decode(response.body));

      if (response.statusCode == 200) {
        log("response.statusCode: ${response.statusCode}");
        log("response.body: ${response.body}");
        goleDataList = getGoleModel.msg;

        log("goleDataList: $goleDataList");
      } else {
        log("getGoalListFunction Error");
      }
    } catch (e) {
      log("getGoalListFunction Error $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getGoalListFunction();
    super.onInit();
  }
}
