import 'package:common/src/controller/controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FoodieChip extends GetView<CommonController> {
  final String name;
  const FoodieChip(
    this.name, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () => controller.updateType(name),
        borderRadius: BorderRadius.circular(6.0),
        child: Container(
          alignment: Alignment.center,
          width: Get.width * 0.30,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
              color: Get.theme.colorScheme.background,
              border: controller.purchaseType.value == name
                  ? Border.all(color: Get.theme.colorScheme.primary, width: .5)
                  : const Border(),
              borderRadius: BorderRadius.circular(6.0)),
          child: Text(
            name,
            style: Get.textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}
