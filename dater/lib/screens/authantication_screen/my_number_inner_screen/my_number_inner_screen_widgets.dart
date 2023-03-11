import 'package:dater/controller/auth_screen_controllers/my_number_inner_screen_controller.dart';
import 'package:dater/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../../constants/messages.dart';

class TextFormFiledModule extends StatelessWidget {
  TextFormFiledModule({Key? key}) : super(key: key);

  final myNumberInnerScreenController =
      Get.find<MyNumberInnerScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Obx(
        () => SizedBox(
          height: 3.8.h,
          width: 22.w,
          child: DropdownButton<String>(
            isDense: true,
            value: myNumberInnerScreenController.dropdownvalue.value,
            alignment: Alignment.center,
            items: myNumberInnerScreenController.country
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 15,
                        ),
                      ),
                    ))
                .toList(),
            onChanged: (val) {
              myNumberInnerScreenController.isLoading(true);
              myNumberInnerScreenController.dropdownvalue.value = val!;
              myNumberInnerScreenController.isLoading(false);
            },
          ),
        ),
      ),
      Form(
        key: myNumberInnerScreenController.formKey,
        child: Expanded(
          child: SizedBox(
            child: TextFormField(
              cursorColor: AppColors.darkOrangeColor,
              controller: myNumberInnerScreenController.phoneNumberController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.darkOrange1Color),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.darkOrange1Color),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.darkOrange1Color),
                ),
                isDense: true,
                hintText: AppMessages.phoneNumber,
                hintStyle: TextStyle(
                  color: AppColors.grey500Color,
                  fontSize: 12.sp,
                  fontFamily: "SFProDisplayRegular",
                ),
              ),
            ),
          ),
        ),
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
          fontSize: 13.sp,
        ),
      ),
    );
  }
}
