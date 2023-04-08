import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../constants/api_url.dart';
import '../constants/enums.dart';
import '../constants/messages.dart';
import '../model/authentication_model/add_user_photo_screen_model/user_photo_upload_screen.dart';
import '../utils/preferences/user_preference.dart';

class EditProfileScreenController extends GetxController {
  RxBool isLoading = false.obs;
  final ImagePicker imagePicker = ImagePicker();

  MoreAboutMe exerciseValue = MoreAboutMe.no;
  MoreAboutMe drinkingValue = MoreAboutMe.no;
  MoreAboutMe smokingValue = MoreAboutMe.no;
  MoreAboutMe kidsValue = MoreAboutMe.no;

  UserPreference userPreference = UserPreference();

  RxList<File> captureImageList = RxList<File>();
  RxDouble startVal = 00.0.obs;
  RxDouble endVal = 80.0.obs;
  File? file;

  RxBool onSelected = false.obs;

  // Image Select From Gallery
  getImageFromGallery() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      captureImageList.add(File(pickedFile.path));
      File selectedFile = File(pickedFile.path);
      await uploadImageFunction(selectedFile);
    }
    log('captureImageList Length : ${captureImageList.length}');
    isLoading(true);
    isLoading(false);
    // for (int i = 0; i < selectedImages.length; i++) {
    //   File file = File(selectedImages[i].path);
    //   // captureImageList.add(file);
    // }
  }

  // Upload Image function
  Future<void> uploadImageFunction(File image) async {
    isLoading(true);
    String url = ApiUrl.uploadPhotoApi;
    try {
      String verifyToken = await userPreference.getStringFromPrefs(key: UserPreference.userVerifyTokenKey);

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
        UserPhotoUploadModel userPhotoUploadModel = UserPhotoUploadModel.fromJson(json.decode(value));

        if(userPhotoUploadModel.statusCode == 200) {
          Fluttertoast.showToast(msg: userPhotoUploadModel.msg);
        } else if(userPhotoUploadModel.statusCode == 400) {
          Fluttertoast.showToast(msg: userPhotoUploadModel.msg);
        } else {
          Fluttertoast.showToast(msg: AppMessages.apiCallWrong);
        }
      });


    } catch(e) {
      log('uploadImageFunction Error :$e');
      rethrow;
    }
  }

  // Delete User Image Function
  Future<void> deleteUserImageFunction(int i) async {
    captureImageList.removeAt(i);
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}


