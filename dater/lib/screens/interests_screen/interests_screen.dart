import 'package:dater/constants/colors.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/screens/interests_screen/interests_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../comman_modules/custom_appbar.dart';
import '../../controller/interests_screen_controller.dart';
import '../location_screen/location_screen_widgets.dart';

class InterestsScreen extends StatelessWidget {
  const InterestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.grey200Color,
      body: Column(
        children: [
          SizedBox(height: 3.h,),
          CreativeWidgetsModule(),
        ],
      ),
    );
  }
}
