import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class InterestsWidgetsModule extends StatefulWidget {
  const InterestsWidgetsModule({Key? key}) : super(key: key);

  @override
  State<InterestsWidgetsModule> createState() => _InterestsWidgetsModuleState();
}

class _InterestsWidgetsModuleState extends State<InterestsWidgetsModule> {
  int? _value = 0;
  @override
  Widget build(BuildContext context) {
    return
      Column(
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
              style: TextStyle(
                color: AppColors.blackColor,
                //color: textColor,
                //fontWeight: FontWeight.bold,
               // fontFamily: textFontFamily,
                fontSize: 20.sp,
              ),
            ),
          ]),
          Row(
            children: [
              Text(
                AppMessages.whatsyourinterests,
                style: TextStyle(
                  color: AppColors.blackColor,
                  //color: textColor,
                  //fontWeight: FontWeight.bold,
                  // fontFamily: textFontFamily,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
          Wrap(
           spacing: 7.0,
           runSpacing: 7.0,
           children: List<Widget>.generate(
             10,
                 (int index) {
               return SizedBox(
                 height:30,
                 child: ChoiceChip(
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
                 ),
               );
             },
           ).toList(),
          ),
      ]);
  }
}
