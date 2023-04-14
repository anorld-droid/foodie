import 'package:delivery/src/controller.dart';
import 'package:delivery/src/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 13.04.2023.
class DeliveryDetails extends GetView<Controller> {
  const DeliveryDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.3,
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.background,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: [
          _deliveryTime('', ''),
          const Divider(),
          _iconInfo(''),
          const Divider(),
        ],
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
            style: Get.textTheme.bodyLarge,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Row(
        children: [
          Icon(
            Icons.receipt_long,
            color: status == 'Recieved'
                ? Get.theme.colorScheme.primary
                : Get.theme.colorScheme.onBackground,
          ),
          _separator(status == 'Recieved'),
          Icon(
            Icons.room_service,
            color: status == 'Ready'
                ? Get.theme.colorScheme.primary
                : Get.theme.colorScheme.onBackground,
          ),
          _separator(status == 'Ready'),
          Icon(
            Icons.directions_bike,
            color: status == 'Shipping'
                ? Get.theme.colorScheme.primary
                : Get.theme.colorScheme.onBackground,
          ),
          _separator(status == 'Shipping'),
          Icon(
            Icons.check_circle,
            color: status == 'Delivered'
                ? Get.theme.colorScheme.primary
                : Get.theme.colorScheme.onBackground,
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
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height: 12,
            width: 12,
            decoration: BoxDecoration(
                color: status
                    ? Get.theme.colorScheme.primary
                    : Get.theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(30.0)),
          ),
        ),
      ),
    );
  }

  Widget _courierInfo(String url, String name) {
    return SizedBox(
      width: Get.width,
      child: Row(
        children: [
          CircleAvatar(
            radius: 64,
            foregroundImage: NetworkImage(url),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  name,
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
            child: Container(
              padding: const EdgeInsets.all(12.0),
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
