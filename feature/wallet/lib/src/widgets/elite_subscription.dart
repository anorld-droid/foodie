import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/src/strings.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 26.04.2023.

class EliteSubscription extends StatelessWidget {
  const EliteSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170.0,
      height: 100.0,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Get.theme.colorScheme.onPrimary),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  CommonStrings.appName,
                  style: Get.textTheme.headlineSmall?.copyWith(
                      color: Get.theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                Strings.eliteMember,
                style: Get.textTheme.labelSmall?.copyWith(
                    color: Get.theme.colorScheme.tertiary, fontSize: 14),
              ),
            ),
          ),
          Divider(
            color: Get.theme.colorScheme.primary,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.mostPopular,
                  style: Get.textTheme.bodyMedium?.copyWith(
                      color: Get.theme.colorScheme.tertiary, fontSize: 10),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
