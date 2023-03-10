import 'dart:developer';

import 'package:dater/screens/authantication_screen/sign_up_email_screen/sign_up_email_screen.dart';
import 'package:dater/utils/extensions.dart';
import 'package:dater/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../comman_modules/custom_button.dart';
import '../../../constants/colors.dart';
import '../../../constants/messages.dart';

class CountryDropDownModule extends StatefulWidget {
  const CountryDropDownModule({Key? key}) : super(key: key);

  @override
  State<CountryDropDownModule> createState() => _CountryDropDownModuleState();
}

class _CountryDropDownModuleState extends State<CountryDropDownModule> {
  String dropdownvalue = 'In +91';
  var country = [
    'In +91',
    'Pk +92',
    'Pu +02',
  ];
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 2,
        child: Container(
          height: 4.h,
          //margin: const EdgeInsets.all(10),
          // padding: EdgeInsets.all(2),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: DropdownButton(
            value: dropdownvalue,
            items: country.map((String country) {
              return DropdownMenuItem(
                value: country,
                child: Text(
                  country,
                  style: TextStyleConfig.textStyle(
                    fontFamily: "SFProDisplayRegular",
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                dropdownvalue = value!;
              });
            },
          ).commonOnlyPadding(left: 2.w, right: 12.w),
        ),
      ),
      Expanded(
        flex: 3,
        child: SizedBox(
          height: 4.h,
          child: TextFormField(
            style: TextStyleConfig.textStyle(
                fontFamily: "SFProDisplayRegular",
                textColor: AppColors.grey800Color),
            decoration: InputDecoration(
              labelText: AppMessages.phoneNumber,
            ),
          ),
        ).commonOnlyPadding(right: 2.w),
      ),
    ]);
  }
}

class ContinueModule extends StatelessWidget {
  const ContinueModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('''When you tap "Continue", Gather will send you''')
      ]),
      SizedBox(
        height: 20.h,
      ),
      ButtonCustom(
        size: const Size(double.infinity, 50),
        backgroundColor: AppColors.lightOrangeColor,
        shadowColor: Colors.blueGrey,
        text: AppMessages.continueButton,
        textColor: AppColors.gray50Color,
        fontWeight: FontWeight.bold,
        textsize: 14.sp,
        onPressed: () {
          Get.to(() => SignUpEmailScreen());
        },
      ),
      // SizedBox(
      //   height: 20.h,
      // ),
      // const Text('Do you have a referral number from a friend?'),
      // ButtonCustom(
      //   //size: Size(double.infinity, 50),
      //   backgroundColor: AppColors.whiteColor,
      //   shadowColor: Colors.white,
      //   text: '\$123456',
      //   textColor: AppColors.grey700Color,
      //   fontWeight: FontWeight.bold,
      //   textsize: 14.sp,
      //   onPressed: () {
      //     log('message1');
      //   },
      // ),
    ]).commonOnlyPadding(left: 5.w, right: 5.w);
  }
}
