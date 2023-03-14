import 'package:dater/constants/app_images.dart';
import 'package:get/get.dart';
import 'package:swipable_stack/swipable_stack.dart';
class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  SwipableStackController cardController =
      SwipableStackController();

  List<String> images = [
    AppImages.swiper1Image,
    AppImages.swiper2Image,
    AppImages.swiper1Image,
    AppImages.swiper2Image,
  ];
}
