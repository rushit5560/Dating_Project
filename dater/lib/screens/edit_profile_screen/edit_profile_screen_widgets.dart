// import 'dart:io';
// import 'package:dater/constants/app_images.dart';
// import 'package:dater/constants/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:reorderable_grid_view/reorderable_grid_view.dart';
// import '../../controller/auth_screen_controllers/edit_profile_screen_controller.dart';
//
// class PhotosModule extends StatefulWidget {
//    PhotosModule({Key? key}) : super(key: key);
//
//   @override
//   State<PhotosModule> createState() => _PhotosModuleState();
// }
//
// class _PhotosModuleState extends State<PhotosModule> {
//   final editProfileScreenController = Get.find<EditProfileScreenController>();
//
//    List<String> image = [
//      'assets/images/swiper1.png',
//      'assets/images/swiper2.png',
//      'assets/images/swiper3.png',
//    ];
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ReorderableGridView.count(onReorder: (oldIndex, newIndex){
//         String path = image.removeAt(oldIndex);
//         image.insert(newIndex, path);
//         setState(() {});
//       },
//         crossAxisCount: 3,
//         childAspectRatio: 1.0,
//         children: image.map((String path) => Card(
//           key: ValueKey(path),
//           child: Image.asset(path,fit: BoxFit.cover,),
//         )).toList(),
//       ),
//     );
// /*      GridView.builder(
//         itemCount: 9,
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemBuilder: (BuildContext context, int index) {
//           return GestureDetector(
//             onTap: ()  =>  editProfileScreenController.pickImageFromGallery(index),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: AppColors.gray100Color,
//               ),
//               child: index == 0
//                   ? _firstImage()
//                   : index == 1
//                   ? _secondImage()
//                   : index == 2
//                   ? _thirdImage()
//                   : index == 3
//                   ?_fourthImage()
//                   : index == 4
//                   ? _fiveImage()
//                   : _sixImage()
//             ),
//           );
//         },
//       ).commonSymmetricPadding(horizontal: 20, vertical: 20);*/
//
//
// /*   Widget _firstImage() {
//      return editProfileScreenController.imagePath1.path.isEmpty
//          ? Container(
//          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(15),
//            color: AppColors.gray100Color,
//          ),
//          child: Image.asset(AppImages.add),
//            )
//          : ClipRRect(
//            borderRadius: BorderRadius.circular(8),
//            child: Image.file(editProfileScreenController.imagePath1, fit: BoxFit.cover),
//      );
//    }
//
//    Widget _secondImage() {
//      return editProfileScreenController.imagePath2.path.isEmpty
//          ? Container(
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(15),
//              color: AppColors.gray100Color,
//            ), child: Image.asset(AppImages.add),
//          )
//          : ClipRRect(
//            borderRadius: BorderRadius.circular(8),
//            child: Image.file(editProfileScreenController.imagePath2, fit: BoxFit.cover),
//      );
//    }
//
//    Widget _thirdImage() {
//      return editProfileScreenController.imagePath3.path.isEmpty
//          ? Container(
//            decoration:  BoxDecoration(
//              color: AppColors.gray100Color,
//              borderRadius: BorderRadius.circular(15),
//            ),
//            child: Image.asset(AppImages.add),
//          )
//          : ClipRRect(
//            borderRadius: BorderRadius.circular(8),
//            child: Image.file(editProfileScreenController.imagePath3, fit: BoxFit.cover),
//      );
//    }
//
//    Widget _fourthImage() {
//      return editProfileScreenController.imagePath4.path.isEmpty
//          ? Container(
//            decoration:  BoxDecoration(
//              color: AppColors.gray100Color,
//              borderRadius: BorderRadius.circular(15),
//            ),
//            child: Image.asset(AppImages.add),
//          )
//          : ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Image.file(editProfileScreenController.imagePath4, fit: BoxFit.cover),
//      );
//    }
//
//    Widget _fiveImage() {
//      return editProfileScreenController.imagePath5.path.isEmpty
//          ? Container(
//            decoration: const BoxDecoration(
//              color: AppColors.gray100Color,
//            ),
//            child: Image.asset(AppImages.add),
//          )
//          : ClipRRect(
//            borderRadius: BorderRadius.circular(8),
//            child: Image.file(editProfileScreenController.imagePath5, fit: BoxFit.cover),
//      );
//    }
//
//    Widget _sixImage() {
//      return editProfileScreenController.imagePath6.path.isEmpty
//          ? Container(
//            decoration:  BoxDecoration(
//              color: AppColors.gray100Color,
//              borderRadius: BorderRadius.circular(15),
//            ),
//            child: Image.asset(AppImages.add),
//          )
//          : ClipRRect(
//            borderRadius: BorderRadius.circular(8),
//            child: Image.file(editProfileScreenController.imagePath6, fit: BoxFit.cover),
//      );*/
//    }
// }
//
