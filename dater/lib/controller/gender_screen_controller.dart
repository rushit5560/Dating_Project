import 'package:get/get.dart';

class GenderScreenController extends GetxController {
  List<String> gender = [
    "Female",
    "Male",
    "Non-Binary",
  ];
  RxString selectedvalue = "Female".obs;
  // var selectedGender = "".obs;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
}
