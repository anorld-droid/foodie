import 'package:common/common.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wallet/src/controller.dart';
import 'package:wallet/src/strings.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 25.04.2023.

class SubscriptionMessage extends GetView<WalletController> {
  const SubscriptionMessage({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Text(
              Strings.message.replaceAll(
                  ':contact', controller.subscription.value!.contact),
              style: Get.textTheme.bodyLarge,
            ),
          )
        ],
      ),
    );
  }
}
