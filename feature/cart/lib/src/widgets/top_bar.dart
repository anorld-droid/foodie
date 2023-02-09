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
      shadowColor: Get.theme.primaryColorDark.withOpacity(.35),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      title: Obx(
        () => Text(
          controller.subscription.value?.shippingInfo ?? Strings.shippingDays,
          style: Get.textTheme.bodySmall,
        ),
      ),
      backgroundColor: Get.theme.backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
