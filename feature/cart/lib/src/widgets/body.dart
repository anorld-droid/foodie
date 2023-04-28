import 'package:cart/src/controller.dart';
import 'package:cart/src/utils/strings.dart';
import 'package:cart/src/widgets/order_item.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartBody extends GetView<CartController> {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(color: Get.theme.colorScheme.background),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, top: 8.0, bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => RichText(
                      text: TextSpan(
                        text: Strings.order,
                        style: Get.textTheme.bodyMedium,
                        children: [
                          WidgetSpan(
                            child: Transform.translate(
                                offset: const Offset(2, -8),
                                child: Text(
                                  '( ${controller.itemLength.value}',
                                  style: Get.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w100,
                                    textBaseline: TextBaseline.alphabetic,
                                  ),
                                )),
                          ),
                          WidgetSpan(
                            child: Transform.translate(
                                offset: const Offset(4.5, -8),
                                child: Text(
                                  controller.itemLength.value > 1
                                      ? Strings.items
                                      : Strings.item,
                                  style: Get.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w100,
                                    textBaseline: TextBaseline.alphabetic,
                                  ),
                                )),
                          ),
                        ],
                      ),
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
                    Strings.subtotal,
                    style: Get.textTheme.bodyLarge?.copyWith(
                      color: Get.theme.primaryColorDark.withOpacity(.8),
                    ),
                  ),
                  Obx(
                    () => RichText(
                      text: TextSpan(
                        text: '',
                        children: [
                          WidgetSpan(
                            child: Transform.translate(
                                offset: const Offset(-2, -8),
                                child: Text(
                                  CommonStrings.currency.toLowerCase(),
                                  style: Get.textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w100,
                                      textBaseline: TextBaseline.alphabetic,
                                      color: Get.theme.colorScheme.onBackground
                                          .withOpacity(.8)),
                                )),
                          ),
                          TextSpan(
                            text: valueWithDecinal
                                .format(controller.subTotal.value),
                            style: Get.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w100,
                                color: Get.theme.colorScheme.onBackground
                                    .withOpacity(.8)),
                          ),
                        ],
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
                    Strings.shippingHandling,
                    style: Get.textTheme.bodyLarge?.copyWith(
                      color: Get.theme.primaryColorDark.withOpacity(.8),
                    ),
                  ),
                  Obx(
                    () => RichText(
                      text: TextSpan(
                        text: '',
                        children: [
                          WidgetSpan(
                            child: Transform.translate(
                                offset: const Offset(-2, -8),
                                child: Text(
                                  CommonStrings.currency.toLowerCase(),
                                  style: Get.textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w100,
                                      textBaseline: TextBaseline.alphabetic,
                                      color: Get.theme.colorScheme.onBackground
                                          .withOpacity(.8)),
                                )),
                          ),
                          TextSpan(
                            text: valueWithDecinal
                                .format(controller.shippingFee.value),
                            style: Get.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w100,
                                color: Get.theme.colorScheme.onBackground
                                    .withOpacity(.8)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 24.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(Strings.total, style: Get.textTheme.bodyLarge),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Obx(
                    () => RichText(
                      text: TextSpan(
                        text: '',
                        children: [
                          WidgetSpan(
                            child: Transform.translate(
                                offset: const Offset(-2, -8),
                                child: Text(
                                  CommonStrings.currency.toLowerCase(),
                                  style: Get.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    textBaseline: TextBaseline.alphabetic,
                                  ),
                                )),
                          ),
                          TextSpan(
                            text:
                                valueWithDecinal.format(controller.total.value),
                            style: Get.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Get.theme.colorScheme.onBackground),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding:
                  const EdgeInsets.only(left: 24.0, bottom: 16.0, top: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.destination,
                          style: Get.textTheme.bodyLarge,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Obx(
                          () => Text(controller.shippingAddress.value,
                              style: Get.textTheme.bodySmall?.copyWith(
                                color:
                                    Get.theme.primaryColorDark.withOpacity(.9),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
