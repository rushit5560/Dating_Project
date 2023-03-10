import 'package:dater/constants/app_images.dart';
import 'package:dater/constants/colors.dart';
import 'package:dater/utils/extensions.dart';
import 'package:dater/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../comman_modules/custom_textfromfiled.dart';
import '../../constants/messages.dart';

class SearchTextfiledModule extends StatelessWidget {
  const SearchTextfiledModule({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return
      Row(
        children: [
          Expanded(
            child: Container(
              height: 5.7.h,
              margin: EdgeInsets.only(left: 9.w, right: 9.w),
              child: Material(
                elevation: 9.0,
                shadowColor: AppColors.gray100Color,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: TextFormFiledCustom(
                  fieldController: searchController,
                  hintText: AppMessages.search, keyboardType: TextInputType.text,
                  suffixIcon: Image.asset(AppImages.findImage),
                  prefixIcon: const Icon(Icons.search,size: 20),
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
        return  Row(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                alignment: Alignment.bottomCenter,
                  AppImages.location2Image),
            ).commonSymmetricPadding(horizontal: 1.w),
            Column(
              children: [
                Row(
                  children: const [
                    Text('New york'),
                  ],
                ),
                Row(
                  children:  [
                    Text('New york',
                        style: TextStyleConfig.textStyle(
                            textColor: AppColors.grey500Color,
                            fontFamily: "SFProDisplayRegular")),
                  ],
                ),
              ],
            )
          ],
        );
        }, separatorBuilder: (BuildContext context, int index) {

            return const Divider();
        },),
      ),
        );
  }
}

