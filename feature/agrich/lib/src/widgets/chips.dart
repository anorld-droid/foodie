import 'package:agrich/src/cuisine_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 21.01.2023.

class TriceFilterChips extends GetView<CuisineController> {
  final String text;
  final int index;
  final ValueChanged<int> onChipSelected;
  const TriceFilterChips(
      {Key? key,
      required this.text,
      required this.onChipSelected,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CuisineController>();
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(width: 0, style: BorderStyle.none),
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            color: controller.selectedChip.value == index
                ? Get.theme.primaryColorDark
                : Get.theme.backgroundColor),
        child: InkWell(
          onTap: (() => onChipSelected(index)),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          child: Text(
            text,
            style: Get.textTheme.bodyLarge?.copyWith(
                color: controller.selectedChip.value == index
                    ? Get.theme.backgroundColor
                    : Get.theme.primaryColorDark),
          ),
        ),
      ),
    );
  }
}
