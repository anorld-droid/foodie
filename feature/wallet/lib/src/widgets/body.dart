import 'dart:ui';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/src/controller.dart';
import 'package:wallet/src/strings.dart';
import 'package:wallet/src/widgets/membership_cards.dart';

class Body extends GetView<WalletController> {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const Executive(), _expenses()],
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
                    color: Get.theme.colorScheme.onBackground.withAlpha(200)),
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
                          style: Get.textTheme.labelSmall?.copyWith(
                              // fontWeight: FontWeight.bold,
                              // textBaseline: TextBaseline.alphabetic,
                              ),
                        ),
                        TextSpan(
                          text: '3,200',
                          style: Get.textTheme.labelSmall?.copyWith(
                              // fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Card(
            elevation: 2.5,
            color: Get.theme.colorScheme.onBackground,
            shadowColor: Get.theme.colorScheme.primaryContainer,
            child: Container(
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.onBackground,
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
                    color: Get.theme.colorScheme.background.withAlpha(200),
                  )),
            ),
          ),
          Column(
            children: [
              Text(
                Strings.creditLimit,
                style: Get.textTheme.bodySmall?.copyWith(
                    color: Get.theme.colorScheme.onBackground.withAlpha(200)),
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
                          style: Get.textTheme.labelSmall?.copyWith(shadows:
                                  // controller.hideContent.value
                                  //     ?
                                  [
                            Shadow(
                                blurRadius: 100,
                                offset: const Offset(
                                  2,
                                  1,
                                ),
                                color: Get.theme.colorScheme.onBackground)
                          ]
                              // : []
                              ),
                        ),
                        TextSpan(
                          text: '3,200',
                          style: Get.textTheme.labelSmall?.copyWith(),
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
