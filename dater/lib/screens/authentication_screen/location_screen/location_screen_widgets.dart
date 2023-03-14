import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/controller/auth_screen_controllers/location_screen_controller.dart';
import 'package:dater/utils/extensions.dart';
import 'package:dater/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../common_modules/custom_textfromfiled.dart';
import '../../../constants/messages.dart';
class SearchTextfiledModule extends StatelessWidget {
  const SearchTextfiledModule({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final locationScreenController = Get.find<LocationScreenController>();
    //TextEditingController searchTextFieldController = TextEditingController();
    return
      Row(
        children: [
          Form(
            key: locationScreenController.formKey,
            child: Expanded(
              child: Container(
                height: 5.7.h,
                //margin: EdgeInsets.only(left: 9.w, right: 9.w),
                child: Material(
                  elevation: 9.0,
                  shadowColor: AppColors.gray100Color,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: TextFormFiledCustom(
                    fieldController: locationScreenController.searchTextFieldController,
                    hintText: AppMessages.search, keyboardType: TextInputType.text,
                    suffixIcon: Image.asset(AppImages.findImage),
                    prefixIcon: const Icon(Icons.search,size: 20),
                    ),
                ),
                ),
              ),
          ),
        ],
      );
  }
}


class CountryListViewModule extends StatelessWidget {
  const CountryListViewModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Expanded(
      child: Container(
        height: 10.h,
        //padding: EdgeInsets.only(left: 3.w),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
         // shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
        return
          Row(
          children: [
            SizedBox(
              height: 4.h,
              child: Image.asset(
                //fit: BoxFit.fitHeight,
                //alignment: Alignment.bottomRight,
                 // cacheHeight: 45,
                  AppImages.location2Image),
            ).commonOnlyPadding(left: 3.w),
            Column(
              children: [
                Row(
                  children:  [
                    Text('New york',style: TextStyleConfig.textStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                       //textColor: AppColors.grey500Color,
                        fontFamily: "SFProDisplayRegular"),),
                  ],
                ).commonOnlyPadding(left: 2.5.w),
                Row(
                  children:  [
                    Text('New york',
                        style: TextStyleConfig.textStyle(
                            textColor: AppColors.grey500Color,
                            fontFamily: "SFProDisplayRegular"),
                    ),
                  ],
                ),
              ],
            ).commonSymmetricPadding(vertical: 5),
          ],
        ).commonSymmetricPadding(horizontal: 12);
        }, separatorBuilder: (BuildContext context, int index) {

            return const Divider();
        },),
      ),
        );
  }
}

