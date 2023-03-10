import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/utils/extensions.dart';
import 'package:dater/utils/style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonCustom extends StatelessWidget {
  final String text;
  Color shadowColor;
  Color textColor;
  FontWeight? fontWeight;
  double? textsize;

  Size? size;
  Function() onPressed;
  Color backgroundColor;
  String textFontFamily;

  ButtonCustom({
    Key? key,
    required this.text,
    this.textColor = AppColors.blackColor,
    this.fontWeight = FontWeight.normal,
    this.textsize = 12,
    this.backgroundColor = AppColors.whiteColor,
    this.size = const Size(150, 0),
    required this.onPressed,
    required this.shadowColor,
    this.textFontFamily = "SFProDisplayRegular",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: shadowColor,
        backgroundColor: backgroundColor,
        elevation: 6,
        minimumSize: size,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyleConfig.textStyle(
          textColor: textColor,
          fontWeight: fontWeight!,
          fontSize: textsize!,
          fontFamily: textFontFamily,
        ),
      ).commonSymmetricPadding(vertical: 12),
    );
  }
}

class ButtonCustomLoginAndSignUp extends StatelessWidget {
  final String text;
  Color textColor;
  FontWeight? fontWeight;
  double? textsize;
  Size? size;
  String textFontFamily;

  Function() onPressed;
  Color backgroundColor;
  String? image;

  ButtonCustomLoginAndSignUp({
    Key? key,
    required this.text,
    this.textColor = AppColors.blackColor,
    this.fontWeight = FontWeight.normal,
    this.textFontFamily = "SFProDisplayRegular",
    this.textsize = 12,
    this.backgroundColor = AppColors.whiteColor,
    this.size = const Size(double.infinity, 0),
    required this.onPressed,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: size,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 25,
            width: 25,
            child: Image.asset("$image"),
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyleConfig.textStyle(
              textColor: textColor,
              fontWeight: fontWeight!,
              fontSize: textsize!,
              fontFamily: textFontFamily,
            ),
          ),
        ],
      ).commonSymmetricPadding(vertical: 12),
    );
  }
}
