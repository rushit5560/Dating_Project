import 'package:dater/constants/font_family.dart';
import 'package:dater/controller/auth_screen_controllers/my_number_inner_screen_controller.dart';
import 'package:dater/utils/extensions.dart';
import 'package:dater/utils/field_validator.dart';
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
          flex: 25,
          child: Obx(
            () => SizedBox(
              width: Get.size.width * 0.25,
              // height: 50,
              child: DropdownButton<String>(
                value: myNumberInnerScreenController.selectCountryCodeValue.value,
                alignment: Alignment.centerLeft,
                isExpanded: true,
                items: myNumberInnerScreenController.countryCodeList
                    .map(
                      (item) => DropdownMenuItem<String>(
                        // enabled: true,
                        value: item,
                        child: Text(
                          item,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: FontFamilyText.sFProDisplayRegular,
                            fontSize: 14,
                            color: AppColors.grey800Color,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (val) {
                  myNumberInnerScreenController.isLoading(true);
                  myNumberInnerScreenController.selectCountryCodeValue.value = val!;
                  myNumberInnerScreenController.isLoading(false);
                },
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 75,
          child: Form(
            key: myNumberInnerScreenController.formKey,
            child: TextFormField(
              cursorColor: AppColors.darkOrangeColor,
              controller: myNumberInnerScreenController.phoneNumberController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              validator: (value) => FieldValidator().validateMobileNumber(value!),
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
                counterText: '',
                hintText: AppMessages.phoneNumber,
                hintStyle: TextStyle(
                  color: AppColors.grey500Color,
                  fontSize: 14,
                  fontFamily: FontFamilyText.sFProDisplayRegular,
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
