import 'package:dater/constants/messages.dart';
import 'package:dater/screens/username_screen/user_name_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../comman_modules/custom_appbar.dart';
import '../../controller/user_name_screen_controller.dart';

class UserNameScreen extends StatelessWidget {
   UserNameScreen({Key? key}) : super(key: key);
  final userNameScreenController = Get.put(UserNameScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
