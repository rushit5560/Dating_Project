import 'package:dater/constants/messages.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../comman_modules/custom_appbar.dart';
import '../../comman_modules/custom_button.dart';
import '../../constants/colors.dart';
import 'location_screen_widgets.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(text: AppMessages.location),
      bottomNavigationBar:
      ButtonCustom(
          text:AppMessages.confirm,
          textColor: AppColors.gray50Color,
          onPressed: () {Get.back();},
        shadowColor: AppColors.grey900Color).commonSymmetricPadding(horizontal: 10,vertical: 20),
      body: Column(
        children: [
          const SearchTextfiledModule(),
          SizedBox(height: 2.h,),
          const CountryListViewModule(),
        ],
      ),
    );
  }
}
