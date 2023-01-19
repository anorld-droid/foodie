import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.
class ApartmentTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String accountBalance;
  const ApartmentTopBar({super.key, required this.accountBalance});

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
      backgroundColor: Get.theme.backgroundColor,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Get.theme.primaryColorDark.withAlpha(100),
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
