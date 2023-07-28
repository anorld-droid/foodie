import 'package:common/common.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/src/controller.dart';
import 'package:wallet/src/strings.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 25.04.2023.

class SubscriptionMessage extends GetView<WalletController> {
  const SubscriptionMessage({super.key});

  @override
  Widget build(BuildContext context) {
    CommonController commonController = Get.find<CommonController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Strings.subject,
              style: Get.textTheme.headlineLarge
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                    text: Strings.subtitle,
                    children: [
                      TextSpan(
                          text: Strings.message,
                          style: Get.textTheme.bodyLarge),
                      TextSpan(
                        text: Strings.contact.replaceAll(
                            ':contact', controller.subscription.value!.contact),
                        style: Get.textTheme.bodyLarge
                            ?.copyWith(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => commonController
                              .call(controller.subscription.value!.contact),
                      ),
                      TextSpan(
                          text: Strings.messageEnd,
                          style: Get.textTheme.bodyLarge),
                    ],
                    style: Get.textTheme.bodyLarge),
              ))
        ],
      ),
    );
  }
}
