import 'package:dater/comman_modules/custom_button.dart';
import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/constants/font_family.dart';
import 'package:dater/constants/messages.dart';
import 'package:dater/controller/auth_screen_controllers/interests%20_screen_controller.dart';
import 'package:dater/screens/authantication_screen/interests_screen/interests_screen.dart';
import 'package:dater/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/style.dart';

class InterestsWidgetModule extends StatelessWidget {
  InterestsWidgetModule({Key? key}) : super(key: key);

  final interestsScreen1Controller = Get.find<InterestsScreen1Controller>();
  var selectedVal = 0;
  // bool  value = true;
  var options = [
    'News',
    'Entertainment',
    'Politics',
    'Automotive',
    'Sports',
    'Education',
    'Fashion',
    'Travel',
    'Food',
    'Tech',
    'Science',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: interestsScreen1Controller.categoryList.length,
          itemBuilder: (context, index) {
            return Card(
              child: SizedBox(
                height: 50.h,
                child: Column(children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: interestsScreen1Controller.categoryList.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AppImages.creativeImage),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  interestsScreen1Controller
                                      .categoryList[i].categoryName,
                                  style: TextStyleConfig.textStyle(
                                    fontFamily: "SFProDisplayRegular",
                                    textColor: AppColors.blackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ]),
                          Wrap(
                            spacing: 3.0,
                            //runSpacing: 2.0,
                            children: List.generate(
                              interestsScreen1Controller
                                  .categoryList[i].options.length,
                              (int index) {
                                return Transform(
                                  transform: Matrix4.identity()..scale(0.9),
                                  child: ChoiceChip(
                                    // avatar: Image.asset(AppImages.findImage),
                                    //padding: const EdgeInsets.symmetric(vertical: 9,horizontal: 10),
                                    label: Text(interestsScreen1Controller
                                        .categoryList[i].options[index].name),
                                    //labelPadding: EdgeInsets.only(left: 2.w),
                                    selected: selectedVal == index,
                                    selectedColor: AppColors.darkOrangeColor,
                                    backgroundColor: Colors.white,
                                    shape: const StadiumBorder(
                                      side: BorderSide(
                                        // width: 1,
                                        color: AppColors.grey400Color,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      // setState(() {
                                      //   selectedVal = (value ? index : null)!;
                                      // });
                                    },
                                  ),
                                );
                              },
                            ).toList(),
                          )
                        ],
                      );
                    },
                  ),
                ]),
              ),
            ).commonOnlyPadding(bottom: 0.h);
          }),
    );
  }
}

// class SportsWidgetsModule extends StatefulWidget {
//   const SportsWidgetsModule({Key? key}) : super(key: key);

//   @override
//   State<SportsWidgetsModule> createState() => _SportsWidgetsModuleState();
// }

// class _SportsWidgetsModuleState extends State<SportsWidgetsModule> {
//   var selectedVal = 0;
//   // bool  value = true;
//   var options = [
//     'News',
//     'Entertainment',
//     'Politics',
//     'Automotive',
//     'Sports',
//     'Education',
//     'Fashion',
//     'Travel',
//     'Food',
//     'Tech',
//     'Science',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: SizedBox(
//         height: 50.h,
//         child: Column(children: [
//           SizedBox(
//             height: 3.h,
//           ),
//           Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//             Image.asset(AppImages.creativeImage),
//             SizedBox(
//               width: 1.w,
//             ),
//             Text(
//               AppMessages.sports,
//               style: TextStyleConfig.textStyle(
//                 fontFamily: "SFProDisplayRegular",
//                 textColor: AppColors.blackColor,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 12.sp,
//               ),
//             ),
//           ]),
//           SizedBox(
//             height: 2.h,
//           ),
//           Wrap(
//             spacing: 3.0,
//             //runSpacing: 2.0,
//             children: List.generate(
//               options.length,
//               (int index) {
//                 return Transform(
//                   transform: Matrix4.identity()..scale(0.9),
//                   child: ChoiceChip(
//                     avatar: Image.asset(AppImages.findImage),
//                     //padding: const EdgeInsets.all(2),
//                     label: Text(options[index]),
//                     selected: selectedVal == index,
//                     selectedColor: AppColors.darkOrangeColor,
//                     backgroundColor: Colors.white,
//                     shape: const StadiumBorder(
//                       side: BorderSide(
//                         // width: 1,
//                         color: AppColors.grey400Color,
//                       ),
//                     ),
//                     onSelected: (bool value) {
//                       setState(() {
//                         selectedVal = (value ? index : null)!;
//                       });
//                     },
//                   ),
//                 );
//               },
//             ).toList(),
//           ),
//         ]),
//       ),
//     );
//   }
// }

class SkipAndNextButtonModule extends StatelessWidget {
  const SkipAndNextButtonModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          // flex: 5,
          child: ButtonCustom(
            text: AppMessages.skip,
            textFontFamily: FontFamilyText.sFProDisplayBold,
            textsize: 15,
            backgroundColor: AppColors.darkOrangeColor,
            textColor: AppColors.whiteColor2,
            onPressed: () {
              // Get.to(
              //   () => InterestsScreen(),
              // );
            },
          ),
        ),
        const SizedBox(width: 30),
        Text(
          "0/8 Selected",
          style: TextStyleConfig.textStyle(
              fontFamily: FontFamilyText.sFProDisplayRegular,
              textColor: AppColors.grey500Color,
              fontSize: 14.sp),
        ),
        const SizedBox(width: 30),
        Expanded(
          // flex: 5,
          child: ButtonCustom(
            text: AppMessages.next,
            textFontFamily: FontFamilyText.sFProDisplayBold,
            textsize: 15,
            backgroundColor: AppColors.darkOrangeColor,
            textColor: AppColors.whiteColor2,
            onPressed: () {
              // Get.to(
              //   () => InterestsScreen(),
              // );
            },
          ),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 25, vertical: 10);
  }
}
