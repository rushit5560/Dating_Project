import 'package:get/get.dart';
class UserNameScreen1Controller extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<String> tags = [];
  List<String> options = [
    'News', 'Entertainment', 'Politics',
    'Automotive', 'Sports', 'Education',
    'Fashion', 'Travel', 'Food', 'Tech',
    'Science',
  ];
@override
  void onInit() {
    
    super.onInit();
  }

 }