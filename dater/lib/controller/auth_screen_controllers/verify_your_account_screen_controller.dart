import 'dart:developer';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

class VerifyYourAccountScreenController extends GetxController{
  RxBool isLoading = false.obs;
  final ImagePicker picker = ImagePicker();
  var  imagePath = ''.obs;
  pickImageFromGallery(ImageSource imageSource) async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(source: imageSource);
      if (pickedFile != null) {
        imagePath.value = pickedFile.path;
      }
    } catch(e) {
      log('');
      rethrow;
    }
    isLoading(true);
    isLoading(false);
  }
}