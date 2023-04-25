import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/src/strings.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 25.04.2023.
class Executive extends StatelessWidget {
  const Executive({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        width: Get.width,
        height: 215.0,
        child: Card(
          elevation: 5.0,
          color: Get.theme.colorScheme.tertiary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.executive,
                          style: Get.textTheme.labelSmall?.copyWith(
                              color: Get.theme.colorScheme.onPrimary),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              '0NrQ y2Xn **** m706 P6P2',
                              style: Get.textTheme.labelSmall?.copyWith(
                                  color: Get.theme.colorScheme.onPrimary),
                              textAlign: TextAlign.justify,
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
                                                    color: Get.theme.colorScheme
                                                        .onPrimary
                                                        .withAlpha(200)),
                                          ),
                                          Text(
                                            '10/25',
                                            style: Get.textTheme.bodyMedium
                                                ?.copyWith(
                                                    color: Get.theme.colorScheme
                                                        .onPrimary),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            Strings.validThru,
                                            style: Get.textTheme.bodySmall
                                                ?.copyWith(
                                                    color: Get.theme.colorScheme
                                                        .onPrimary
                                                        .withAlpha(200)),
                                          ),
                                          Text(
                                            '10/25',
                                            style: Get.textTheme.bodyMedium
                                                ?.copyWith(
                                                    color: Get.theme.colorScheme
                                                        .onPrimary),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'Patrice Mulindi'.toUpperCase(),
                                      style: Get.textTheme.bodyMedium?.copyWith(
                                        color: Get.theme.colorScheme.onPrimary,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 0.0),
                              child: Text(
                                'foodie',
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
        ));
  }
}
