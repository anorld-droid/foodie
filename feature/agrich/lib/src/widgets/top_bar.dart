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
      elevation: 0,
      leading: Container(
          padding: const EdgeInsets.only(left: 16),
          alignment: AlignmentDirectional.center,
          child: RichText(
            text: TextSpan(
              text: '${CommonStrings.currency}$accountBalance',
              style: Get.textTheme.displaySmall
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          )),
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
      leadingWidth: accountBalance.length < 6
          ? 96
          : accountBalance.length < 7
              ? 104
              : 120,
      backgroundColor: Get.theme.backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
