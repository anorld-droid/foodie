import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/controller/bottom_app_bar_controller.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({required this.iconData, required this.text});
  IconData iconData;
  String text;
}

class FABBottomAppBar extends GetView<BottomAppBarController> {
  FABBottomAppBar({
    required this.items,
    required this.centerItemText,
    this.height: 60.0,
    this.iconSize: 24.0,
    required this.backgroundColor,
    required this.color,
    required this.selectedColor,
    required this.notchedShape,
    required this.onTabSelected,
  }) {
    assert(items.length == 2 || items.length == 4);
  }
  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    Get.put(BottomAppBarController());
    List<Widget> items = List.generate(this.items.length, (int index) {
      return _buildTabItem(
        item: this.items[index],
        index: index,
        onPressed: controller.updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: notchedShape,
      color: backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: iconSize),
            Text(
              centerItemText,
              style: Get.textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    {
      return Expanded(
        child: SizedBox(
          height: height,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () => onPressed(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Obx(() => Icon(item.iconData,
                      color: controller.selectedIndex.value == index
                          ? selectedColor
                          : color,
                      size: iconSize)),
                  Obx(() => Text(
                        item.text,
                        style: Get.textTheme.labelMedium?.copyWith(
                            color: controller.selectedIndex.value == index
                                ? selectedColor
                                : color),
                      ))
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
