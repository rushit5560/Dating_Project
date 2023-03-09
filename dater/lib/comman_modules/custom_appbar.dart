import 'dart:developer';

import 'package:dater/constants/messages.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

PreferredSizeWidget commonAppBarModule() {
  return AppBar(
      backgroundColor: AppColors.gray50Color,
      leading:Builder(
        builder: (BuildContext context) {
          return
            IconButton(onPressed: () => log('message3') ,
                icon: const Icon(Icons.west_outlined,color: AppColors.lightOrangeColor));
        },
      ),
      centerTitle: true,
      elevation: 0,
      title: Text(AppMessages.myNumberIs,style: const TextStyle(color: AppColors.blackColor,fontWeight: FontWeight.w800)),
  );
}