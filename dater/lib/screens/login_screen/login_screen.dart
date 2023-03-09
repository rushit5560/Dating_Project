import 'package:dater/comman_modules/custom_button.dart';
import 'package:dater/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginInScreen extends StatelessWidget {
  const LoginInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.splashScreenImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              width: Get.width,
              height: Get.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.corveColorImage),
                  fit: BoxFit.fill,
                  opacity: 0.8,
                ),
              ),
            ),
            Column(
              children: [
                ButtonCustom(
                  onPressed: () {},
                  text: '',
                  size: Size(double.infinity, 50),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
