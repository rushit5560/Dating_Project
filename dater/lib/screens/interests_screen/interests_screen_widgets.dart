import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../utils/style.dart';

class CreativeWidgetsModule extends StatefulWidget {
  const CreativeWidgetsModule({Key? key}) : super(key: key);

  @override
  State<CreativeWidgetsModule> createState() => _CreativeWidgetsModuleState();
}

class _CreativeWidgetsModuleState extends State<CreativeWidgetsModule> {
  int? _value = 0;
  @override
  Widget build(BuildContext context) {
    return
      Card(
        child: SizedBox(
          height: 50.h,
          child: Column(
              children:[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        color: AppColors.darkOrangeColor,
                        onPressed: () {Get.back();},
                        icon:const Icon(Icons.west_outlined,),),
                      Text(
                        AppMessages.whatsyourinterests,
                        style: TextStyleConfig.textStyle(
                          fontFamily: "SFProDisplayRegular",
                          textColor: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                    ]),
                SizedBox(height: 1.5.h,),
                Text(
                  AppMessages.interestsText1,
                  style: TextStyleConfig.textStyle(
                    fontFamily: "SFProDisplayRegular",
                    textColor: AppColors.grey600Color,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  AppMessages.interestsText2,
                  style: TextStyleConfig.textStyle(
                    fontFamily: "SFProDisplayRegular",
                    textColor: AppColors.grey600Color,
                    fontSize: 12.sp,
                  ),
                ),
                //SizedBox(height: 3.h,),
                Image.asset(
                    AppImages.creativeImage),
                Text(
                  AppMessages.creative,
                  style: TextStyleConfig.textStyle(
                    fontFamily: "SFProDisplayRegular",
                    textColor: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 1.h,),
                Wrap(
                  spacing: 2.0,
                  //runSpacing: 2.0,
                  children: List.generate(
                    10,
                        (int index) {
                      return ChoiceChip(
                        avatar: Image.asset(AppImages.findImage),
                        //padding: EdgeInsets.all(10),
                        label: Text('Item $index'),
                        selected: _value == index,
                        selectedColor: Colors.deepOrange,
                        backgroundColor: Colors.white,
                        shape: const StadiumBorder(
                            side: BorderSide(
                              // width: 1,
                              color: Colors.black,
                            )
                        ),
                        onSelected: (bool selected) {
                          setState(() {
                            _value = selected ? index : null;
                          });
                        },
                      );
                    },
                  ).toList(),
                ),
              ]),
        ),
      ).commonSymmetricPadding(horizontal: 5);
  }
}
