import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../comman_modules/custom_appbar.dart';
import '../../../constants/messages.dart';
import 'my_number_inner_screen_widgets.dart';
class MyNumberInnerScreen extends StatelessWidget {
  const MyNumberInnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBarModule(text: AppMessages.myNumberIs),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CountryDropDownModule(),
            SizedBox(height: 4.h,),
            ContinueModule(),
          ],
        ),
      ),
    );
  }
}
