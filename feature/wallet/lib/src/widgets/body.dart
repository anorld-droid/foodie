import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wallet/src/controller.dart';
import 'package:wallet/src/widgets/membership_cards.dart';

class Body extends GetView<WalletController> {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [Executive()],
    );
  }
}
