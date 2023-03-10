import 'package:dater/screens/location_screen/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'screens/user_name_1_screen/user_name_1_screen.dart';
import 'screens/username_screen/user_name_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return  GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dating App',
          home: UserName1Screen(),
        );
      },
    );
  }
}
