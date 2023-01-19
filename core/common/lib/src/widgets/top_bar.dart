import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class TriceTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String accountBalance;

  const TriceTopBar({Key? key, required this.accountBalance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      leadingWidth: accountBalance.length < 6
          ? 96
          : accountBalance.length < 7
              ? 104
              : 120,
      title: Text(CommonStrings.appName, style: Get.textTheme.displaySmall),
      centerTitle: true,
      backgroundColor: Get.theme.backgroundColor,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: SizedBox(
            height: 32,
            width: 32,
            child: SvgPicture.asset(
              CommonStrings.duplicateIcon,
              package: 'common',
              color: Get.theme.primaryColorDark,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
