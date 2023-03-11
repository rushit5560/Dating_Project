import 'dart:convert';
import 'dart:developer';

import 'package:dater/constants/api_url.dart';
import 'package:dater/model/authantication_model/interests%20screen_model/get_interests%20_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/authantication_model/interests screen_model/cateory_item_model.dart';

class InterestsScreen1Controller extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<InterestsData> interestsData = [];
  List<String> interestsDataStringList = [];

  List<String> categoryNameList = [];
  List<CategoryItemModel> categoryList = [];

  Future<void> getInterestFunction() async {
    isLoading(true);
    String url = ApiUrl.getInterestsApi;
    log("getInterestFunction: $url");
    try {
      http.Response response = await http.get(Uri.parse(url));
      IntrestModel getIntrestModel =
          IntrestModel.fromJson(json.decode(response.body));

      if (response.statusCode == 200) {
        log("getInterestFunction.statusCode: ${response.statusCode}");
        log("getInterestFunction.body: ${response.body}");
        getIntrestModel.msg.length;
        interestsData = getIntrestModel.msg;

        if (getIntrestModel.msg.isNotEmpty) {
          /// Create category name list - String type list
          for (var item in getIntrestModel.msg) {
            if (categoryNameList.contains(item.categoryName) == false) {
              categoryNameList.add(item.categoryName);
              categoryList.add(CategoryItemModel(
                  categoryId: item.categoryId,
                  categoryName: item.categoryName,
                  options: []));
            }
          }

          ///
          for (int i = 0; i < getIntrestModel.msg.length; i++) {
            for (int j = 0; j < categoryList.length; j++) {
              if (getIntrestModel.msg[i].categoryId == categoryList[j].categoryId) {
                categoryList[j].options.add(
                      Option(
                        id: getIntrestModel.msg[i].id,
                        name: getIntrestModel.msg[i].name,
                        isSelected: false,
                      ),
                    );
              }
            }
          }

          ///
          for (int i = 0; i < categoryList.length; i++) {
            for (int j = 0; j < categoryList[i].options.length; j++) {
              log('${categoryList[i].categoryName} => ${categoryList[i].options[j].name}');
            }
          }
        } else {
          /// When api list getting empty that time coming here
        }

        //   List<InterestsData> interestsDataList = [];
        //   for (var item in interestsData) {
        //     log("getInterestFunction 111");
        //     if (interestsDataStringList.contains(item.categoryName)) {
        //       interestsDataList.add(item);
        //     } else {
        //       interestsDataStringList.add(item.categoryName);
        //       interestsDataList.add(item);
        //     }
        //     log("interestsDataList: $interestsDataList");
        //   }
        // } else {
        //   log("getInterestFunction Error");
      }
    } catch (e) {
      log("getInterestFunction Error: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getInterestFunction();
    super.onInit();
  }
}
