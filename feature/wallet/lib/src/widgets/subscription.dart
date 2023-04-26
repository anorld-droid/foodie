import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/src/controller.dart';
import 'package:wallet/src/strings.dart';
import 'package:wallet/src/widgets/details.dart';
import 'package:wallet/src/widgets/elite_subscription.dart';
import 'package:wallet/src/widgets/executive_subscription.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 25.04.2023.

class Subscriptions extends GetView<WalletController> {
  const Subscriptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_executiveCard(), _eliteCard()],
    );
  }

  Widget _executiveCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 16.0),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ExecutiveSubscription(),
                const SizedBox(
                  width: 12.0,
                ),
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.annualReward,
                        style: Get.textTheme.bodyLarge,
                      ),
                      Text(
                        Strings.executive,
                        style: Get.textTheme.labelSmall?.copyWith(
                          color: Get.theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      !controller.learnMore.value
                          ? InkWell(
                              onTap: () async {
                                await controller.checkout(controller
                                    .subscription.value!.executivePrice);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: Get.width * 0.35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Get.theme.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                                child: Text(Strings.selectExecutive,
                                    style: Get.textTheme.bodySmall?.copyWith(
                                      color: Get.theme.colorScheme.onPrimary,
                                    )),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => controller.learnMore.value
                ? Column(
                    children: [
                      BenefitDetails(
                          benefits:
                              controller.subscription.value!.executiveBenefits,
                          showDetails: controller.executiveBenefitDetails),
                      InkWell(
                        onTap: controller.executiveBenefitDetails.toggle,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Strings.seeBenefitDetails,
                              style: Get.textTheme.bodyMedium?.copyWith(
                                  color: Get.theme.colorScheme.primary),
                            ),
                            Obx(() => Icon(
                                  controller.executiveBenefitDetails.value
                                      ? Icons.expand_less
                                      : Icons.expand_more,
                                  color: Get.theme.colorScheme.primary,
                                  size: 32,
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          '${controller.subscription.value!.executivePrice}/Month',
                          style: Get.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await controller.checkout(
                              controller.subscription.value!.executivePrice);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: Get.width * 0.55,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Get.theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(Strings.selectExecutive,
                              style: Get.textTheme.bodyMedium?.copyWith(
                                color: Get.theme.colorScheme.onPrimary,
                              )),
                        ),
                      )
                    ],
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _eliteCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 10.0),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const EliteSubscription(),
                const SizedBox(
                  width: 12.0,
                ),
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.everydayValue,
                        style: Get.textTheme.bodyLarge,
                      ),
                      Text(
                        Strings.elite,
                        style: Get.textTheme.labelSmall?.copyWith(
                          color: Get.theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      !controller.learnMore.value
                          ? InkWell(
                              onTap: () async {
                                await controller.checkout(
                                    controller.subscription.value!.elitePrice);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: Get.width * 0.35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Get.theme.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                                child: Text(Strings.selectElite,
                                    style: Get.textTheme.bodySmall?.copyWith(
                                      color: Get.theme.colorScheme.onPrimary,
                                    )),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => controller.learnMore.value
                ? Column(
                    children: [
                      BenefitDetails(
                        benefits: controller.subscription.value!.eliteBenefits,
                        showDetails: controller.eliteBenefitDetails,
                      ),
                      InkWell(
                        onTap: controller.eliteBenefitDetails.toggle,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Strings.seeBenefitDetails,
                              style: Get.textTheme.bodyMedium?.copyWith(
                                  color: Get.theme.colorScheme.primary),
                            ),
                            Obx(() => Icon(
                                  controller.executiveBenefitDetails.value
                                      ? Icons.expand_less
                                      : Icons.expand_more,
                                  color: Get.theme.colorScheme.primary,
                                  size: 32,
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          '${controller.subscription.value!.elitePrice}/Month',
                          style: Get.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await controller.checkout(
                              controller.subscription.value!.elitePrice);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: Get.width * 0.55,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Get.theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(Strings.selectElite,
                              style: Get.textTheme.bodyMedium?.copyWith(
                                color: Get.theme.colorScheme.onPrimary,
                              )),
                        ),
                      )
                    ],
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
