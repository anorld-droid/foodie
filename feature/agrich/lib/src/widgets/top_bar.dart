import 'package:agrich/src/cuisine_controller.dart';
import 'package:agrich/src/strings.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.
class CuisineTopBar extends GetView<CuisineController>
    implements PreferredSizeWidget {
  final String accountBalance;
  const CuisineTopBar({super.key, required this.accountBalance});

  @override
  Widget build(BuildContext context) {
    Get.find<CuisineController>();
    return AppBar(
      elevation: 2,
      shadowColor: Get.theme.primaryColorDark.withOpacity(.35),
      title: CustomTextField(
          onIconTap: () async {
            controller.search(controller.searchController.text);
          },
          onSubmitted: (value) async {
            controller.search(value);
          },
          icon: Icons.search,
          height: 40,
          textStyle: Get.textTheme.bodySmall,
          focusNode: controller.focusNode,
          textEditingController: controller.searchController,
          textInputType: TextInputType.text,
          hintText: Strings.searchHintText,
          borderRadius: 30,
          maxLength: 16,
          backgroundColor: Get.theme.primaryColorDark.withOpacity(.12)),
      backgroundColor: Get.theme.backgroundColor,
      actions: [
        IconButton(
          onPressed: () async => await controller.subscriptionOptions(),
          icon: Icon(
            Icons.money_off,
            color: Get.theme.primaryColorDark,
          ),
          color: Get.theme.primaryColorDark,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
