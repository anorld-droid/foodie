import 'package:cart/src/controller.dart';
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
            )),
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
        _orderItems(),
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
                  controller.subTotal.value.toStringAsFixed(2),
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
                  controller.shippingFee.value.toStringAsFixed(2),
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
                  controller.total.value.toStringAsFixed(2),
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
            children: [
              Obx(
                () => Text(
                  controller.shippingStatus.value.name,
                  style: Get.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
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

  Widget _orderItems() {
    return SizedBox(
      height: Get.height / 1.9,
      child: Obx(
        () => ListView(
          key: Key(controller.itemLength.value.toString()),
          children: controller.items.value
              .map(
                (e) => _orderItem(e),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _orderItem(CartItem item) {
    return SizedBox(
      width: Get.width * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 48,
              backgroundImage: NetworkImage(
                item.photoUrl,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.name,
                          style: Get.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.deleteItem(item);
                              },
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30.0)),
                              child: Icon(
                                Icons.close,
                                color: Get.theme.primaryColorDark,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        item.stockTag,
                        style: Get.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w100,
                          color: Get.theme.primaryColorDark.withOpacity(.8),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Text(
                            "${CommonStrings.currency}${item.sellingPrice.value.toStringAsFixed(2)}",
                            style: Get.textTheme.bodySmall
                                ?.copyWith(fontWeight: FontWeight.w700),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Qty',
                                style: Get.textTheme.bodySmall
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),
                            InkWell(
                              onTap: () => controller.decrementQty(item),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30.0)),
                              child: Icon(
                                Icons.do_not_disturb_on_outlined,
                                color: Get.theme.primaryColorDark,
                                size: 24,
                              ),
                            ),
                            Obx(
                              () => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${item.quantity.value}',
                                  style: Get.textTheme.labelSmall
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => controller.incrementQty(item),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30.0)),
                              child: Icon(
                                Icons.add_circle_outline_outlined,
                                color: Get.theme.primaryColorDark,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
