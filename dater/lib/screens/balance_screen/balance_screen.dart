import 'package:dater/constants/colors.dart';
import 'package:dater/controller/auth_screen_controllers/balance_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'balance_screen_widgets.dart';

class BalanceScreen extends StatelessWidget {
   BalanceScreen({super.key});
  final balanceScreenController = Get.put(BalanceScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.whiteColor2,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children:  [
              WidgetsBalanceModule(),
            ],
          ),
        ),
      ),
      //  bottomNavigationBar:  BottomNavigationBarModule(),
    );
  }
}