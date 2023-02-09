import 'package:cart/src/controller.dart';
import 'package:cart/src/widgets/order_item.dart';
import 'package:cart/src/widgets/shipping_items.dart';
import 'package:cart/src/widgets/top_bar.dart';
import 'package:common/common.dart';
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
      body: SingleChildScrollView(child: _body()),
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
              borderRadius: BorderRadius.circular(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    height: 40,
                    width: Get.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
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
              borderRadius: BorderRadius.circular(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    height: 40,
                    width: Get.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
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

  Widget _body() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 16.0),
          child: Obx(
            () => controller.orderedItems.value.isEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ShippingStatus.none.name,
                        style: Get.textTheme.bodySmall?.copyWith(
                          color: Get.theme.primaryColorDark.withOpacity(.9),
                        ),
                      ),
                    ],
                  )
                : ShippingItems(shippingItems: controller.orderedItems.value),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  'Order (${controller.itemLength.value} ${controller.itemLength.value > 1 ? 'items' : 'item'})',
                  style: Get.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
        const OrderItems(),
        const Divider(),
        Padding(
          padding: const EdgeInsets.only(
              top: 8.0, bottom: 8.0, left: 24.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: Get.textTheme.bodyLarge?.copyWith(
                  color: Get.theme.primaryColorDark.withOpacity(.8),
                ),
              ),
              Obx(
                () => Text(
                  '${CommonStrings.currency}${controller.subTotal.value.toStringAsFixed(2)}',
                  style: Get.textTheme.bodyLarge?.copyWith(
                    color: Get.theme.primaryColorDark.withOpacity(.8),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 8.0, bottom: 8.0, left: 24.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping & Handling',
                style: Get.textTheme.bodyLarge?.copyWith(
                  color: Get.theme.primaryColorDark.withOpacity(.8),
                ),
              ),
              Obx(
                () => Text(
                  '${CommonStrings.currency}${controller.shippingFee.value.toStringAsFixed(2)}',
                  style: Get.textTheme.bodyLarge?.copyWith(
                    color: Get.theme.primaryColorDark.withOpacity(.8),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Total',
                style: Get.textTheme.bodyLarge?.copyWith(
                  color: Get.theme.primaryColorDark.withOpacity(.8),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Obx(
                () => Text(
                  '${CommonStrings.currency}${controller.total.value.toStringAsFixed(2)}',
                  style: Get.textTheme.bodyLarge?.copyWith(
                    color: Get.theme.primaryColorDark.withOpacity(.8),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, bottom: 16.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  controller.shippingAddress.value,
                  style: Get.textTheme.bodySmall?.copyWith(
                    color: Get.theme.primaryColorDark.withOpacity(.9),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
