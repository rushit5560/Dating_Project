import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dater/constants/messages.dart';
import 'package:dater/model/home_screen_model/matches_model.dart';
import 'package:dater/model/home_screen_model/super_love_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:dater/constants/api_url.dart';
import 'package:dater/constants/app_images.dart';
import 'package:dater/screens/location_permission_sreen/location_permission%20screen.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:swipable_stack/swipable_stack.dart';
import '../constants/enums.dart';


class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  SwipableStackController cardController = SwipableStackController();
  RxBool selected = false.obs;

  List<MatchPersonData> matchesList = [];
  MatchPersonData singlePersonData = MatchPersonData();

  List<String> images = [
    AppImages.swiper1Image,
    AppImages.swiper2Image,
    AppImages.swiper1Image,
    AppImages.swiper2Image,
  ];

  fetchMobileLocation() async {
    Location location = Location();

    bool _serviceEnabled;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      log("111");
      Get.to(() => LocationPermissionScreen());

      if (!_serviceEnabled) {
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

  /// Get Matches Function
  Future<void> getMatchesFunction() async {
    isLoading(true);
    String url = ApiUrl.matchesApi;
    log('Matches Api Url :$url');

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['token'] = AppMessages.token;

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        log("value :$value");
        MatchesModel matchesModel = MatchesModel.fromJson(json.decode(value));
        matchesList.clear();
        matchesList.addAll(matchesModel.msg);
        if(matchesList.isNotEmpty) {
          singlePersonData = matchesList[0];
        }
        log('matchesList : ${matchesList.length}');
      });
    } catch (e) {
      log('getMatchesFunction Error :$e');
      rethrow;
    }

    isLoading(false);
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
      Map<String, dynamic> bodyData = {
        "token": AppMessages.token,
        "type": likeType.name,
        "liked_id": likedId
      };
      log('bodyData : $bodyData');

      http.Response response = await http.post(
        Uri.parse(url),
        body: bodyData,
      );

      log('superLove ProfileFunction Response Function : ${response.body}');

      SuperLoveModel superLoveModel = SuperLoveModel.fromJson(json.decode(response.body));

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

        matchesList.removeAt(0);
        if(matchesList.isEmpty) {
          loadUI();
        }

      } else if (superLoveModel.statusCode == 400) {
        Fluttertoast.showToast(msg: superLoveModel.msg);
        if(superLoveModel.msg.toLowerCase() == "You already liked this account") {
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

          matchesList.removeAt(0);
          if(matchesList.isEmpty) {
            loadUI();
          }
        }
      } else {
        log('superLoveProfileFunction Else');
      }
    } catch (e) {
      log('superLoveProfileFunction Error : $e');
      rethrow;
    }
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  initMethod() async {
    await getLocation();
    await getMatchesFunction();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

}
