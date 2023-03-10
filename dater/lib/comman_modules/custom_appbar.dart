
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

PreferredSizeWidget commonAppBarModule(
  {required String text,
  Color iconColor = AppColors.lightOrangeColor,
  String textFontFamily = "SFProDisplayRegular",
  Color textColor = AppColors.grey800Color,
  }) {
  return AppBar(
    backgroundColor: AppColors.gray50Color,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.west_outlined,
            color: AppColors.lightOrangeColor,
          ),
        );
      },
    ),
    centerTitle: true,
    elevation: 0,
    title: Text(
      text,
      style: TextStyle(
        color: AppColors.grey800Color,
        fontWeight: FontWeight.bold,
        fontFamily: "SFProDisplayRegular",
        fontSize: 20.sp,
      ),
    ),
  );
}
