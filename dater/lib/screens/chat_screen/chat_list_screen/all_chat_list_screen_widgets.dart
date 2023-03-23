import 'package:dater/common_modules/custom_textfromfiled.dart';
import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/font_family.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/controller/all_chat_list_screen.dart';
import 'package:dater/screens/chat_screen/chat_screen/chat_screen.dart';
import 'package:dater/utils/extensions.dart';
import 'package:dater/utils/style.dart';
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
  final allChatListScreenController = Get.find<AllChatListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(
                () => const ChatScreen(),
              );
            },
            child: ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage(AppImages.chatimage),
              ),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Dennis Steele",
                      style: TextStyleConfig.textStyle(
                        fontFamily: FontFamilyText.sFProDisplaySemibold,
                        textColor: AppColors.grey800Color,
                        fontSize: 14.sp,
                      ),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Image.asset(AppImages.rightimage),
                    ),
                  ],
                ),
              ),
              subtitle: Text(
                "Hey, how’s life going.",
                style: TextStyleConfig.textStyle(
                  fontFamily: FontFamilyText.sFProDisplayRegular,
                  textColor: AppColors.grey800Color,
                  fontSize: 12.sp,
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 7,
                    width: 7,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.darkOrangeColor,
                    ),
                  ),
                  Text(
                    "9:27 AM",
                    style: TextStyleConfig.textStyle(
                      fontFamily: FontFamilyText.sFProDisplayRegular,
                      textColor: AppColors.grey500Color,
                    ),
                  ).commonOnlyPadding(top: 3),
                ],
              ),
            ),
          );
          // return GestureDetector(
          //   onTap: () {
          //     Get.to(
          //       () => ChatScreen(),
          //     );
          //   },
          //   child: Row(
          //     children: [
          //       Stack(
          //         alignment: Alignment.bottomRight,
          //         children: [
          //           const CircleAvatar(
          //             backgroundImage: AssetImage(AppImages.chatimage),
          //           ),
          //           allChatListScreenController.activeSelected.value
          //               ? Container(
          //                   height: 15,
          //                   width: 15,
          //                   decoration: const BoxDecoration(
          //                     shape: BoxShape.circle,
          //                     image: DecorationImage(
          //                       image: AssetImage(AppImages.activeImage),
          //                     ),
          //                   ),
          //                 )
          //               : Container(),
          //         ],
          //       ),
          //       SizedBox(width: 2.w),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Row(
          //             children: [
          //               Text(
          //                 "Dennis Steele",
          //                 style: TextStyleConfig.textStyle(
          //                   fontFamily: FontFamilyText.sFProDisplaySemibold,
          //                   textColor: AppColors.grey800Color,
          //                   fontSize: 14.sp,
          //                 ),
          //               ),
          //               allChatListScreenController.rightSelected.value
          //                   ? Image.asset(AppImages.rightimage)
          //                   : Container(),
          //               allChatListScreenController.panddingMess.value
          //                   ? Container(
          //                       height: 10,
          //                       width: 10,
          //                       decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         color: AppColors.darkOrangeColor,
          //                       ),
          //                     )
          //                   : Container(),
          //             ],
          //           ),
          //           // SizedBox(height: 0.5.h),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text(
          //                 "Hey, how’s life going.",
          //                 style: TextStyleConfig.textStyle(
          //                   fontFamily: FontFamilyText.sFProDisplayRegular,
          //                   textColor: AppColors.grey800Color,
          //                   fontSize: 12.sp,
          //                 ),
          //               ),
          //               Text("9:27 AM")
          //             ],
          //           ),
          //         ],
          //       ),
          //     ],
          //   ).commonOnlyPadding(bottom: 4.h),
          // );
        },
      ),
    );
  }
}
