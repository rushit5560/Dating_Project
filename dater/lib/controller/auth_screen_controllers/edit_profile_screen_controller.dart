
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreenController extends GetxController {
  RxBool isLoading = false.obs;
  final ImagePicker imagePicker = ImagePicker();
/*  var  imagePath1 = ''.obs;
  var  imagePath2 = ''.obs;
  var  imagePath3 = ''.obs;
  var  imagePath4 = ''.obs;
  var  imagePath5 = ''.obs;
  var  imagePath6 = ''.obs;*/

  RxList<File> captureImageList = RxList<File>();
  RxDouble startVal = 00.0.obs;
  RxDouble endVal = 80.0.obs;
  File? file;

  RxBool onSelected = false.obs;
  //exercise value
  RxBool exerciseNoSelected = false.obs;
  RxBool exerciseSometimesSelected = false.obs;
  RxBool exerciseYesSelected = false.obs;
  //drinking value
  RxBool drinkingNoSelected = false.obs;
  RxBool exerciseSociallySelected = false.obs;
  RxBool drinkingYesSelected = false.obs;
  //Smoking value
  RxBool smokingNoSelected = false.obs;
  RxBool smokingSociallySelected = false.obs;
  RxBool smokingYesSelected = false.obs;
//kids value
  RxBool kidsgNoSelected = false.obs;
  RxBool kidsSociallySelected = false.obs;
  RxBool kidsYesSelected = false.obs;
  getImageFromGallery() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      captureImageList.add(File(pickedFile.path));
    }
    log('captureImageList Length : ${captureImageList.length}');
    isLoading(true);
    isLoading(false);
    // for (int i = 0; i < selectedImages.length; i++) {
    //   File file = File(selectedImages[i].path);
    //   // captureImageList.add(file);
    // }
  }
}


