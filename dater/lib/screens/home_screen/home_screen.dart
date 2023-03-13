import 'package:dater/controller/home_screen_controller.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/app_images.dart';
import 'home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 2.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImages.refreshImage),
                Image.asset(AppImages.hardImage),
                Image.asset(AppImages.menuImage),
              ],
            ),
           SizedBox(height: 2.h,),
            CardSwipeModule(),
          ],
        ).commonSymmetricPadding(horizontal: 30),
      ),
    );
  }
}
