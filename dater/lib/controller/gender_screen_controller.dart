import 'package:get/get.dart';

class GenderScreenController extends GetxController {
  final List<String> gender = [
    "Female",
    "Male",
    "Non-Binary",
  ];
  RxString selectedval = "Female".obs;
}
