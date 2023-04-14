import 'package:delivery/src/widgets/app_bar.dart';
import 'package:delivery/src/widgets/map.dart';
import 'package:flutter/widgets.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 13.04.2023.
class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [TopBar(), DeliveryMap()],
    );
  }
}
