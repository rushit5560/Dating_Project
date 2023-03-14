import 'package:dater/constants/app_images.dart';
import 'package:dater/screens/authentication_screen/login_screen/login_screen_widgets.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginInScreen extends StatelessWidget {
  const LoginInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.signInBackgroundimage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SafeArea(
            child: const ColumnWidgets()
                .commonOnlyPadding(top: 5.h, right: 15, left: 15, bottom: 20),
          ),
        ],
      ),
    );
  }
}
