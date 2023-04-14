import 'package:delivery/src/controller.dart';
import 'package:delivery/src/widgets/body.dart';
import 'package:delivery/src/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 13.04.2023.
class Delivery extends StatelessWidget {
  const Delivery({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Controller(), fenix: true);
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: DeliveryDetails(),
    );
  }
}
