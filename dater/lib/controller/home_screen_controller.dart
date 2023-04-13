import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dater/constants/messages.dart';
import 'package:dater/model/home_screen_model/super_love_model.dart';
import 'package:dater/model/profile_screen_models/basic_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:dater/constants/api_url.dart';
import 'package:dater/constants/app_images.dart';
import 'package:dater/screens/location_permission_sreen/location_permission%20screen.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:swipable_stack/swipable_stack.dart';
import '../constants/enums.dart';
import '../model/home_screen_model/suggestions_model.dart';
import '../utils/preferences/user_preference.dart';

class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt successStatus = 0.obs;
  SwipableStackController cardController = SwipableStackController();
  RxBool selected = false.obs;
  String name = '';
  String age = '';
  String profilePrompts = '';

  String gender = '';
  String work = '';
  String education = '';
  String height = '';
  String exercise = '';
  String smoking = '';
  String drinking = '';
  String politics = '';
  String religion = '';
  String kids = '';
  List<SuggestionData> suggestionList = [];
  SuggestionData singlePersonData = SuggestionData();
  UserPreference userPreference = UserPreference();
  List<BasicModel> basicList = [];

  List<String> images = [
    AppImages.swiper1Image,
    AppImages.swiper2Image,
    AppImages.swiper1Image,
    AppImages.swiper2Image,
  ];

  fetchMobileLocation() async {
    Location location = Location();

    bool serviceEnabled;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      log("111");
      Get.to(() => LocationPermissionScreen());

      if (!serviceEnabled) {
        return;
      }
    }
  }

  Future<void> getLocation() async {
    log("getLocation");
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        // ignore: void_checks
        // isLoading(true);
        fetchMobileLocation();
        // isLoading(false);
      },
    );
  }

  /// Get Suggestions Function
  Future<void> getUserSuggestionsFunction() async {
    isLoading(true);
    String url = ApiUrl.getSuggestionApi;
    log('Suggestion Api Url :$url');

    try {
      String verifyToken = await userPreference.getStringFromPrefs(
          key: UserPreference.userVerifyTokenKey);
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['token'] = verifyToken;

      var response = await request.send();

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) async {
        log("Suggestion Api value :$value");
        SuggestionListModel suggestionListModel =
            SuggestionListModel.fromJson(json.decode(value));
        successStatus.value = suggestionListModel.statusCode;
        if (successStatus.value == 200) {
          suggestionList.clear();

          if (suggestionListModel.msg.isNotEmpty) {
            suggestionList.addAll(suggestionListModel.msg);
            singlePersonData = suggestionList[0];

            // for(var element in suggestionList) {
            //   log('suggestionList Id : ${element.id}');
            // }
            log('suggestionList : ${suggestionList.length}');
          }
        } else {
          log('getUserSuggestionsFunction Else');
        }
      });
    } catch (e) {
      log('getMatchesFunction Error :$e');
      rethrow;
    }

    Timer(const Duration(seconds: 1), () => isLoading(false));

    // isLoading(false);
  }

  /// Set Basic Details
  setBasicListFunction() {
    basicList.add(BasicModel(image: AppImages.genderImage, name: gender));
    basicList.add(BasicModel(image: AppImages.workImage, name: work));
    basicList.add(BasicModel(image: AppImages.educationImage, name: education));
    basicList.add(BasicModel(image: AppImages.heightImage, name: height));
    basicList.add(BasicModel(image: AppImages.exerciseImage, name: exercise));
    basicList.add(BasicModel(image: AppImages.smokingImage, name: smoking));

    basicList.add(BasicModel(image: AppImages.drinkingImage, name: drinking));
    basicList.add(BasicModel(image: AppImages.politicsImage, name: politics));
    basicList.add(BasicModel(image: AppImages.refreshImage, name: religion));
    basicList.add(BasicModel(image: AppImages.kidsImage, name: kids));
  }

  /*/// Like   function
  Future<void> likeProfileFunction(
      {required String likedId, required LikeType likeType}) async {
    isLoading(true);
    String url = ApiUrl.likeProfileApi;

    try {
      Map<String, dynamic> bodyData = {
        "token": AppMessages.token,
        "type": likeType.name,
        "liked_id": likedId
      };

      http.Response response = await http.post(
        Uri.parse(url),
        body: bodyData,
      );

      log('Like Profile Response Function : ${response.body}');

      LikeProfileModel likeProfileModel =
          LikeProfileModel.fromJson(json.decode(response.body));

      if (likeProfileModel.statusCode == 200) {
        /// Card Swipe right
        cardController.next(
          swipeDirection: SwipeDirection.right,
        );
      } else {
        log('likeProfileFunction Else');
      }
    } catch (e) {
      log('likeProfileFunction Error : $e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }*/

  /// Like & SuperLove function
  Future<void> superLoveProfileFunction(
      {required String likedId, required LikeType likeType}) async {
    String url = ApiUrl.superLoveProfileApi;

    try {
      String verifyToken = await userPreference.getStringFromPrefs(
          key: UserPreference.userVerifyTokenKey);
      Map<String, dynamic> bodyData = {
        "token": verifyToken,
        "type": likeType.name,
        "liked_id": likedId
      };
      log('bodyData : $bodyData');

      http.Response response = await http.post(
        Uri.parse(url),
        body: bodyData,
      );

      log('superLove ProfileFunction Response Function : ${response.body}');

      SuperLoveModel superLoveModel =
          SuperLoveModel.fromJson(json.decode(response.body));

      if (superLoveModel.statusCode == 200) {
        if (likeType == LikeType.like) {
          cardController.next(
            swipeDirection: SwipeDirection.right,
          );
        } else if (likeType == LikeType.super_love) {
          cardController.next(
            swipeDirection: SwipeDirection.up,
            duration: const Duration(milliseconds: 600),
          );
        }

        /// Remove Data at 0 Index & set new data in variable
        suggestionList.removeAt(0);
        if (suggestionList.isNotEmpty) {
          singlePersonData = suggestionList[0];
        }
        loadUI();
      } else if (superLoveModel.statusCode == 400) {
        Fluttertoast.showToast(msg: superLoveModel.msg);
        if (superLoveModel.msg.toLowerCase() ==
            "You already liked this account") {
          if (likeType == LikeType.like) {
            cardController.next(
              swipeDirection: SwipeDirection.right,
            );
          } else if (likeType == LikeType.super_love) {
            cardController.next(
              swipeDirection: SwipeDirection.up,
              duration: const Duration(milliseconds: 600),
            );
          }

          /// Remove Data at 0 Index & set new data in variable
          suggestionList.removeAt(0);
          if (suggestionList.isNotEmpty) {
            singlePersonData = suggestionList[0];
          }
          loadUI();
        }
      } else {
        log('superLoveProfileFunction Else');
      }
    } catch (e) {
      log('superLoveProfileFunction Error : $e');
      rethrow;
    }
  }

  getUserData() {
    name = suggestionList[0].name.toString();
    age = suggestionList[0].age.toString();
    profilePrompts = suggestionList[0].profilePrompts.toString();
    work = suggestionList[0].basic!.work;
    gender = suggestionList[0].basic!.gender;
    education = suggestionList[0].basic!.education;
    height = suggestionList[0].basic!.height;
    exercise = suggestionList[0].basic!.exercise;
    smoking = suggestionList[0].basic!.smoking;
    drinking = suggestionList[0].basic!.drinking;
    politics = suggestionList[0].basic!.politics;
    religion = suggestionList[0].basic!.religion;
    kids = suggestionList[0].basic!.kids;
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  initMethod() async {
    await getLocation();
    await getUserSuggestionsFunction();
    await setBasicListFunction();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
