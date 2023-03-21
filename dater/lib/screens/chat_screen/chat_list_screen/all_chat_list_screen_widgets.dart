import 'package:dater/common_modules/custom_textfromfiled.dart';
import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/controller/all_chat_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SearchTextfiledModule extends StatelessWidget {
  const SearchTextfiledModule({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final allChatListScreenController = Get.find<AllChatListScreenController>();
    return Row(
      children: [
        Form(
          key: allChatListScreenController.formKey,
          child: Expanded(
            child: SizedBox(
              height: 5.7.h,
              child: Material(
                elevation: 9.0,
                shadowColor: AppColors.gray100Color,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: TextFormFiledCustom(
                  fieldController:
                      allChatListScreenController.searchTextFieldController,
                  hintText: AppMessages.search,
                  keyboardType: TextInputType.text,
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 20,
                    color: AppColors.grey400Color,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ChatListModule extends StatelessWidget {
  ChatListModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Row(
            children: [CircleAvatar()],
          );
        },
      ),
    );
  }
}
