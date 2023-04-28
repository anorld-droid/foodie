import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/src/controller.dart';
import 'package:wallet/src/strings.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 25.04.2023.
class Topup extends GetView<WalletController> {
  const Topup({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: ThemeService(isDarkMode: controller.isDarkMode).topUpColors,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Strings.amountHintText,
                style: Get.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Get.theme.colorScheme.onBackground),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextField(
                style: Get.textTheme.bodyLarge,
                keyboardType: TextInputType.number,
                cursorColor: Get.theme.colorScheme.onBackground,
                controller: controller.amountController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Get.theme.colorScheme.onBackground),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Get.theme.colorScheme.onBackground),
                  ),
                  fillColor: Get.theme.colorScheme.primaryContainer,
                  focusColor: Get.theme.colorScheme.primaryContainer,
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: Get.back<void>,
                    child: Text(
                      Strings.cancel,
                      style: Get.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Get.theme.colorScheme.onBackground),
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  InkWell(
                    onTap: controller.topUpPayment,
                    child: Text(
                      Strings.proceed,
                      style: Get.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Get.theme.colorScheme.primary),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
