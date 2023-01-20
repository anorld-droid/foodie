import 'package:agrich/src/cuisine_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return InkWell(
        onTap: (() => onChipSelected(index)),
        child: Obx(
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
            child: Text(
              text,
              style: Get.textTheme.bodyLarge?.copyWith(
                  color: controller.selectedChip.value == index
                      ? Get.theme.backgroundColor
                      : Get.theme.primaryColorDark),
            ),
          ),
        ));
  }
}
