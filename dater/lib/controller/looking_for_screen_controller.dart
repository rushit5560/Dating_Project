import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants/api_url.dart';
import '../model/authentication_model/gender_select_screen_model/get_gender_model.dart';

class LookingForScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt successStatus = 0.obs;

  RxBool isShowOnProfile = true.obs;
  List<Msg> lookingForList = [];

  Msg selectedLookingForValue = Msg(id: "1", name: "Relationship");

  Future<void> getSexualityFunction() async {
    isLoading(true);
    String url = ApiUrl.getSexualityApi;
    log('getSexualityFunction Api Url : $url');

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("response $response");
      GenderModel getGenderModel =
          GenderModel.fromJson(json.decode(response.body));
      successStatus.value = getGenderModel.statusCode;

      if (successStatus.value == 200) {
        lookingForList.clear();
        lookingForList.addAll(getGenderModel.msg);

        // for (var element in lookingForList) {
        //   if (element.name == genderValue) {
        //     selectedLookingForValue = element;
        //   }
        // }

        log('lookingForList Length : ${lookingForList.length}');
      } else {
        log('getSexualityFunction Else');
      }
    } catch (e) {
      log('getSexualityFunction Error :$e');
      rethrow;
    }
    isLoading(false);
  }

  void radioButtonChangeFunction(Msg selectedValue) {
    isLoading(true);
    selectedLookingForValue = selectedValue;
    isLoading(false);
  }

  Future<void> initMethod() async {
    await getSexualityFunction();
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }
}
