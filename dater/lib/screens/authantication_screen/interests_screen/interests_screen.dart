import 'package:dater/constants/colors.dart';
import 'package:dater/screens/authantication_screen/interests_screen/interests_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class InterestsScreen extends StatelessWidget {
  const InterestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.grey200Color,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 2.h,),
            const CreativeWidgetsModule(),
           // SizedBox(height: 3.h,),
            SportsWidgetsModule(),
          ],
        ),
      ),
    );
  }
}
