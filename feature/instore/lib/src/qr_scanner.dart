import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instore/src/controller.dart';
import 'package:instore/src/widgets/body.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 29.04.2023.
class QRScanner extends GetView<QRController> {
  const QRScanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(QRController());
    return const Body();
  }
}
