import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_modules/custom_appbar.dart';
import '../../constants/colors.dart';
import '../../constants/messages.dart';
import '../../controller/auth_screen_controllers/edit_profile_screen_controller.dart';
import 'edit_profile_screen_widgets.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
final editProfileScreenController = Get.put(EditProfileScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.whiteColor2,
      appBar: commonAppBarModule(text: AppMessages.editProfile),
      body: Column(
        children: [
          // PhotosModule(),
        ],
      ),
    );
  }
}
