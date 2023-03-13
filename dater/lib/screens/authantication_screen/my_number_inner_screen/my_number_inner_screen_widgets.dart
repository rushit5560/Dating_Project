import 'package:dater/controller/auth_screen_controllers/my_number_inner_screen_controller.dart';
import 'package:dater/utils/extensions.dart';
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
    return Row(
      children: [
        Expanded(
          flex: 20,
          child: Obx(
            () => DropdownButton<String>(
              value: myNumberInnerScreenController.dropdownvalue.value,
              // alignment: Alignment.center,
              items: myNumberInnerScreenController.country
                  .map(
                    (item) => DropdownMenuItem<String>(
                      enabled: true,
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 16,
                          color: AppColors.grey800Color,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (val) {
                myNumberInnerScreenController.isLoading(true);
                myNumberInnerScreenController.dropdownvalue.value = val!;
                myNumberInnerScreenController.isLoading(false);
              },
            ),
          ),
        ),
        // ),
        const Expanded(flex: 5, child: SizedBox()),
        Expanded(
          flex: 75,
          child: Form(
            key: myNumberInnerScreenController.formKey,
            child: TextFormField(
              cursorColor: AppColors.darkOrangeColor,
              controller: myNumberInnerScreenController.phoneNumberController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.darkOrangeColor),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey500Color),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.darkOrangeColor),
                ),
                isDense: true,
                hintText: AppMessages.phoneNumber,
                hintStyle: const TextStyle(
                  color: AppColors.grey500Color,
                  fontSize: 14,
                  fontFamily: "SFProDisplayRegular",
                ),
              ),
            ),
          ),
        ),
      ],
    );
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
