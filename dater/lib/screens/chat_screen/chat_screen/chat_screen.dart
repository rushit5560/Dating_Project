import 'package:dater/common_modules/custom_appbar.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/screens/chat_screen/chat_screen/chat_screen_widgets.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.whiteColor2,
      appBar: commonAppBarModule(text: ""),
      body: Column(
        children: const [
          Expanded(
            child: ChatScreenWidgets(),
          ),
          TextFormFieldModule()
        ],
      ),
    );
  }
}
