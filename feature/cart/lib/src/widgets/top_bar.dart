import 'package:cart/src/controller.dart';
import 'package:cart/src/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.
class CartAppBar extends GetView<Controller> implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<Controller>();
    return AppBar(
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      title: Obx(() => Text(
            '${Strings.deliveryTo} ${controller.getDestination(controller.destinationTown.value, controller.destinationArea.value)}',
            style: Get.textTheme.displayMedium,
          )),
      backgroundColor: Get.theme.backgroundColor,
      actions: [
        PopupMenuButton(
          initialValue: controller.getDestination(
              controller.destinationTown.value,
              controller.destinationArea.value),
          elevation: 0,
          icon: Icon(
            Icons.expand_more,
            color: Get.theme.primaryColorDark,
          ),
          position: PopupMenuPosition.under,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          itemBuilder: (context) => _destinations(),
          onSelected: (value) {
            controller.destinationTown.value =
                controller.getTown(value as String);
            controller.destinationArea.value = controller.getArea(value);
          },
        ),
      ],
    );
  }

  List<PopupMenuEntry> _destinations() {
    List<PopupMenuEntry> popupMenuItems = [];
    for (var destination in controller.destinations.value.destinations) {
      var destinationValue =
          controller.getDestination(destination.town, destination.area);
      popupMenuItems.add(
        PopupMenuItem(
          value: destinationValue,
          child: Text(
            destinationValue,
            style: Get.textTheme.displayMedium,
          ),
        ),
      );
    }
    return popupMenuItems;
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
