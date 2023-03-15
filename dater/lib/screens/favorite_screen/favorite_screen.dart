import 'package:dater/common_modules/custom_button.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../constants/messages.dart';
import '../../utils/style.dart';
import 'favorite_screen_widgets.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey200Color,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 4.h,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ButtonCustom(
                backgroundColor: AppColors.lightOrangeColor,
                shadowColor: Colors.blueGrey,
                text: AppMessages.skipButton,
                textColor: AppColors.gray50Color,
                fontWeight: FontWeight.bold,
                size: const Size(150, 0),
                textsize: 14.sp,
                onPressed: () {
                  //Get.to(() => LocationScreen());
                },
              ),
            ]),
            SizedBox(
              height: 4.h,
            ),
            Text(
              'See people who have already liked you',
              style: TextStyleConfig.textStyle(
                textColor: AppColors.grey700Color,
                fontSize: 12.sp,
                fontFamily: "SFProDisplayBlack",
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            const FavoriteGridViewBuilderModule(),
          ],
        ).commonSymmetricPadding(horizontal: 20),
      ),
      // bottomNavigationBar: const BottomNavigationBarModule(),
    );
  }
}
