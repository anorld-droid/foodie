import 'package:get/get.dart';

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
  final _lastSelected = 'TAB: 0'.obs;

  selectedTab(int index) {
    _lastSelected.value = 'TAB: $index';
  }
}
