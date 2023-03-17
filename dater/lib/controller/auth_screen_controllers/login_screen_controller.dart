import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../utils/preferences/signup_preference.dart';

class LoginInScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isUserFirstTime = true.obs;
  SignUpPreference signUpPreference = SignUpPreference();




  Future<void> getUserFirstTimeOrNot() async {
    isLoading(true);
    isUserFirstTime.value = await signUpPreference.getBoolFromPrefs(key: SignUpPreference.isUserFirstTimeKey);
    // isUserFirstTime.value = false;
    isLoading(false);
    handleLocationPermission();
  }


  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text('Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text('Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }


    return true;
  }

  @override
  void onInit() {

    getUserFirstTimeOrNot();
    super.onInit();
  }

}