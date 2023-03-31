import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:swipable_stack/swipable_stack.dart';
import '../constants/api_url.dart';
import '../constants/enums.dart';
import '../constants/messages.dart';
// import '../model/favorite_screen_model/liker_model.dart';
// import '../model/home_screen_model/matches_model.dart';
import '../model/home_screen_model/super_love_model.dart';
import '../model/liker_details_screen_model/likder_user_details_model.dart';

class LikerDetailsScreenController extends GetxController {
  String likerId = Get.arguments[0];
  RxBool isLoading = false.obs;

  SwipableStackController cardController = SwipableStackController();

  // MatchPersonData singlePersonData = MatchPersonData();
  UserDetails userDetails = UserDetails();
  RxBool selected = false.obs;

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
        Get.back();


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
        }
        Get.back();
      } else {
        log('superLoveProfileFunction Else');
      }
    } catch (e) {
      log('superLoveProfileFunction Error : $e');
      rethrow;
    }
  }

  Future<void> getLikerDetailsFunction() async {
    isLoading(true);
    String url = ApiUrl.getUserDetailsApi;
    log('getLikerDetailsFunction Api Url : $url');

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['token'] = AppMessages.token;
      request.fields['user_id'] = likerId;

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        log("value :$value");
        UserDetailsModel userDetailsModel = UserDetailsModel.fromJson(json.decode(value));

        if(userDetailsModel.statusCode == 200) {
          userDetails = userDetailsModel.msg[0];
        } else {
          log('getLikerDetailsFunction Else');
        }

      });

    } catch(e) {
      log('getLikerDetailsFunction Error :$e');
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
    await getLikerDetailsFunction();
  }
}