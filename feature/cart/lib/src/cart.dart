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
          color: Get.theme.colorScheme.background,
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
              onTap: controller.shippingDialog,
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
                  Icons.edit_location_alt_outlined,
                  color: Get.theme.colorScheme.onBackground,
                  // size: 24,
                ),
              ),
            ),
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
                          const BorderRadius.all(Radius.circular(30.0)),
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
          ],
        ),
      ),
    );
  }
}
