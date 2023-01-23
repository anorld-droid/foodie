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
            '${Strings.deliveryTo} ${controller.destination.value}',
            style: Get.textTheme.displayMedium,
          )),
      backgroundColor: Get.theme.backgroundColor,
      actions: [
        PopupMenuButton(
          initialValue: KisumuDestinations.milimani,
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
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: KisumuDestinations.milimani,
                child: Text(
                  KisumuDestinations.milimani.name,
                  style: Get.textTheme.displayMedium,
                ),
              ),
              PopupMenuItem(
                value: KisumuDestinations.nyalendaA,
                child: Text(
                  KisumuDestinations.nyalendaA.name,
                  style: Get.textTheme.displayMedium,
                ),
              ),
              PopupMenuItem(
                value: KisumuDestinations.nyalendaB,
                child: Text(
                  KisumuDestinations.nyalendaB.name,
                  style: Get.textTheme.displayMedium,
                ),
              ),
              PopupMenuItem(
                value: KisumuDestinations.cbd,
                child: Text(
                  KisumuDestinations.cbd.name,
                  style: Get.textTheme.displayMedium,
                ),
              ),
              PopupMenuItem(
                value: KisumuDestinations.manyattaB,
                child: Text(
                  KisumuDestinations.manyattaB.name,
                  style: Get.textTheme.displayMedium,
                ),
              ),
              PopupMenuItem(
                value: KisumuDestinations.obunga,
                child: Text(
                  KisumuDestinations.obunga.name,
                  style: Get.textTheme.displayMedium,
                ),
              ),
              PopupMenuItem(
                value: KisumuDestinations.kondele,
                child: Text(
                  KisumuDestinations.kondele.name,
                  style: Get.textTheme.displayMedium,
                ),
              ),
            ];
          },
          onSelected: (value) {
            controller.destination.value = value.name;
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
