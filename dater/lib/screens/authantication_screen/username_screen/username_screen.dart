import 'package:dater/constants/colors.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/screens/authantication_screen/username_screen/username_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../comman_modules/custom_appbar.dart';
import '../../../controller/auth_screen_controllers/user_name_screen_controller.dart';

class UserNameScreen extends StatelessWidget {
   UserNameScreen({Key? key}) : super(key: key);
  final userNameScreenController = Get.put(UserNameScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor2,

      appBar: commonAppBarModule(text: AppMessages.userName),
      body: SafeArea(
        child: Column(
          children: [
            SignUpNameScreenWidgets(),
          ],
        ),
      ),
    );
  }
}