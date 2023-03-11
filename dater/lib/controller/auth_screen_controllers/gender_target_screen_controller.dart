// import 'dart:convert';
// import 'dart:developer';
// import 'package:dater/model/authantication_model/gender_target_screen_model/get_gender_target_model.dart';
// import 'package:http/http.dart' as http;

// import 'package:dater/constants/api_url.dart';
// import 'package:get/get.dart';

// class GenderTargetScreenController extends GetxController {
//   RxString selectedvalue = "Female".obs;
//   RxBool isLoading = false.obs;
//   RxBool isSuccessStatus = false.obs;
//   List<GetTargetGenderModel> msgData = [];

//   Future<void> getargetGenderFunction() async {
//     isLoading(true);

//     String url = ApiUrl.getGenderApi;
//     log("getargetGenderFunction get url: $url");

//     try {
//       http.Response response = await http.get(Uri.parse(url));

//       GetTargetGenderModel getTargetGenderModel =
//           GetTargetGenderModel.fromJson(json.decode(response.body));

//       // isSuccessStatus =response.statusCode ;

//       if (response.statusCode == 200) {
//         log("response.statusCode: ${response.statusCode}");
//         log("response.body: ${response.body}");
//         msgData = getTargetGenderModel.msg;

//         log("msgData: $msgData");
//       } else {
//         log("getargetGenderFunction Error");
//       }
//     } catch (e) {
//       log("getargetGenderFunction Error $e");
//       rethrow;
//     } finally {
//       isLoading(false);
//     }
//   }

//   @override
//   void onInit() {
//     getargetGenderFunction();
//     super.onInit();
//   }
// }
import 'dart:convert';
import 'dart:developer';

import 'package:dater/constants/api_url.dart';
import 'package:dater/model/authantication_model/gender_target_screen_model/get_gender_target_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GenderTargetScreenController extends GetxController {
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

      GetTargetGenderModel getTargetGenderModel =
          GetTargetGenderModel.fromJson(json.decode(response.body));

      // isSuccessStatus =response.statusCode ;

      if (response.statusCode == 200) {
        log("response.statusCode: ${response.statusCode}");
        log("response.body: ${response.body}");
        msgData = getTargetGenderModel.msg;

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
