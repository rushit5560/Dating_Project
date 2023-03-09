import 'package:dater/screens/sign_up_email_screen/sign_up_email_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignUpEmailScreen extends StatelessWidget {
  const SignUpEmailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       // appBar: AppBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const PosterImageModule(),
              SizedBox(height: 2.h,),
              const WhatsYourNameEmailModule(),
            ],
          ),
        ),
      ),
    );
  }
}
