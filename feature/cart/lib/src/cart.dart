import 'package:cart/src/controller.dart';
import 'package:cart/src/widgets/body.dart';
import 'package:cart/src/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.
class Cart extends GetView<Controller> {
  final Rx<List<CartItem>> cartItems;

  const Cart({
    super.key,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Controller(items: cartItems));
    return Scaffold(
      appBar: const CartAppBar(),
      body: const CartBody(),
      bottomNavigationBar: Container(
        height: 56,
        color: Get.theme.colorScheme.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => controller.checkout(),
              borderRadius: BorderRadius.circular(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    height: 40,
                    width: Get.width * 0.75,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      color: Get.theme.colorScheme.onSecondary,
                    ),
                    child: Text(
                      'Checkout',
                      style: Get.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Get.theme.colorScheme.onBackground,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: controller.shippingDialog,
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Get.theme.colorScheme.onSecondary,
                ),
                child: Icon(
                  Icons.edit_location_alt_outlined,
                  color: Get.theme.colorScheme.onBackground,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
