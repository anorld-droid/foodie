import 'package:cuisine_detail/src/controller.dart';
import 'package:cuisine_detail/src/strings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:model/model.dart';

class BottomNav extends GetView<Controller> {
  final CuisineItem cuisineItem;
  const BottomNav({super.key, required this.cuisineItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Get.theme.colorScheme.background),
      child: Container(
        height: 56,
        decoration: const BoxDecoration(
          gradient: RadialGradient(colors: [
            Color.fromARGB(181, 5, 52, 49),
            Color.fromARGB(71, 5, 52, 49)
          ], center: Alignment(0.5, 0)),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          InkWell(
            onTap: () => controller.addToCart(cuisineItem),
            child: Container(
              height: 40,
              width: Get.width * 0.75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Get.theme.colorScheme.onSecondary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    Strings.addToCart,
                    style: Get.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: controller.addToFavorite,
            borderRadius: BorderRadius.circular(30.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Get.theme.colorScheme.onSecondary,
              ),
              child: Icon(
                Icons.favorite_outline,
                color: Get.theme.colorScheme.onBackground,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
