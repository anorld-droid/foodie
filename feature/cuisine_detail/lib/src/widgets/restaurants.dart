import 'package:cuisine_detail/src/controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Restaurants extends GetView<Controller> {
  final String name;
  const Restaurants(
    this.name, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () => controller.changeStore(name),
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          width: Get.width * 0.30,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
              color: Get.theme.colorScheme.onSecondary,
              border: controller.store.value == name
                  ? Border.all(color: Get.theme.colorScheme.primary)
                  : const Border(),
              borderRadius: BorderRadius.circular(12.0)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.restaurant_menu,
                  color: Get.theme.colorScheme.onBackground,
                  size: 32,
                ),
                Text(
                  name,
                  style: Get.textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 8.0,
                ),
              ]),
        ),
      ),
    );
  }
}
