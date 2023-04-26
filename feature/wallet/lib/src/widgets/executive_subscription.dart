import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/src/strings.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 25.04.2023.

class ExecutiveSubscription extends StatelessWidget {
  const ExecutiveSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170.0,
      height: 100.0,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Get.theme.colorScheme.tertiary),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: RadialGradient(
                center: Alignment.topRight,
                tileMode: TileMode.decal,
                colors: [
                  Colors.grey.shade900,
                  Colors.grey.shade900,
                ],
                radius: 0.7),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              gradient: RadialGradient(
                  center: const Alignment(-0.3, 1),
                  tileMode: TileMode.decal,
                  colors: [
                    Colors.grey.shade900,
                    Colors.grey.shade900,
                  ],
                  radius: 0.7,
                  focal: const Alignment(-0.6, 1),
                  focalRadius: 1),
            ),
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
                    Strings.executiveMember,
                    style: Get.textTheme.labelSmall?.copyWith(
                        color: Get.theme.colorScheme.onPrimary, fontSize: 14),
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
                      Strings.mostRewards,
                      style: Get.textTheme.bodyMedium?.copyWith(
                          color: Get.theme.colorScheme.onPrimary, fontSize: 10),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
