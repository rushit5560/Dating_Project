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

class TextFormFiledModule extends StatefulWidget {
  const TextFormFiledModule({Key? key}) : super(key: key);

  @override
  State<TextFormFiledModule> createState() => _CountryDropDownModuleState();
}

class _CountryDropDownModuleState extends State<TextFormFiledModule> {
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
                      textColor: AppColors.grey800Color),
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
                textColor: AppColors.grey500Color),
            decoration: InputDecoration(
              labelText: AppMessages.phoneNumber,
            ),
          ),
        ).commonOnlyPadding(right: 2.w),
      ),
    ]);
  }
}

class TextCustomModule extends StatelessWidget {
  const TextCustomModule({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: AppMessages.myNumberScreenInformationText,
        style: TextStyleConfig.textStyle(
            fontFamily: "SFProDisplayRegular",
            textColor: AppColors.grey600Color,
            fontSize: 13.sp),
      ),
    );
  }
}
