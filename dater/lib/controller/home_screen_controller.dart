import 'dart:async';
import 'dart:developer';

import 'package:dater/constants/app_images.dart';
import 'package:dater/screens/location_permission_sreen/location_permission%20screen.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:swipable_stack/swipable_stack.dart';

class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  SwipableStackController cardController = SwipableStackController();
  RxBool selected = false.obs;

  List<String> images = [
    AppImages.swiper1Image,
    AppImages.swiper2Image,
    AppImages.swiper1Image,
    AppImages.swiper2Image,
  ];
  fatchmobileLocation() async {
    Location location = Location();

    bool _serviceEnabled;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      log("111");
      Get.to(() => LocationPermissionScreen());

      if (!_serviceEnabled) {
        return;
      }
    }
  }

  getLocation() async {
    log("getLocation");
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        // ignore: void_checks
        // isLoading(true);
        fatchmobileLocation();
        // isLoading(false);
      },
    );
  }

  @override
  void onInit() {
    getLocation();
    super.onInit();
  }
}
