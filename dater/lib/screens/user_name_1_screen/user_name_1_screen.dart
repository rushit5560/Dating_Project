import 'package:dater/constants/messages.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../comman_modules/custom_appbar.dart';
import '../../controller/user_name_1_screen_controller.dart';

class UserName1Screen extends StatelessWidget {
  const UserName1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //appBar: commonAppBarModule(text: AppMessages.whatsyourinterests),
      body: Column(
        children: [
          SizedBox(height: 6.h,),
          InterestsWidgetsModule(),
        ],
      ),
    );
  }
}
