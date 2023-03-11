import 'package:get/get.dart';

class IndexScreenController extends GetxController {
  RxInt currentPage = 0.obs;

  RxInt currentSelectedIndex = 0.obs;
  RxInt menuIndex = 2.obs;
}

/*
class IndexScreenController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}*/
