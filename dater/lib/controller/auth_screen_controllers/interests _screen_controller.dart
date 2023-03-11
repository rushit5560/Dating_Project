import 'package:dater/model/authantication_model/iinterests%20screen_model/get_interests%20_model.dart';
import 'package:get/get.dart';

class InterestsScreen1Controller extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<InterestsData> interestsData = [];

  Future<void> getInterestFunction() async {
    isLoading(true);
    try {} catch (e) {
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getInterestFunction();
    super.onInit();
  }
}
