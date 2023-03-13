import 'package:get/get.dart';

import '../../screens/favorite_screen/favorite_screen.dart';
import '../../screens/home_screen/home_screen.dart';
import '../../screens/message_screen/message_screen.dart';
import '../../screens/profile_screen/profile_screen.dart';

class IndexScreenController extends GetxController {
  RxInt currentPage = 0.obs;

  RxInt currentSelectedIndex = 0.obs;
  RxInt menuIndex = 2.obs;
}

