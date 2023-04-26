import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/src/controller.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 26.04.2023.
class BenefitDetails extends GetView<WalletController> {
  final Map<String, String> benefits;
  final RxBool showDetails;
  const BenefitDetails(
      {super.key, required this.benefits, required this.showDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Column(
          children: List.generate(benefits.keys.length, (index) {
        String key = benefits.keys.elementAt(index);
        return Obx(() => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 8),
                  child: Icon(
                    Icons.done,
                    color: Get.theme.colorScheme.primary,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          key,
                          style: key.contains('Annual')
                              ? Get.textTheme.bodyLarge?.copyWith(
                                  color: Get.theme.colorScheme.error,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)
                              : Get.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                        ),
                      ),
                      showDetails.value
                          ? Text(
                              benefits[key]!,
                              style: Get.textTheme.bodyLarge,
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ],
            ));
      })),
    );
  }
}
