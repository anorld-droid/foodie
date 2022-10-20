import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trice/views/routing/routes.dart';

class BottomAppBarController extends GetxController {
  var selectedIndex = 0.obs;
  var fabClicked = false.obs;

  TextEditingController searchController = TextEditingController();
  PageController pageController = PageController();
  updateIndex(int index) {
    switch (index) {
      case 0:
      case 1:
        fabClicked.value = false;
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        break;
      case 5:
        fabClicked.value = true;
        pageController.animateToPage(2,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        break;
      default:
        fabClicked.value = false;
        pageController.animateToPage(index + 1,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
    if (index == 5) {
      fabClicked.value = true;
      pageController.animateToPage(2,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {}
    selectedIndex.value = index;
  }

  navigateToSearch() {
    Get.toNamed(searchApartment);
  }
}
