import 'package:dater/constants/colors.dart';
import 'package:dater/utils/style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonCustom extends StatelessWidget {
  final String text;
  Color textColor;
  FontWeight? fontWeight;
  double? textsize;
  Size? size;
  Function() onPressed;
  Color backgroundColor;

  ButtonCustom({
    Key? key,
    required this.text,
    this.textColor = AppColors.blackColor,
    this.fontWeight = FontWeight.normal,
    this.textsize = 12,
    this.backgroundColor = AppColors.whiteColor,
    this.size = const Size(150, 40),
    required this.onPressed,
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
      child: Text(
        text,
        style: TextStyleConfig.textStyle(
          textColor: textColor,
          fontWeight: fontWeight!,
          fontSize: textsize!,
        ),
      ),
    );
  }
}
