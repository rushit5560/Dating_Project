import 'package:get/get.dart';

class GoalSelectScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxString selectedvalue = "Female".obs;
  List<String> gender = [
    "Female",
    "Male",
    "Non-Binary",
  ];
// var selectedGender = "".obs;
}
