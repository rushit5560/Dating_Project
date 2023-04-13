import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dater/controller/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../constants/api_url.dart';
import '../constants/enums.dart';
import '../constants/messages.dart';
import '../model/authentication_model/add_user_photo_screen_model/user_photo_upload_screen.dart';
import '../model/authentication_model/complete signup_screen_model/complete signup_model.dart';
import '../model/profile_screen_models/logged_in_user_details_model.dart';
import '../model/profile_screen_models/upload_image_model.dart';
import '../utils/preferences/user_preference.dart';

class EditProfileScreenController extends GetxController {
  // UserDetails userDetails = Get.arguments[0];
  // final profileScreenController = Get.find<ProfileScreenController>();

  UserDetails? userDetails;

  RxBool isLoading = false.obs;
  RxInt successStatus = 0.obs;
  final ImagePicker imagePicker = ImagePicker();

  MoreAboutMe exerciseValue = MoreAboutMe.no;
  MoreAboutMe drinkingValue = MoreAboutMe.no;
  MoreAboutMe smokingValue = MoreAboutMe.no;
  MoreAboutMe kidsValue = MoreAboutMe.no;

  List<String> interestList = [];
  TextEditingController profilePromptsController = TextEditingController();
  TextEditingController myBioController = TextEditingController();

  UserPreference userPreference = UserPreference();

  // RxList<File> captureImageList = RxList<File>();
  RxList<UploadUserImage> captureImageList = RxList<UploadUserImage>();
  RxDouble startVal = 00.0.obs;
  RxDouble endVal = 80.0.obs;
  File? file;

  RxBool onSelected = false.obs;

  /// Image Select From Gallery
  getImageFromGallery() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      captureImageList.add(UploadUserImage(
          imageUrl: pickedFile.path, isImageFromNetwork: false));
      File selectedFile = File(pickedFile.path);
      await uploadImageFunction(selectedFile);
    }
    log('captureImageList Length : ${captureImageList.length}');
    loadUI();
  }

  /// Upload Image function
  Future<void> uploadImageFunction(File image) async {
    isLoading(true);
    String url = ApiUrl.uploadPhotoApi;
    try {
      String verifyToken = await userPreference.getStringFromPrefs(
          key: UserPreference.userVerifyTokenKey);

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers['fileKey'] = "file";
      request.headers['chunkedMode'] = "false";
      request.headers['mimeType'] = "multipart/form-data";
      request.fields['token'] = verifyToken;
      request.files.add(await http.MultipartFile.fromPath("file", image.path));

      log('All Fields : ${request.fields}');
      log('All files : ${request.files}');
      log('All headers : ${request.headers}');
      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        log('value :$value');
        UserPhotoUploadModel userPhotoUploadModel =
            UserPhotoUploadModel.fromJson(json.decode(value));

        if (userPhotoUploadModel.statusCode == 200) {
          Fluttertoast.showToast(msg: userPhotoUploadModel.msg);
        } else if (userPhotoUploadModel.statusCode == 400) {
          Fluttertoast.showToast(msg: userPhotoUploadModel.msg);
        } else {
          Fluttertoast.showToast(msg: AppMessages.apiCallWrong);
        }
      });
    } catch (e) {
      log('uploadImageFunction Error :$e');
      rethrow;
    }
  }

  /// Delete User Image Function
  Future<void> deleteUserImageFunction(int i) async {
    captureImageList.removeAt(i);
  }

  /// Set Profile Prompts in Prefs
  Future<void> setProfilePromptsFunction() async {
    await userPreference.setStringValueInPrefs(
        key: UserPreference.profilePromptsKey,
        value: profilePromptsController.text.trim());
    String prompts = await userPreference.getStringFromPrefs(
        key: UserPreference.profilePromptsKey);

    await updateUserProfileFunction(
        key: AppMessages.profilePromptsApiText, value: prompts);
    log('Prompts : $prompts');
  }

  /// Set User Bio in Prefs
  Future<void> setUserBioFunction() async {
    await userPreference.setStringValueInPrefs(
        key: UserPreference.bioKey, value: myBioController.text.trim());
    String bio =
        await userPreference.getStringFromPrefs(key: UserPreference.bioKey);
    log('Bio : $bio');
    await updateUserProfileFunction(
        key: AppMessages.bioApiText, value: bio);
  }

  /// Set User height in Prefs
  Future<void> setUserHeightFunction() async {
    await userPreference.setStringValueInPrefs(
        key: UserPreference.heightKey, value: endVal.toString());
    String height =
        await userPreference.getStringFromPrefs(key: UserPreference.heightKey);
    log('Height : $height');
    await updateUserProfileFunction(
        key: AppMessages.heightApiText, value: height.split('.')[0].toString());
  }

  /// Set Exercise Modules
  Future<void> setExerciseFunction(MoreAboutMe selectedValue) async {
    String value = selectedValue == MoreAboutMe.no
        ? "no"
        : selectedValue == MoreAboutMe.yes
            ? "yes"
            : "sometimes";
    await userPreference.setStringValueInPrefs(
        key: UserPreference.exerciseKey, value: value);
    await updateUserProfileFunction(
        key: AppMessages.exerciseApiText, value: value.toLowerCase().trim());
  }

  /// Set Drinking Modules
  Future<void> setDrinkingFunction(MoreAboutMe selectedValue) async {
    String value = selectedValue == MoreAboutMe.no
        ? "no"
        : selectedValue == MoreAboutMe.yes
            ? "yes"
            : "socially";
    await userPreference.setStringValueInPrefs(
        key: UserPreference.drinkingKey, value: value);
    await updateUserProfileFunction(
        key: AppMessages.drinkingApiText, value: value.toLowerCase().trim());
  }

  /// Set Smoking Modules
  Future<void> setSmokingFunction(MoreAboutMe selectedValue) async {
    String value = selectedValue == MoreAboutMe.no
        ? "no"
        : selectedValue == MoreAboutMe.yes
            ? "yes"
            : "socially";
    await userPreference.setStringValueInPrefs(
        key: UserPreference.smokingKey, value: value);

    await updateUserProfileFunction(
        key: AppMessages.smokingApiText, value: value.toLowerCase().trim());
  }

  /// Set Kids Modules
  Future<void> setKidsFunction(MoreAboutMe selectedValue) async {
    String value = selectedValue == MoreAboutMe.no
        ? "no"
        : selectedValue == MoreAboutMe.yes
            ? "yes"
            : "want someday";
    await userPreference.setStringValueInPrefs(
        key: UserPreference.kidsKey, value: value);
    await updateUserProfileFunction(
        key: AppMessages.kidsApiText, value: value.toLowerCase().trim());
  }

  /// User Profile Update API Integrate
  Future<void> updateUserProfileFunction(
      {required String key, required String value}) async {
    String url = ApiUrl.completeSignUpApi;
    log('Update User Profile Api Url : $url');

    try {
      String verifyToken = await userPreference.getStringFromPrefs(
          key: UserPreference.userVerifyTokenKey);
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['token'] = AppMessages.token;
      request.fields[key] = value;

      log('Request Field : ${request.fields}');
      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value1) async {
        log('value : $value1');
        CompleteSignupModel completeSignupModel =
            CompleteSignupModel.fromJson(json.decode(value1));
        successStatus.value = completeSignupModel.statusCode;

        if (successStatus.value == 200) {
          log('Update User Profile Success : $key & $value');
        } else {
          log('updateUserProfileFunction Else');
        }
      });
    } catch (e) {
      log('updateUserProfileFunction Error :$e');
      rethrow;
    }
  }

  /// Get User Profile From API
  Future<void> getUserDetailsFunction() async {
    isLoading(true);
    String url = ApiUrl.getLoggedInUserProfileApi;
    log('getUserDetailsFunction Api Url : $url');

    try {
      // String verifyToken = await userPreference.getStringFromPrefs(key: UserPreference.userVerifyTokenKey);
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['token'] = "96e8451a018e5558d9af7979302cc85b";

      var response = await request.send();
      response.stream.transform(utf8.decoder).listen((value) async {
        log("value :$value");

        LoggedInUserDetailsModel loggedInUserDetailsModel =
        LoggedInUserDetailsModel.fromJson(json.decode(value));
        successStatus.value = loggedInUserDetailsModel.statusCode;

        if (successStatus.value == 200) {
          userDetails = loggedInUserDetailsModel.msg[0];

          /// Set User Network Images
          for (var value in userDetails!.images) {
            captureImageList.add(
                UploadUserImage(imageUrl: value.imageUrl, isImageFromNetwork: true));
          }

          /// Set User Interest
          for (var value in userDetails!.interest) {
            interestList.add(value.name);
          }
          profilePromptsController.text = userDetails!.profilePrompts!;
          myBioController.text = userDetails!.bio;
          endVal.value = double.parse(userDetails!.basic.height);
          getAndSetExerciseValue(); // Getting from mobile screen
          getAndSetDrinkingValue();
          getAndSetSmokingValue();
          getAndSetKidsValue();
          await setUserImagesInPrefs();

          // userName.value = loggedInUserDetailsModel.msg[0].name;
          // userProfilePrompts.value =
          // loggedInUserDetailsModel.msg[0].profilePrompts!;
          // userBio.value = loggedInUserDetailsModel.msg[0].bio;
          // userVerified.value = loggedInUserDetailsModel.msg[0].verified;
          // userHomeTown.value = loggedInUserDetailsModel.msg[0].homeTown;
          // userDistance.value = loggedInUserDetailsModel.msg[0].distance;
          // userAge.value = loggedInUserDetailsModel.msg[0].age;
          // userActiveTime.value = loggedInUserDetailsModel.msg[0].activeTime;
          // userGender.value = loggedInUserDetailsModel.msg[0].basic.gender;
          // userWork.value = loggedInUserDetailsModel.msg[0].basic.work;
          // userEducation.value = loggedInUserDetailsModel.msg[0].basic.education;
          // userHeight.value = loggedInUserDetailsModel.msg[0].basic.height;
          // userExercise.value = loggedInUserDetailsModel.msg[0].basic.exercise;
          // userSmoking.value = loggedInUserDetailsModel.msg[0].basic.smoking;
          // userDrinking.value = loggedInUserDetailsModel.msg[0].basic.drinking;
          // userPolitics.value = loggedInUserDetailsModel.msg[0].basic.politics;
          // userReligion.value = loggedInUserDetailsModel.msg[0].basic.religion;
          // userKids.value = loggedInUserDetailsModel.msg[0].basic.kids;

          // setBasicListFunction();
          // await setInterestListFunction(
          //     loggedInUserDetailsModel.msg[0].interest);
          //
          // /// Set User Images in local list
          // for (var element in loggedInUserDetailsModel.msg[0].images) {
          //   userImages.add(element.imageUrl);
          // }
          // log('userImages Length : ${userImages.length}');
          //
          // await setLoggedInUserDetailsInPrefs(loggedInUserDetailsModel.msg[0]);
        } else {
          log('getUserDetailsFunction Else');
        }
      });
    } catch (e) {
      log('getUserDetailsFunction Error :$e');
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
    await getUserDetailsFunction();
  }

  /// Set Value in local variables to use change values
  void getAndSetExerciseValue() {
    exerciseValue = userDetails!.basic.exercise == "no"
        ? MoreAboutMe.no
        : userDetails!.basic.exercise == "yes"
            ? MoreAboutMe.yes
            : MoreAboutMe.sometimes;
  }

  void getAndSetDrinkingValue() {
    drinkingValue = userDetails!.basic.drinking == "no"
        ? MoreAboutMe.no
        : userDetails!.basic.drinking == "yes"
            ? MoreAboutMe.yes
            : MoreAboutMe.sometimes;
  }

  void getAndSetSmokingValue() {
    smokingValue = userDetails!.basic.smoking == "no"
        ? MoreAboutMe.no
        : userDetails!.basic.smoking == "yes"
            ? MoreAboutMe.yes
            : MoreAboutMe.sometimes;
  }

  void getAndSetKidsValue() {
    kidsValue = userDetails!.basic.kids == "no"
        ? MoreAboutMe.no
        : userDetails!.basic.kids == "yes"
            ? MoreAboutMe.yes
            : MoreAboutMe.sometimes;
  }

  Future<void> setUserImagesInPrefs() async {
    List<String> tempList = [];

    for (var value in captureImageList) {
      Map<String, dynamic> singleData = {
        "image": value.imageUrl,
        "isImageFromNetwork": value.isImageFromNetwork
      };

      /// Convert single data in json format & store in list string format
      tempList.add(jsonEncode(singleData).toString());
    }
    await userPreference.setListOfStringInPrefs(value: tempList);
    log('tempList : $tempList');
    /*for(var value in tempList) {
      UploadUserImage uploadUserImage = UploadUserImage.fromJson(json.decode(value));
    }*/
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }


  // Future<void> setDataInUserModelClassFunction() async {
  //   profileScreenController.isLoading(true);
  //   profileScreenController.userProfilePrompts.value = await userPreference.getStringFromPrefs(key: UserPreference.profilePromptsKey);
  //   log("profileScreenController.userDetails!.profilePrompts: ${profileScreenController.userDetails!.profilePrompts}");
  //   profileScreenController.userDetails!.bio = await userPreference.getStringFromPrefs(key: UserPreference.bioKey);
  //   log("profileScreenController.userDetails!.bio: ${profileScreenController.userDetails!.bio}");
  //   profileScreenController.isLoading(false);
  //
  //
  // }


}
