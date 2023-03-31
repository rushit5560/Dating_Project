import 'dart:convert';
import 'dart:developer';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dater/constants/api_url.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../common_modules/custom_button.dart';
import '../constants/colors.dart';
import '../constants/enums.dart';
import '../constants/font_family.dart';
import '../constants/messages.dart';
import '../model/favorite_screen_model/liker_model.dart';
import '../utils/preferences/user_preference.dart';
import '../utils/style.dart';

class FavoriteScreenController extends GetxController {
  RxBool isLoading = true.obs;

  RxBool isShowAgain = false.obs;
  UserPreference userPreference = UserPreference();

  LikesDialogShowAgain likesDialogShowAgain = LikesDialogShowAgain.yes;



  List<LikerData> likerList = [];

  // Get Your Liker Function
  Future<void> getYourLikerFunction() async {
    isLoading(true);
    String url = ApiUrl.getLikerApi;
    log('getYourLikerFunction Api Url : $url');

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['token'] = AppMessages.token;

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        log('Liker Data : $value');

        LikerModel likerModel = LikerModel.fromJson(json.decode(value));
        likerList.clear();
        likerList.addAll(likerModel.msg);
        log('likerList Length : ${likerList.length}');
      });

    } catch(e) {
      log('getYourLikerFunction Error :$e');
      rethrow;
    }
    isLoading(false);
  }


  // Alert Dialog
  showLikesDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            title: Text(
              "See who likes you",
              style: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplayBold,
                textColor: AppColors.blackColor,
                fontSize: 14.sp,
                // fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              "Every profile will cost 1 coin",
              style: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplayRegular,
                textColor: AppColors.grey600Color,
                fontSize: 14.sp,
                // fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              const Divider(thickness: 2),
              ButtonCustom(
                text: "UnderStand",
                onPressed: () => Get.back(),
                // fontWeight: FontWeight.bold,
                textsize: 14.sp,
                textFontFamily: FontFamilyText.sFProDisplayBold,
                textColor: AppColors.whiteColor2,
                backgroundColor: AppColors.darkOrangeColor,
              ).commonSymmetricPadding(horizontal: 35),
              Row(children: [
                /*Obx(
                () => Checkbox(
                  value: isShowAgain.value,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  activeColor: AppColors.darkOrangeColor,
                  checkColor: AppColors.darkOrangeColor,
                  onChanged: (value) {
                    log('value : $value');
                    if (value == true) {
                      isShowAgain.value = false;
                    } else if (value == false) {
                      isShowAgain.value = true;
                    }
                    loadUI();
                  },
                ),
              ),*/
                Obx(
                  () => isLoading.value
                      ? Container()
                      : likesDialogShowAgain == LikesDialogShowAgain.yes
                          ? Radio(
                              activeColor: AppColors.darkOrangeColor,
                              value: LikesDialogShowAgain.yes,
                              groupValue: likesDialogShowAgain,
                              onChanged: (value) {
                                log('value1 : $value');
                                // if (value == true) {
                                //   isShowAgain.value = false;
                                // } else if (value == false) {
                                //   isShowAgain.value = true;
                                // }
                                loadUI();
                              })
                          : Radio(
                              activeColor: AppColors.darkOrangeColor,
                              value: LikesDialogShowAgain.no,
                              groupValue: likesDialogShowAgain,
                              onChanged: (value) {
                                log('value2 : $value');
                                // if (value == true) {
                                //   isShowAgain.value = false;
                                // } else if (value == false) {
                                //   isShowAgain.value = true;
                                // }
                                loadUI();
                              }),
                ),
                Text(
                  "don't show again",
                  style: TextStyleConfig.textStyle(
                    fontFamily: FontFamilyText.sFProDisplayRegular,
                    textColor: AppColors.darkOrangeColor,
                  ),
                ),
              ]),
            ],
          );
        });
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    await getYourLikerFunction();
    // isShowAgain.value = await userPreference.getStringFromPrefs(key: UserPreference.isSeeWhoLikesYouKey);
    showLikesDialog(Get.context!);
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
