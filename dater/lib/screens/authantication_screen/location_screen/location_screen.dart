import 'package:dater/constants/messages.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../comman_modules/custom_appbar.dart';
import '../../../comman_modules/custom_button.dart';
import '../../../constants/colors.dart';
import '../../../controller/auth_screen_controllers/location_screen_controller.dart';
import '../username_screen/username_screen.dart';
import 'location_screen_widgets.dart';

class LocationScreen extends StatelessWidget {
   LocationScreen({Key? key}) : super(key: key);
  final locationScreenController = Get.put(LocationScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor2,

      appBar: commonAppBarModule(text: AppMessages.location),
      bottomNavigationBar:
      ButtonCustom(
        backgroundColor: AppColors.darkOrangeColor,
          text:AppMessages.confirm,
          fontWeight: FontWeight.bold,
          textsize: 14.sp,
          textColor: AppColors.gray50Color,
          onPressed: () {Get.to(UserNameScreen());},
        shadowColor: AppColors.grey900Color).commonSymmetricPadding(horizontal: 25,vertical: 30),
      body: SafeArea(
        child: Column(
          children: [
             SearchTextfiledModule().commonSymmetricPadding(horizontal: 20),
            SizedBox(height: 3.h,),
             CountryListViewModule(),
          ],
        ),
      ),
    );
  }
}
