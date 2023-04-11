import 'package:dater/common_modules/custom_appbar.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/screens/chat_screen/chat_screen/chat_screen_widgets.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../common_modules/custom_loader.dart';
import '../../../controller/chat_screen_controller.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({super.key});
   final chatScreenController = Get.put(ChatScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor2,
      appBar: appBarModule(text: "Simon Carter"),
      body: WillPopScope(
        onWillPop: () {
          if(chatScreenController.isEmojiVisible.value){
            chatScreenController.isEmojiVisible.value = false;
          }
          else{
            Navigator.pop(context);
          }
          return Future.value(false);
        },
        child: Obx(
          ()=> chatScreenController.isLoading.value
          ? const CustomLoader()
          : Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:  [
              Expanded(
                //flex: 20,
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children:  [
                          SizedBox(height: 2.h),
                          const ChatScreenWidgets(),
                          SizedBox(height: 5.h),
                          MessageAllModule().commonOnlyPadding(bottom: 10),
                        ],),
                    ),
                  ),
                ),
              ),
              Container(
               height: 55,
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor2,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      offset: Offset(-3, -1),
                      color: AppColors.grey400Color,
                    ),
                  ],
                ),
                child:  TextFormFieldModule(),
              ),
              EmojiVisible(),
            ],
          ),
        ),
      ),
    );
  }
}
