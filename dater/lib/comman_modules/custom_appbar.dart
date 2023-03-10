
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

PreferredSizeWidget commonAppBarModule(
  {required String text,
  Color iconColor = AppColors.lightOrangeColor,
  String textFontFamily = "SFProDisplayRegular",
  Color textColor = AppColors.grey800Color,
    Color backGroundColor = AppColors.gray50Color
  }) {
  return AppBar(
    backgroundColor: backGroundColor,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.west_outlined,
            color: iconColor,
          ),
        );
      },
    ),
    centerTitle: true,
    elevation: 0,
    title: Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontFamily: textFontFamily,
        fontSize: 23,
      ),
    ),
  );
}
