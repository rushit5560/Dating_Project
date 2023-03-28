import 'package:get/get.dart';

class FavoriteScreenController extends GetxController {
  var selected = "sdsd".obs;
  RxBool isloading = true.obs;
  change(value) {
    selected.value = value;
  }
}
