import 'package:cart/src/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 08.02.2023.
class  extends GetView<Controller> {
  final List<ShippingModel> shippingItems;
  const ShippingItems({
    super.key,
    required this.shippingItems,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<Controller>();
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
        child: SizedBox(
          height: 200,
          child: ListView(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              for (var shippingItem in shippingItems)
                for (var cartItem in shippingItem.items)
                  _itemLayout(cartItem, shippingItem.status)
            ],
          ),
        ));
  }

  Widget _itemLayout(CartItem item) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: const CircleBorder(),
              elevation: !Get.isDarkMode ? 0 : 7,
              child: CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(
                  item.photoUrl,
                ),
                backgroundColor: Get.theme.primaryColorDark.withOpacity(0.12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Text(
                item.name,
                style: Get.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                status,
                style: Get.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w100,
                  color: Get.theme.primaryColorDark.withOpacity(.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
