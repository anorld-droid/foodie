import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 17.01.2023.
class Apartment extends StatelessWidget {
  const Apartment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          CommonStrings.underDevelopmentTitle,
          style: Get.textTheme.bodyLarge?.copyWith(
            letterSpacing: 0.0,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          CommonStrings.underDevelopmentDesc,
          style: Get.textTheme.bodySmall?.copyWith(
              color: Get.textTheme.bodyLarge?.color?.withOpacity(.8)),
        ),
      ],
    );
  }
}
