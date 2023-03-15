import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';
import '../constants/font_family.dart';
import '../utils/style.dart';
import 'custom_button.dart';

class CustomAlertDialog extends StatelessWidget {
   String text;
   String content;
   String value;
   String groupValue;
   String buttonText;
   Function() onPressed;
   String radioButtonText;
   Function(String?)? onChanged;
   Color? activeColor;
   EdgeInsetsGeometry? titlePadding;
   EdgeInsetsGeometry? contentPadding;
   CustomAlertDialog({
     Key? key,
    required this.text,
    required this.content,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.onPressed,
    required this.buttonText,
    required this.activeColor,
    required this.radioButtonText,
     this.titlePadding,
     this.contentPadding,
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      titlePadding: titlePadding,
      title: Text(text,
          style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplayRegular,
            textColor: AppColors.blackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
      ),
      contentPadding: contentPadding,
      content: Text(content,
        style: TextStyleConfig.textStyle(
          fontFamily: FontFamilyText.sFProDisplayRegular,
          textColor: AppColors.grey500Color,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        const Divider(
          thickness: 2,
        ),
        ButtonCustom(
        text: buttonText,
        onPressed:onPressed,
        fontWeight: FontWeight.bold,
        textsize: 14.sp,
        textFontFamily: FontFamilyText.sFProDisplayHeavy,
        textColor: AppColors.whiteColor2,
        backgroundColor: AppColors.darkOrangeColor,
          ).commonSymmetricPadding(horizontal: 35),
        Row(
          children: [
            Radio(
                activeColor: activeColor,
                value: value, groupValue: groupValue, onChanged: onChanged),
            Text(radioButtonText) ,
        ]),
      ],
    );
  }
}


class CustomAlertDialogWithoutRadioButton extends StatelessWidget {
  String text;
  String content;
  String value;
  String groupValue;
  String buttonText;
  Function() onPressed;
  Function(String?)? onChanged;
  Color? activeColor;
  EdgeInsetsGeometry? titlePadding;
  EdgeInsetsGeometry? contentPadding;
  CustomAlertDialogWithoutRadioButton({
    Key? key,
    required this.text,
    required this.content,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.onPressed,
    required this.buttonText,
    required this.activeColor,
    this.titlePadding,
    this.contentPadding,
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      titlePadding: titlePadding,
      title: Text(text,
        style: TextStyleConfig.textStyle(
          fontFamily: FontFamilyText.sFProDisplayRegular,
          textColor: AppColors.blackColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      contentPadding: contentPadding,
      content: Text(content,
        style: TextStyleConfig.textStyle(
          fontFamily: FontFamilyText.sFProDisplayRegular,
          textColor: AppColors.grey500Color,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        const Divider(
          thickness: 2,
        ),
        ButtonCustom(
          text: buttonText,
          onPressed:onPressed,
          fontWeight: FontWeight.bold,
          textsize: 14.sp,
          textFontFamily: FontFamilyText.sFProDisplayHeavy,
          textColor: AppColors.whiteColor2,
          backgroundColor: AppColors.darkOrangeColor,
        ).commonSymmetricPadding(horizontal: 35),
      ],
    );
  }
}

