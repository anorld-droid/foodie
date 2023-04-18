import 'package:delivery/src/controller.dart';
import 'package:delivery/src/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 13.04.2023.
class DeliveryDetails extends GetView<DeliveryController> {
  final ShippingModel shippingModel;
  const DeliveryDetails({
    super.key,
    required this.shippingModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.3,
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.background,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => _deliveryTime(controller.time.value,
                controller.statusTag(controller.status.value))),
            Divider(
              color: Colors.white70.withAlpha(130),
            ),
            Obx(() => _iconInfo(controller.status.value)),
            Divider(
              color: Colors.white70.withAlpha(130),
            ),
            Obx(
              () => controller.courier.value != null
                  ? _courierInfo()
                  : Padding(
                      padding: EdgeInsets.only(top: Get.height * 0.04),
                      child: Center(
                          child: Text(
                        'Pairing...',
                        style: Get.textTheme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      )),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _deliveryTime(String timeEstimate, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Column(
        children: [
          Text(
            'Estimated delivery time is $timeEstimate',
            style:
                Get.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            '$status!',
            style:
                Get.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }

  Widget _iconInfo(String status) {
    int state = status == 'Received'
        ? 1
        : status == 'Ready'
            ? 2
            : status == 'Shipping'
                ? 3
                : 4;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.receipt_long,
            color: state >= 1
                ? Get.theme.colorScheme.primary
                : Get.theme.colorScheme.onBackground.withAlpha(180),
          ),
          _separator(state >= 2),
          Icon(
            Icons.room_service,
            color: state >= 2
                ? Get.theme.colorScheme.primary
                : Get.theme.colorScheme.onBackground.withAlpha(180),
          ),
          _separator(state >= 3),
          Icon(
            Icons.directions_bike,
            color: state >= 3
                ? Get.theme.colorScheme.primary
                : Get.theme.colorScheme.onBackground.withAlpha(180),
          ),
          _separator(state >= 4),
          Icon(
            Icons.check_circle,
            color: state >= 4
                ? Get.theme.colorScheme.primary
                : Get.theme.colorScheme.onBackground.withAlpha(180),
          ),
        ],
      ),
    );
  }

  Widget _separator(bool status) {
    return Row(
      children: List.generate(
        8,
        (index) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            height: 4,
            width: 4,
            decoration: BoxDecoration(
                color: status
                    ? Get.theme.colorScheme.primary
                    : Get.theme.colorScheme.onBackground.withAlpha(180),
                borderRadius: BorderRadius.circular(30.0)),
          ),
        ),
      ),
    );
  }

  Widget _courierInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
      width: Get.width,
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            foregroundImage: NetworkImage(shippingModel.courier!.photoUrl),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shippingModel.courier!.name,
                  style: Get.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  Strings.courier,
                  style: Get.textTheme.bodySmall
                      ?.copyWith(fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          InkWell(
            onTap: controller.call,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.onBackground,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                Icons.call,
                color: Get.theme.colorScheme.background,
              ),
            ),
          )
        ],
      ),
    );
  }
}
