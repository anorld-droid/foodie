import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 17.01.2023.
class Apartment extends StatelessWidget {
  const Apartment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        CommonStrings.underDevelopment,
        style: Get.textTheme.bodyLarge,
      ),
    );
  }
}
