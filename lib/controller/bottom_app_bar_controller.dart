import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trice/views/routing/routes.dart';

class BottomAppBarController extends GetxController
    with GetTickerProviderStateMixin {
  var selectedIndex = 0.obs;
  var fabClicked = false.obs;

  PageController pageController = PageController();
  late AnimationController animationController;

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    super.onInit();
  }

  addTask() {
    // TODO: Save Task
  }

  updateIndex(int index) {
    switch (index) {
      case 0:
      case 1:
        fabClicked.value = false;
        animationController.reverse();

        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        break;
      case 5:
        fabClicked.value = true;
        pageController.animateToPage(2,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        if (animationController.isDismissed) {
          animationController.forward();
        } else {
          animationController.reverse();
        }
        break;
      default:
        fabClicked.value = false;
        animationController.reverse();

        pageController.animateToPage(index + 1,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
    selectedIndex.value = index;
  }

  navigateToSearch() {
    Get.toNamed(searchApartment);
  }
}
