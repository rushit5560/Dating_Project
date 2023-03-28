import 'dart:developer';

import 'package:dater/constants/colors.dart';
import 'package:dater/constants/font_family.dart';
import 'package:dater/controller/favorite_screen_controller.dart';
import 'package:dater/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common_modules/custom_alertdialog.dart';
import '../../constants/app_images.dart';
import '../../utils/style.dart';

class FavoriteGridViewBuilderModule extends StatelessWidget {
  FavoriteGridViewBuilderModule({Key? key}) : super(key: key);
  final favoriteScreenController = Get.find<FavoriteScreenController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 19,
            mainAxisSpacing: 19,
            crossAxisCount: 2,
            childAspectRatio: 0.8),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Obx(
                    () => CustomAlertDialog(
                      text: 'See who likes you',
                      content: 'Every profile will cost 1 coin',
                      buttonText: 'UnderStand',
                      value: "1",
                      groupValue: favoriteScreenController.selected.value,
                      onPressed: () {
                        Get.to(HomeScreen());
                      },
                      onChanged: (value) {
                        log("value 111 : $value");
                        favoriteScreenController.isloading(true);
                        // favoriteScreenController.change(index)
                        favoriteScreenController.selected.value = value!;
                        favoriteScreenController.isloading(false);
                        log("value 222 : $value");
                      },
                      activeColor: AppColors.darkOrangeColor,
                      radioButtonText: "don't show again",
                    ),
                  );
                }),
            child: Container(
              // height: 30.h,
              decoration: const BoxDecoration(
                  color: AppColors.whiteColor2,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [BoxShadow(blurRadius: 1)]),
              child: Column(
                children: [
                  Container(
                    height: 22.h,
                    decoration: const BoxDecoration(
                      color: AppColors.whiteColor2,
                      image: DecorationImage(
                        image: AssetImage(AppImages.swiper2Image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    AnimatedContainer(
                      width: 2.8.w,
                      height: 1.5.h,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      duration: const Duration(seconds: 0),
                      //curve: Curves.bounceIn,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      'Recently active',
                      //textAlign: TextAlign.right,
                      style: TextStyleConfig.textStyle(
                        textColor: AppColors.grey800Color,
                        fontSize: 12.sp,
                        fontFamily: FontFamilyText.sFProDisplaySemibold,
                        // fontWeight: FontWeight.normal,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
