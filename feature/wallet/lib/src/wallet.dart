import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/src/controller.dart';
import 'package:wallet/src/widgets/body.dart';
import 'package:wallet/src/widgets/topbar.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 25.04.2023.
class Wallet extends GetView<WalletController> {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WalletController());
    return const Scaffold(
      appBar: TopBar(),
      body: Body(),
    );
  }
}
