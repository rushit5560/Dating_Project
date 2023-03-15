import 'package:get/get.dart';

class IndexScreenController extends GetxController {
  var selectedIndex = 0.obs;
  RxBool homeScreenShow = true.obs;
  changeIndex(int index) {
    selectedIndex.value = index;
  }
}
