import 'package:get/get.dart';
import 'package:trice/controller/bottom_app_bar_controller.dart';

class Controller extends GetxController {
  var count = 0.obs;
  var fabClicked = false.obs;
  increment() => count++;

  selectedFab() {
    BottomAppBarController bottomAppBarController = Get.find();
    bottomAppBarController.updateIndex(5);
    fabClicked.toggle();
  }
}
