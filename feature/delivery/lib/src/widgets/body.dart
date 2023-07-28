import 'package:delivery/src/controller.dart';
import 'package:delivery/src/widgets/app_bar.dart';
import 'package:delivery/src/widgets/map.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 13.04.2023.
class Body extends GetView<DeliveryController> {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<DeliveryController>();
    return const Stack(
      children: [
        DeliveryMap(),
        TopBar(),
      ],
    );
  }
}
