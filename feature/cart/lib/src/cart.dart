import 'package:cart/src/controller.dart';
import 'package:cart/src/widgets/top_bar.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.
class Cart extends GetView<Controller> {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Controller());
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                alignment: AlignmentDirectional.center,
                height: 40,
                width: Get.width * 0.50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  color: Get.theme.primaryColorDark,
                ),
                child: Text(
                  'Checkout',
                  style: Get.textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Get.theme.backgroundColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: CustomTextField(
            textEditingController: controller.buildingController,
            textInputType: TextInputType.name,
            borderRadius: 8,
            height: 48,
            hintText: 'Building or Street name',
            labelText: 'Building',
            backgroundColor: Get.theme.backgroundColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: CustomTextField(
            textEditingController: controller.floorController,
            textInputType: TextInputType.name,
            borderRadius: 8,
            height: 48,
            hintText: 'Floor No (Optional)',
            labelText: 'Floor No',
            backgroundColor: Get.theme.backgroundColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: CustomTextField(
            textEditingController: controller.roomController,
            textInputType: TextInputType.name,
            borderRadius: 8,
            height: 48,
            hintText: 'Room No (Optional) ',
            labelText: 'Room No',
            backgroundColor: Get.theme.backgroundColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: CustomTextField(
            textEditingController: controller.landmarkController,
            textInputType: TextInputType.name,
            borderRadius: 8,
            height: 48,
            hintText: 'Landmark',
            labelText: 'Landmark',
            backgroundColor: Get.theme.backgroundColor,
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Order (${controller.cartItems.value.length} ${controller.cartItems.value.length > 1 ? 'items' : 'item'})',
                style: Get.textTheme.labelSmall
                    ?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        _orderItems(),
        const Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Summary (${CommonStrings.currency})',
                style: Get.textTheme.labelSmall
                    ?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
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
                'Subtotal',
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w100,
                  color: Get.theme.primaryColorDark.withOpacity(.8),
                ),
              ),
              Text(
                controller.subTotal().toStringAsFixed(2),
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w100,
                  color: Get.theme.primaryColorDark.withOpacity(.8),
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
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w100,
                  color: Get.theme.primaryColorDark.withOpacity(.8),
                ),
              ),
              Text(
                controller.shippingFee().toStringAsFixed(2),
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w100,
                  color: Get.theme.primaryColorDark.withOpacity(.8),
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
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w100,
                  color: Get.theme.primaryColorDark.withOpacity(.8),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                controller.total().toStringAsFixed(2),
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w100,
                  color: Get.theme.primaryColorDark.withOpacity(.8),
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Shipping Info',
                style: Get.textTheme.labelSmall
                    ?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, bottom: 16.0, right: 8.0),
          child: Row(
            children: [
              Obx(
                () => Text(
                  controller.shippingStatus.value.name,
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w100,
                    color: Get.theme.primaryColorDark.withOpacity(.8),
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
    return Column(
      children: List.generate(
        controller.cartItems.value.length,
        (index) => _orderItem(
          controller.cartItems.value[index],
        ),
      ),
    );
  }

  Widget _orderItem(CartItem item) {
    return Padding(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: Get.textTheme.labelSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                item.stockTag.name,
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w100,
                  color: Get.theme.primaryColorDark.withOpacity(.8),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "${CommonStrings.currency} ${item.price.toStringAsFixed(2)}",
                style: Get.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: InkWell(
                  onTap: controller.decrementQty,
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  child: Icon(
                    Icons.close,
                    color: Get.theme.primaryColorDark,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Qty',
                      style: Get.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  InkWell(
                    onTap: controller.decrementQty,
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                    child: Icon(
                      Icons.do_not_disturb_on_outlined,
                      color: Get.theme.primaryColorDark,
                      size: 24,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${item.quantity}',
                      style: Get.textTheme.labelSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  InkWell(
                    onTap: controller.incrementQty,
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
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
    );
  }
}
