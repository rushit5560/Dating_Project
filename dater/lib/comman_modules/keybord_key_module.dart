import 'dart:developer';

import 'package:dater/constants/colors.dart';
import 'package:dater/utils/style.dart';
import 'package:flutter/material.dart';

class KeyBordKeyModule extends StatelessWidget {
  Function()? onTap;
  String text;
  final TextEditingController controller;

  KeyBordKeyModule({
    super.key,
    this.onTap,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          log("1111");
          if (controller.text.length < 4) {
            controller.text += text.toString();
            log("controller.text : ${controller.text}");
          }
        },
        child: Center(
          child: Text(
            text,
            style: TextStyleConfig.textStyle(
              textColor: AppColors.grey500Color,
              fontSize: 22,
              fontFamily: "",
            ),
          ),
        ),
      ),
    );
  }
}
