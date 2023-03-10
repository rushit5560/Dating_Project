import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DobSelectScreenController extends GetxController {

  RxString dobString = "DD  -  MM  -  YYYY".obs;
  DateTime tempDobString = DateTime.now();

  setDobInStringFunction() {
    dobString.value = DateFormat("dd-MM-yyyy").format(tempDobString);
    Get.back();
  }

}