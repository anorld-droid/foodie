import 'package:delivery/src/controller.dart';
import 'package:delivery/src/widgets/body.dart';
import 'package:delivery/src/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 13.04.2023.
class DeliveryView extends GetView<DeliveryController> {
  final ShippingModel shippingModel;
  const DeliveryView({super.key, required this.shippingModel});

  @override
  Widget build(BuildContext context) {
    Get.put(DeliveryController(model: shippingModel));
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.onBackground.withAlpha(230),
      body: const Body(),
      bottomNavigationBar: DeliveryDetails(
        shippingModel: shippingModel,
      ),
    );
  }
}
