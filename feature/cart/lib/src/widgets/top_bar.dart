import 'package:cart/src/controller.dart';
import 'package:cart/src/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.
class CartAppBar extends GetView<CartController>
    implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      leadingWidth: 56.0,
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Get.theme.colorScheme.background,
              const Color.fromARGB(71, 5, 52, 49),
            ],
          ),
        ),
      ),
      leading: InkWell(
        onTap: Get.back<void>,
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Get.theme.colorScheme.background,
                const Color.fromARGB(255, 5, 52, 49),
                const Color.fromARGB(181, 5, 52, 49),
                const Color.fromARGB(71, 5, 52, 49),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.arrow_back,
              color: Get.theme.colorScheme.onBackground,
            ),
          ),
        ),
      ),
      shadowColor: Get.theme.colorScheme.primaryContainer,
      title: Obx(
        () => Text(
          controller.subscription.value?.shippingInfo ?? Strings.shippingDays,
          style: Get.textTheme.bodySmall,
        ),
      ),
      backgroundColor: Get.theme.colorScheme.primaryContainer,
      actions: [
        InkWell(
          onTap: () =>
              controller.navigateToDelivery(controller.orders.value.first),
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Get.theme.colorScheme.background,
                  const Color.fromARGB(181, 5, 52, 49),
                  const Color.fromARGB(71, 5, 52, 49),
                ],
              ),
            ),
            child: Icon(
              Icons.mode_of_travel_outlined,
              color: Get.theme.colorScheme.onBackground,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
