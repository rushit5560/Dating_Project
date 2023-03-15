import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FavoriteScreenController extends GetxController{
  var selected = "".obs;
  change (index){
    selected.value = index;
  }
}