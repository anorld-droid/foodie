import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trice/controller/task_controller.dart';
import 'package:trice/domain/theme.dart';

class FilterChips extends GetView<TaskController> {
  final String text;
  final int index;
  final ValueChanged<int> onChipSelected;
  const FilterChips(
      {Key? key,
      required this.text,
      required this.onChipSelected,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<TaskController>();
    return InkWell(
        onTap: (() => onChipSelected(index)),
        child: Obx(
          () => Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: controller.selectedChip.value == index
                    ? Border.all(width: 0, style: BorderStyle.none)
                    : Border.all(color: Get.theme.primaryColorDark, width: 2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                gradient: controller.selectedChip.value == index
                    ? ThemeService().stroke
                    : ThemeService().floatingABGradient),
            child: Text(
              text,
              style: Get.textTheme.bodyLarge?.copyWith(
                  color: controller.selectedChip.value == index
                      ? Colors.white
                      : Colors.black),
            ),
          ),
        ));
  }
}
