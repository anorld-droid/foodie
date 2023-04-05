import 'package:cuisine_detail/src/controller.dart';
import 'package:cuisine_detail/src/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailTopBar extends GetView<Controller> {
  const DetailTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Controller());
    return Container(
      width: Get.width,
      margin: const EdgeInsets.only(top: 36, bottom: 16),
      color: Get.theme.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: Get.back,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Get.theme.colorScheme.background,
                      const Color.fromARGB(181, 5, 52, 49),
                      const Color.fromARGB(71, 5, 52, 49),
                    ],
                    // stops: const [0.5, 0.8, 1.0],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 6.0,
                      ),
                      Icon(
                        Icons.arrow_back,
                        color: Get.theme.colorScheme.onBackground,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        Strings.back,
                        style: Get.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          // color: Get.theme.colorScheme.background,
                        ),
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: controller.addToFavorite,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Get.theme.colorScheme.background,
                      const Color.fromARGB(181, 5, 52, 49),
                      const Color.fromARGB(71, 5, 52, 49),
                    ],
                    // stops: const [0.5, 0.8, 1.0],
                  ),
                ),
                child: Icon(
                  Icons.favorite_outline,
                  color: Get.theme.colorScheme.onBackground,
                  // size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
