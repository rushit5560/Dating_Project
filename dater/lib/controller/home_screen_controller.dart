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
  // RxString selectedval = ''.obs;
  RxBool selected = false.obs;
  RxBool selectedSuperLove = false.obs;

  // int superLoveIndex = 0;

  String selectedVal = "";
  RxString name = ''.obs;
  RxString bio = ''.obs;
  RxString age = ''.obs;
  RxString profilePrompts = ''.obs;
  RxString selectedVlu = ''.obs;
  RxString gender = ''.obs;
  RxString work = ''.obs;
  RxString education = ''.obs;
  RxString height = ''.obs;
  RxString exercise = ''.obs;
  RxString smoking = ''.obs;
  RxString drinking = ''.obs;
  RxString politics = ''.obs;
  RxString religion = ''.obs;
  RxString kids = ''.obs;
  RxString distance = "".obs;
  RxString homeTown = "".obs;
  RxString verifiedUser = "".obs;

  List<SuggestionData> suggestionList = [];
  SuggestionData singlePersonData = SuggestionData();
  UserPreference userPreference = UserPreference();
  List<BasicModel> basicList = [];
  List<String> interestList = [];
  List<String> languageList = [];
  List<UserImage> userImageList = [];
  RxInt currentUserIndex = 0.obs;

  RxBool isCancelButtonClick = false.obs;
  RxBool isStarButtonClick = false.obs;
  RxBool isLikeButtonClick = false.obs;

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

// GetUndestandfunction,
  Future<void> understandFunction() async {
    await userPreference.setBoolValueInPrefs(
        key: UserPreference.isragatherInKey, value: selected.value);
    log("selected.value: ${selected.value}");
    await getUserSuggestionsFunction();
  }

  // superlovefunction,
  Future<void> understandSuperLoveFunction(int index) async {
    await userPreference.setBoolValueInPrefs(
        key: UserPreference.isSuperLoveInKey, value: selectedSuperLove.value);
    log("selectedSuperLove.value: ${selectedSuperLove.value}");

    await superLoveProfileFunction(
      likedId: "${singlePersonData.id}",
      likeType: LikeType.super_love,
      swipeCard: false,
      index: index
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
      log('Get User Suggestion User Token : $verifyToken');
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
            setChangedUserData(0);

            log("singlePersonData :${singlePersonData.name}");
            log("singlePersonData :${singlePersonData.bio}");

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

    // Timer(const Duration(seconds: 1), () => isLoading(false));


    // isLoading(false);
    // loadUI();
    await getUserSuggestionsFunction2();
  }

  Future<void> getUserSuggestionsFunction2() async {
    isLoading(true);
    String url = ApiUrl.getSuggestionApi;
    log('Suggestion Api Url :$url');

    try {
      String verifyToken = await userPreference.getStringFromPrefs(
          key: UserPreference.userVerifyTokenKey);
      log('Get User Suggestion User Token : $verifyToken');
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
            setChangedUserData(0);

            log("singlePersonData :${singlePersonData.name}");
            log("singlePersonData :${singlePersonData.bio}");

            log('suggestionList : ${suggestionList.length}');

          }
        } else {
          log('getUserSuggestionsFunction Else');
          // isLoading(false);
        }
      });
    } catch (e) {
      log('getMatchesFunction Error :$e');
      // isLoading(false);
      rethrow;
    }
    isLoading(false);
    // Timer(const Duration(seconds: 1), () => isLoading(false));


    // isLoading(false);
    // loadUI();
  }

  /// Set Basic Details
  setBasicListFunction() {
    basicList.add(BasicModel(image: AppImages.genderImage, name: gender.value));
    basicList.add(BasicModel(image: AppImages.workImage, name: work.value));
    basicList.add(
        BasicModel(image: AppImages.educationImage, name: education.value));
    basicList.add(BasicModel(image: AppImages.heightImage, name: height.value));
    basicList
        .add(BasicModel(image: AppImages.exerciseImage, name: exercise.value));
    basicList
        .add(BasicModel(image: AppImages.smokingImage, name: smoking.value));

    basicList
        .add(BasicModel(image: AppImages.drinkingImage, name: drinking.value));
    basicList
        .add(BasicModel(image: AppImages.politicsImage, name: politics.value));
    basicList
        .add(BasicModel(image: AppImages.refreshImage, name: religion.value));
    basicList.add(BasicModel(image: AppImages.kidsImage, name: kids.value));
  }

  /*/// Like   function
  Future<void> likeProfileFunction(
      {required String likedId, required LikeType likeType}) async {
    isLoading(true);
    String url = ApiUrl.likeProfileApi;

    try {
      Map<String, dynamic> bodyData = {
        "token": verifyToken,
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
      {required String likedId,
      required LikeType likeType,
      swipeCard = false,
        required int index,
      }) async {
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
        /// If Coming from card swipe that time not call this if condition because double time swipe the card
        /*if (swipeCard == false) {
          if (likeType == LikeType.like) {
            log('Log Type 200 -1 : $likeType');
            cardController.next(
              swipeDirection: SwipeDirection.right,
            );
          } else if (likeType == LikeType.super_love) {
            log('Log Type 200 -2 : $likeType');
            cardController.next(
              swipeDirection: SwipeDirection.up,
              duration: const Duration(milliseconds: 600),
            );
          }
        }*/

        /// Remove Data at 0 Index & set new data in variable
        // suggestionList.removeAt(0);
        // When swipe index & suggestion list length same that time clear the suggestion list
        if(index == suggestionList.length) {
          suggestionList = [];
        }
        if (suggestionList != []) {
          /// When Swipe complete that time set new user data in display variable
          // singlePersonData = suggestionList[0];
          setChangedUserData(index);
        } else {
          suggestionList.clear();
          suggestionList = [];
        }

        // loadUI();
      } else if (superLoveModel.statusCode == 400) {
        Fluttertoast.showToast(msg: superLoveModel.msg);
        if (superLoveModel.msg.toLowerCase() ==
            "You already liked this account".toLowerCase()) {
          log('Log Type 400 -1 : $likeType');

          /// If Coming from card swipe that time not call this if condition because double time swipe the card
          /*if (swipeCard == false) {
            if (likeType == LikeType.like) {
              cardController.next(
                swipeDirection: SwipeDirection.right,
              );
            } else if (likeType == LikeType.super_love) {
              log('Log Type 400 -2 : $likeType');
              cardController.next(
                swipeDirection: SwipeDirection.up,
                duration: const Duration(milliseconds: 600),
              );
            }
          }*/

          /// Remove Data at 0 Index & set new data in variable
          // suggestionList.removeAt(0);
          if(index == suggestionList.length) {
            suggestionList = [];
          }
          if (suggestionList.isNotEmpty) {
            /// When Swipe complete that time set new user data in display variable
            // singlePersonData = suggestionList[0];
            setChangedUserData(index);
          } else {
            suggestionList.clear();
            suggestionList = [];
          }
        }
      } else {
        log('superLoveProfileFunction Else');
      }
    } catch (e) {
      log('superLoveProfileFunction Error : $e');
      rethrow;
    }
    loadUI();
  }

  /// When swipe complete that time user data change
  setChangedUserData(int index) {
    name = suggestionList[index].name.toString().obs;
    bio = suggestionList[index].bio.toString().obs;
    age = suggestionList[index].age.toString().obs;
    profilePrompts = suggestionList[index].profilePrompts.toString().obs;
    work = suggestionList[index].basic!.work.obs;
    gender = suggestionList[index].basic!.gender.obs;
    education = suggestionList[index].basic!.education.obs;
    height = suggestionList[index].basic!.height.obs;
    exercise = suggestionList[index].basic!.exercise.obs;
    smoking = suggestionList[index].basic!.smoking.obs;
    drinking = suggestionList[index].basic!.drinking.obs;
    politics = suggestionList[index].basic!.politics.obs;
    religion = suggestionList[index].basic!.religion.obs;
    kids = suggestionList[index].basic!.kids.obs;
    distance = suggestionList[index].distance!.obs;
    homeTown = suggestionList[index].homeTown!.obs;
    verifiedUser = suggestionList[index].verified!.obs;

    basicList.clear();
    setBasicListFunction();
    interestList.clear();
    if(suggestionList[index].interest != []) {
      for (int i = 0; i < suggestionList[index].interest!.length; i++) {
        interestList.add(suggestionList[index].interest![i].name);
      }
    }
    log('interestList Length : ${interestList.length}');
    languageList.clear();
    if(suggestionList[index].languages != []) {
      languageList.addAll(suggestionList[index].languages!);
    }

    //todo
    userImageList.clear();
    if(suggestionList[index].images != []) {
      userImageList.addAll(suggestionList[index].images!);
    }


    log("suggestionList : ${suggestionList.length}");
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  initMethod() async {
    await getLocation();
    await getUserSuggestionsFunction();
    // await getUserSuggestionsFunction();
    // await setBasicListFunction();
    loadUI();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
