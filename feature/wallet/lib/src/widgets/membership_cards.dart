import 'dart:ui';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/src/controller.dart';
import 'package:wallet/src/strings.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 25.04.2023.
class MembershipCard extends GetView<WalletController> {
  const MembershipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      width: Get.width,
      height: 215.0,
      child: Obx(
        () => Card(
          elevation: 6.0,
          color: controller.user.value!.account == Strings.executive
              ? Get.theme.colorScheme.tertiary
              : Get.theme.colorScheme.onPrimary,
          shadowColor: Get.theme.colorScheme.onBackground.withAlpha(170),
          semanticContainer: false,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: controller.user.value!.account == Strings.executive
                    ? Get.theme.colorScheme.tertiary
                    : Get.theme.colorScheme.onPrimary),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                gradient: controller.user.value!.account == Strings.executive
                    ? RadialGradient(
                        center: Alignment.topRight,
                        tileMode: TileMode.decal,
                        colors: [
                          Colors.grey.shade900,
                          Colors.grey.shade900,
                        ],
                        radius: 0.7,
                      )
                    : null,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  gradient: controller.user.value!.account == Strings.executive
                      ? RadialGradient(
                          center: const Alignment(-0.3, 1),
                          tileMode: TileMode.decal,
                          colors: [
                            Colors.grey.shade900,
                            Colors.grey.shade900,
                          ],
                          radius: 0.7,
                          focal: const Alignment(-0.6, 1),
                          focalRadius: 1,
                        )
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.user.value!.account,
                              style: Get.textTheme.labelSmall?.copyWith(
                                  color: controller.user.value!.account ==
                                          Strings.executive
                                      ? Get.theme.colorScheme.onPrimary
                                      : Get.theme.colorScheme.tertiary),
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
                                        text:
                                            '${CommonStrings.currency.toUpperCase()}. ',
                                        style:
                                            Get.textTheme.bodySmall?.copyWith(
                                          color: controller
                                                      .user.value!.account ==
                                                  Strings.executive
                                              ? Get.theme.colorScheme.onPrimary
                                              : Get.theme.colorScheme.tertiary,
                                        ),
                                      ),
                                      TextSpan(
                                        text: valueWithDecinal.format(
                                            controller.wallet.value?.balance),
                                        style:
                                            Get.textTheme.bodySmall?.copyWith(
                                          color: controller
                                                      .user.value!.account ==
                                                  Strings.executive
                                              ? Get.theme.colorScheme.onPrimary
                                              : Get.theme.colorScheme.tertiary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Obx(
                          () => Expanded(
                            child: Center(
                              child: Text(
                                controller.userID.value,
                                style: Get.textTheme.bodyMedium?.copyWith(
                                  color: controller.user.value!.account ==
                                          Strings.executive
                                      ? Get.theme.colorScheme.onPrimary
                                      : Get.theme.colorScheme.tertiary,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            Strings.memberSince,
                                            style: Get.textTheme.bodySmall
                                                ?.copyWith(
                                              color: controller.user.value!
                                                          .account ==
                                                      Strings.executive
                                                  ? Get.theme.colorScheme
                                                      .onPrimary
                                                      .withAlpha(200)
                                                  : Get.theme.colorScheme
                                                      .tertiary
                                                      .withAlpha(200),
                                            ),
                                          ),
                                          Obx(
                                            () => Text(
                                              controller.timeStamp.value,
                                              style: Get.textTheme.bodySmall
                                                  ?.copyWith(
                                                      color: controller
                                                                  .user
                                                                  .value!
                                                                  .account ==
                                                              Strings.executive
                                                          ? Get
                                                              .theme
                                                              .colorScheme
                                                              .onPrimary
                                                          : Get
                                                              .theme
                                                              .colorScheme
                                                              .tertiary),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            Strings.validThru,
                                            style: Get.textTheme.bodySmall
                                                ?.copyWith(
                                                    color: controller
                                                                .user
                                                                .value!
                                                                .account ==
                                                            Strings.executive
                                                        ? Get.theme.colorScheme
                                                            .onPrimary
                                                            .withAlpha(200)
                                                        : Get.theme.colorScheme
                                                            .tertiary
                                                            .withAlpha(200)),
                                          ),
                                          Obx(
                                            () => Text(
                                              yearMonthFormatter.format(
                                                  controller
                                                      .wallet.value!.validThru),
                                              style: Get.textTheme.bodySmall
                                                  ?.copyWith(
                                                      color: controller
                                                                  .user
                                                                  .value!
                                                                  .account ==
                                                              Strings.executive
                                                          ? Get
                                                              .theme
                                                              .colorScheme
                                                              .onPrimary
                                                          : Get
                                                              .theme
                                                              .colorScheme
                                                              .tertiary),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Obx(
                                      () => controller.user.value!.shippingInfo
                                                  ?.name !=
                                              null
                                          ? Text(
                                              controller.user.value!
                                                  .shippingInfo!.name!,
                                              style: Get.textTheme.bodyMedium
                                                  ?.copyWith(
                                                color: controller.user.value!
                                                            .account ==
                                                        Strings.executive
                                                    ? Get.theme.colorScheme
                                                        .onPrimary
                                                    : Get.theme.colorScheme
                                                        .tertiary,
                                              ),
                                              textAlign: TextAlign.start,
                                            )
                                          : const SizedBox(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 0.0),
                              child: Text(
                                CommonStrings.appName,
                                style: Get.textTheme.headlineLarge?.copyWith(
                                    color: Get.theme.colorScheme.primary,
                                    fontWeight: FontWeight.w100),
                              ),
                            )
                          ],
                        )
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
