

import 'package:dater/constants/font_family.dart';
import 'package:dater/utils/extensions.dart';
import 'package:dater/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../common_modules/custom_appbar.dart';
import '../../common_modules/custom_loader.dart';
import '../../constants/colors.dart';
import '../../constants/messages.dart';
import '../../controller/auth_screen_controllers/edit_profile_screen_controller.dart';
import 'edit_profile_screen_widgets.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final editProfileScreenController = Get.put(EditProfileScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor2,
      appBar: commonAppBarModule(text: AppMessages.editProfile),
      body: Obx(
        () => editProfileScreenController.isLoading.value
            ? const CustomLoader()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    RecodebleGridViewModule(),
                    SizedBox(height: 2.h),
                    EditprofileScreenWidgets()
                  ],
                ).commonSymmetricPadding(horizontal: 25, vertical: 20),
              ),
      ),
    );
  }
}


