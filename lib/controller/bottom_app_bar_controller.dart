import 'package:get/get.dart';
import 'package:trice/controller/main_controller.dart';

class BottomAppBarController extends GetxController {
  var selectedIndex = 0.obs;
  updateIndex(int index) {
    Controller controller = Get.find();
    controller.fabClicked.value = false;
    selectedIndex.value = index;
  }
}
