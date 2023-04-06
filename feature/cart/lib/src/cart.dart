import 'package:cart/src/controller.dart';
import 'package:cart/src/widgets/body.dart';
import 'package:cart/src/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.
class Cart extends GetView<Controller> {
  final Rx<List<CartItem>> cartItems;
  const Cart({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Controller(items: cartItems));
    return Scaffold(
      appBar: const CartAppBar(),
      body: const CartBody(),
      bottomNavigationBar: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Get.theme.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Get.theme.primaryColorDark.withOpacity(.35),
              spreadRadius: 1.0,
              blurRadius: .5,
              blurStyle: BlurStyle.inner,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => controller.shippingDialog(),
              borderRadius: BorderRadius.circular(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    height: 40,
                    width: Get.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(0.0)),
                      color: Get.theme.primaryColorDark,
                    ),
                    child: Text(
                      'Update destination',
                      style: Get.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Get.theme.backgroundColor,
                          overflow: TextOverflow.ellipsis),
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () => controller.checkout(),
              borderRadius: BorderRadius.circular(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    height: 40,
                    width: Get.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(0.0)),
                      color: Get.theme.primaryColorDark,
                    ),
                    child: Text(
                      'Checkout',
                      style: Get.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Get.theme.backgroundColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
