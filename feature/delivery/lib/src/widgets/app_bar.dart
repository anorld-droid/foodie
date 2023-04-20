import 'package:delivery/src/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery/src/strings.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 13.04.2023.
class TopBar extends GetView<DeliveryController>
    implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40),
          color: Get.theme.colorScheme.primaryContainer,
          child: InkWell(
            onTap: controller.back,
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              margin: const EdgeInsets.all(8),
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Get.theme.colorScheme.background,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Get.theme.colorScheme.onBackground,
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(Strings.back, style: Get.textTheme.bodySmall)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
