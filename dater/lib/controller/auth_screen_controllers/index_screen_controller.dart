import 'package:get/get.dart';

import '../../screens/favorite_screen/favorite_screen.dart';
import '../../screens/home_screen/home_screen.dart';
import '../../screens/message_screen/message_screen.dart';
import '../../screens/profile_screen/profile_screen.dart';

class IndexScreenController extends GetxController {
  var selectedIndex = 0.obs;
  changeIndex(int index){
    selectedIndex.value = index;
  }
}

