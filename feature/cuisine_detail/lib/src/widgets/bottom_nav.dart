import 'package:cuisine_detail/src/controller.dart';
import 'package:cuisine_detail/src/strings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:model/model.dart';

class BottomNav extends GetView<Controller> {
  final CuisineItem cuisineItem;
  final String header;
  const BottomNav({super.key, required this.cuisineItem, required this.header});

  @override
  Widget build(BuildContext context) {
    Get.find<Controller>();
    return Container(
      decoration: BoxDecoration(color: Get.theme.colorScheme.background),
      child: Container(
        height: 56,
        color: Get.theme.colorScheme.background,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          InkWell(
            onTap: () => controller.addToCart(cuisineItem),
            child: Container(
              height: 40,
              width: Get.width * 0.75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Get.theme.colorScheme.onBackground),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    Strings.addToCart,
                    style: Get.textTheme.bodyLarge
                        ?.copyWith(color: Get.theme.colorScheme.background),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => controller.addToFavorite(cuisineItem, header),
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Get.theme.colorScheme.onBackground,
              ),
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => Icon(
                  controller.favorite.isTrue
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: controller.favorite.isTrue
                      ? Get.theme.colorScheme.primary
                      : Get.theme.colorScheme.background,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
