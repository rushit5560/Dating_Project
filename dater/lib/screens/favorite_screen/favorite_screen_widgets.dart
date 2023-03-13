import 'package:dater/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_images.dart';
import '../../utils/style.dart';

class FavoriteGridViewBuilderModule extends StatelessWidget {
  const FavoriteGridViewBuilderModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 20, mainAxisSpacing: 20, crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return
            Column(
              children: [
                Expanded(
                  child: Container(
                    height: 30.h,
                  decoration: const BoxDecoration(
                  color: AppColors.whiteColor2,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                    child: Column(
                      children: [
                        Container(
                          height: 17.4.h,
                          decoration: const BoxDecoration(
                            color: AppColors.whiteColor2,
                            image:  DecorationImage(
                              image: AssetImage(AppImages.swiper2Image),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                          ),
                        ),
                        SizedBox(height: 1.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedContainer(
                          width: 4.w,
                          height: 2.h,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          duration: const Duration(seconds: 3),
                          curve: Curves.fastOutSlowIn,
                        ),
                            SizedBox(width: 3.w,),
                            Text('active',
                            style: TextStyleConfig.textStyle(
                              textColor: AppColors.blackColor,
                              fontSize: 14.sp,
                              fontFamily: "SFProDisplayBlack",
                              fontWeight: FontWeight.normal,
                            ),),
                        ]),
                      ],
                    ),
                  ),
                )
              ]
            );
        },
      ),
    );
  }
}

/*                Material(
                color: AppColors.whiteColor2,
                borderRadius: BorderRadius.circular(30),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: AppColors.grey200Color,
                  onTap: (){},
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Ink.image(
                          image: const AssetImage(AppImages.swiper2Image,),
                          height: 15.h,
                          width: 30.w,
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(height: 4,),
                        Text('active',
                          style: TextStyleConfig.textStyle(
                            textColor: AppColors.blackColor,
                            fontSize: 18.sp,
                            fontFamily: "SFProDisplayBlack",
                            fontWeight: FontWeight.normal,
                          ),),
                        SizedBox(height: 4,),
                      ]),
                ),
              ),*/
