import 'dart:ui';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/src/controller.dart';
import 'package:wallet/src/strings.dart';
import 'package:wallet/src/widgets/membership_cards.dart';
import 'package:wallet/src/widgets/subscription.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 25.04.2023.

class Body extends GetView<WalletController> {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Executive(),
          _expenses(),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              left: 24,
              right: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.subscribe,
                  style: Get.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: controller.learnMore.toggle,
                  child: Text(
                    Strings.learnMore,
                    style: Get.textTheme.bodySmall?.copyWith(
                        color: Get.theme.colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const Subscriptions()
        ],
      ),
    );
  }

  Widget _expenses() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                Strings.currentBalance,
                style: Get.textTheme.bodySmall?.copyWith(
                    color: Get.theme.colorScheme.onBackground.withAlpha(200),
                    fontSize: 10),
              ),
              Obx(
                () => ImageFiltered(
                  imageFilter: controller.hideContent.value
                      ? ImageFilter.blur(sigmaX: 5, sigmaY: 5)
                      : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                  child: RichText(
                    text: TextSpan(
                      text: '',
                      children: [
                        TextSpan(
                          text: '${CommonStrings.currency.toUpperCase()}. ',
                          style: Get.textTheme.bodyLarge,
                        ),
                        TextSpan(
                          text: '3,200',
                          style: Get.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  width: .0,
                  color: Get.theme.colorScheme.onBackground.withOpacity(0.2),
                ),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
              child: Text(Strings.topUp,
                  style: Get.textTheme.bodySmall?.copyWith(
                    color: Get.theme.colorScheme.onPrimary,
                  )),
            ),
          ),
          Column(
            children: [
              Text(
                Strings.creditLimit,
                style: Get.textTheme.bodySmall?.copyWith(
                    color: Get.theme.colorScheme.onBackground.withAlpha(200),
                    fontSize: 10),
              ),
              Obx(
                () => ImageFiltered(
                  imageFilter: controller.hideContent.value
                      ? ImageFilter.blur(sigmaX: 5, sigmaY: 5)
                      : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                  child: RichText(
                    text: TextSpan(
                      text: '',
                      children: [
                        TextSpan(
                            text: '${CommonStrings.currency.toUpperCase()}. ',
                            style: Get.textTheme.bodyLarge),
                        TextSpan(
                          text: '3,200',
                          style: Get.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
