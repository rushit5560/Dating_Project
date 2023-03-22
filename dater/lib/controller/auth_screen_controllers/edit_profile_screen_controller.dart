import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreenController extends GetxController{
  RxBool isLoading = false.obs;
  final ImagePicker picker = ImagePicker();
/*  var  imagePath1 = ''.obs;
  var  imagePath2 = ''.obs;
  var  imagePath3 = ''.obs;
  var  imagePath4 = ''.obs;
  var  imagePath5 = ''.obs;
  var  imagePath6 = ''.obs;*/
  File imagePath1 = File("");
  File imagePath2 = File("");
  File imagePath3 = File("");
  File imagePath4 = File("");
  File imagePath5 = File("");
  File imagePath6 = File("");
  pickImageFromGallery(int index) async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        if(index == 0){
          imagePath1 = File(pickedFile.path);
          log('image1 : ${imagePath1.path}');
        }
        else if(index == 1){
          imagePath2 = File(pickedFile.path);
        }
        else if (index == 2){
          imagePath3 = File(pickedFile.path);
        }
        else if (index == 3){
          imagePath4 = File(pickedFile.path);
        }
        else if (index == 4) {
          imagePath5 = File(pickedFile.path);
        }
        else if (index == 5){
          imagePath6 = File(pickedFile.path);

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