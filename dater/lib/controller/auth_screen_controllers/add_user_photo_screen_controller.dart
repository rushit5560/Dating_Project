import 'dart:developer';
import 'dart:io';

import 'package:dater/screens/authentication_screen/dob_select_screen/dob_select_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/preferences/signup_preference.dart';

class AddUserPhotoScreenController extends GetxController {
  RxBool isLoading = false.obs;

  final ImagePicker picker = ImagePicker();
  File image1 = File("");
  File image2 = File("");
  File image3 = File("");

  SignUpPreference signUpPreference = SignUpPreference();

  pickImageFromGallery(int index) async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        if(index == 0) {
          image1 = File(pickedFile.path);
          log('image1 : ${image1.path}');
        } else if(index == 1) {
          image2 = File(pickedFile.path);
        } else if(index == 2) {
          image3 = File(pickedFile.path);
        }
      }
    } catch(e) {
      log('');
      rethrow;
    }
    isLoading(true);
    isLoading(false);

  }

  Future<void> doneButtonFunction() async {
    if(image1.path.isEmpty && image2.path.isEmpty && image3.path.isEmpty) {
      Fluttertoast.showToast(msg: "Please select at least one photo");
    } else {
      if(image1.path != "") {
        await signUpPreference.setStringValueInPrefs(
          key: SignUpPreference.userImage1Key,
          value: image1.path.toString(),
        );
      }
      if(image2.path != "") {
        await signUpPreference.setStringValueInPrefs(
          key: SignUpPreference.userImage2Key,
          value: image2.path.toString(),
        );
      }
      if(image3.path != "") {
        await signUpPreference.setStringValueInPrefs(
          key: SignUpPreference.userImage3Key,
          value: image3.path.toString(),
        );
      }

      Get.to(() => DobSelectScreen());
    }
  }

}