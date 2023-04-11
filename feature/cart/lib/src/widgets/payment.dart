import 'package:cart/src/controller.dart';
import 'package:cart/src/utils/strings.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Payment extends GetView<Controller> {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.onBackground,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              width: 1.0,
              color: Get.theme.colorScheme.background.withOpacity(0.05),
            ),
          ),
          margin: const EdgeInsets.only(
              top: 32.0, left: 32.0, right: 32.0, bottom: 16.0),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.total,
                style: Get.textTheme.bodyLarge?.copyWith(
                  color: Get.theme.colorScheme.background,
                ),
              ),
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
                                  color: Get.theme.colorScheme.background),
                            )),
                      ),
                      TextSpan(
                        text: controller.total.value.toStringAsFixed(2),
                        style: Get.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Get.theme.colorScheme.background),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Get.theme.colorScheme.onBackground.withOpacity(0.6),
                    Get.theme.colorScheme.onBackground.withOpacity(0.3),
                  ],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                ),
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  width: 1.0,
                  color: Get.theme.colorScheme.background.withOpacity(0.05),
                ),
              ),
              margin: const EdgeInsets.all(32.0),
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'M-pesa',
                style: Get.textTheme.bodyLarge,
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Get.theme.colorScheme.onBackground.withOpacity(0.6),
                      Get.theme.colorScheme.onBackground.withOpacity(0.3),
                    ],
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    width: 1.0,
                    color: Get.theme.colorScheme.background.withOpacity(0.05),
                  ),
                ),
                margin: const EdgeInsets.all(32.0),
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Airtel Money',
                  style: Get.textTheme.bodyLarge,
                ))
          ],
        ),
      ],
    );
  }
}
