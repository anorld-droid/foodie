import 'package:cart/src/controller.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 08.02.2023.

class OrderItems extends GetView<CartController> {
  const OrderItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: controller.itemLength.value == 0
              ? Get.height * 0.05
              : Get.height * (0.185 * controller.itemLength.value),
          child: Column(
            key: Key(controller.itemLength.value.toString()),
            children: controller.items.value
                .map(
                  (e) => _orderItem(e),
                )
                .toList(),
          ),
        ));
  }

  Widget _orderItem(CartItem item) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Get.theme.colorScheme.onBackground.withOpacity(0.4),
            Get.theme.colorScheme.onBackground.withOpacity(0.1),
          ],
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
        ),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          width: 1.0,
          color: Get.theme.colorScheme.onBackground.withOpacity(0.05),
        ),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Get.theme.colorScheme.primaryContainer,
                    image: DecorationImage(
                        image: NetworkImage(
                          item.photoUrl,
                        ),
                        fit: BoxFit.contain),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width * 0.45,
                              child: Text(
                                item.name,
                                style: Get.textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.deleteItem(item);
                                  },
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30.0)),
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
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Text(
                            item.store,
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
                              () => RichText(
                                text: TextSpan(
                                  text: '',
                                  children: [
                                    WidgetSpan(
                                      child: Transform.translate(
                                          offset: const Offset(0, -8),
                                          child: Text(
                                            CommonStrings.currency
                                                .toLowerCase(),
                                            style: Get.textTheme.bodySmall
                                                ?.copyWith(
                                              fontWeight: FontWeight.w100,
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                            ),
                                          )),
                                    ),
                                    TextSpan(
                                      text: item.sellingPrice.value
                                          .toStringAsFixed(2),
                                      style: Get.textTheme.bodyLarge?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Get.theme.colorScheme.onSecondary),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () => controller.incrementQty(item),
                                    child: Container(
                                      padding: const EdgeInsets.all(2.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Get
                                                .theme.colorScheme.secondary),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Get.theme.colorScheme.background,
                                            const Color.fromARGB(
                                                181, 5, 52, 49),
                                            const Color.fromARGB(71, 5, 52, 49),
                                          ],
                                          stops: const [0.5, 0.8, 1.0],
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Get.theme.primaryColorDark,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0, right: 2.0),
                                      child: Text(
                                        '${item.quantity.value}',
                                        style: Get.textTheme.bodyLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: InkWell(
                                      onTap: () =>
                                          controller.decrementQty(item),
                                      child: Icon(
                                        Icons.remove,
                                        color:
                                            Get.theme.colorScheme.onBackground,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
                color: item.stockTag == 1
                    ? Get.theme.colorScheme.primary
                    : Get.theme.colorScheme.error,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                )),
            child: Text(
              item.stockTag == 1 ? 'In stock' : 'Out of Stock',
              style: Get.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w400,
                // color:
                //     Get.theme.colorScheme.background,
              ),
            ),
          )
        ],
      ),
    );
  }
}
