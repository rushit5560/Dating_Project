import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common_modules/custom_button.dart';
import '../../constants/colors.dart';
import '../../constants/font_family.dart';
import '../../controller/auth_screen_controllers/balance_screen_controller.dart';
import '../../utils/style.dart';
import '../earn_more_coins_screen/earn_more_coins_screen.dart';
import '../your_daily_rate_screen/your_daily_rate_screen.dart';

class WidgetsBalanceModule extends StatelessWidget {
   WidgetsBalanceModule({Key? key}) : super(key: key);
   final balanceScreenController = Get.find<BalanceScreenController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppMessages.yourBalance,
          style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplayRegular,
            textColor: AppColors.blackColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ).commonSymmetricPadding(vertical: 15),
        SizedBox(height: 7.h,),
        Text(AppMessages.coinsBalance,
          style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplayRegular,
            textColor: AppColors.blackColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ).commonSymmetricPadding(vertical: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              fit: BoxFit.cover,
                width: 12.h,
                image: const AssetImage(AppImages.balance2Image)),
            //Image.asset(AppImages.balance2Image),
            Text('0',
              style: TextStyleConfig.textStyle(
                fontFamily: FontFamilyText.sFProDisplayHeavy,
                textColor: AppColors.grey900Color,
                fontSize: 100.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h,),
        ButtonCustom(
          text: AppMessages.earnMoreCoins,
          onPressed: () {
            Get.to(EarnMoreCoinsScreen());
          },
          fontWeight: FontWeight.bold,
          textsize: 14.sp,
          textFontFamily: FontFamilyText.sFProDisplayHeavy,
          textColor: AppColors.whiteColor2,
          backgroundColor: AppColors.darkOrangeColor,
        ).commonSymmetricPadding(horizontal: 35),
        SizedBox(height: 5.h,),
        Text('Your daily rate of coins : 20',
          style: TextStyleConfig.textStyle(
            fontFamily: FontFamilyText.sFProDisplayRegular,
            textColor: AppColors.blackColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ).commonSymmetricPadding(vertical: 15),
        //SizedBox(height: 1.h,),
        ButtonCustom(
          size: const Size(40, 0),
          text:  AppMessages.learnMore,
          onPressed: () {Get.to( YourDailyRateScreen());},
          fontWeight: FontWeight.bold,
          textsize: 14.sp,
          textFontFamily: FontFamilyText.sFProDisplayHeavy,
          textColor: AppColors.whiteColor2,
          backgroundColor: AppColors.grey200Color,
        ).commonSymmetricPadding(horizontal: 30),
      ],
    );
  }
}
