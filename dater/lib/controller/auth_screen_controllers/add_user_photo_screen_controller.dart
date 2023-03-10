import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddUserPhotoScreenController extends GetxController {
  RxBool isLoading = false.obs;

  final ImagePicker picker = ImagePicker();
  File image1 = File("");
  File image2 = File("");
  File image3 = File("");



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


}