import 'package:cart/src/controller.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 08.02.2023.

class OrderItems extends GetView<Controller> {
  const OrderItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<Controller>();
    return Obx(
      () => SizedBox(
        height: controller.itemLength.value == 0
            ? Get.height * 0.05
            : Get.height * (0.15 * controller.itemLength.value),
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
                            '${CommonStrings.currency}${item.sellingPrice.value.toStringAsFixed(2)}',
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
                                  style: Get.textTheme.bodyLarge
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
