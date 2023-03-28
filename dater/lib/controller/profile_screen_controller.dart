import 'dart:async';

import 'package:get/get.dart';
class ProfileScreenController extends GetxController{
  double progressValue = 40;
  getTimer(){
    Timer(
      const Duration(milliseconds: 100),
          (){

          },
    );
  }
  void onInit() {
    // getTimer();
    super.onInit();
  }
}