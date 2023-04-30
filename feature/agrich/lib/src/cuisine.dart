import 'package:agrich/src/cuisine_controller.dart';
import 'package:agrich/src/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 17.01.2023.
class Cuisine extends GetView<CuisineController> {
  const Cuisine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CuisineController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: const Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await controller.scan(),
        backgroundColor: Get.theme.colorScheme.surface,
        child: Icon(
          Icons.qr_code_scanner_sharp,
          color: Get.theme.colorScheme.primary,
          size: 32,
        ),
      ),
    );
  }
}
