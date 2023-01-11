import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/domain/theme.dart';

import 'gradient_icon.dart';

class TriceTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String accountBal;
  const TriceTopBar({Key? key, this.accountBal = "20.43"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Strings str = Strings();
    return SliverAppBar(
      elevation: 0,
      leading: Container(
          padding: const EdgeInsets.only(left: 16),
          alignment: AlignmentDirectional.center,
          child: RichText(
            text: TextSpan(
              text: "\$$accountBal",
              style: Get.textTheme.displaySmall
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          )),
      leadingWidth: accountBal.length <= 4
          ? 64
          : accountBal.length <= 6
              ? 80
              : 96,
      title: Text(str.appName, style: Get.textTheme.displaySmall),
      centerTitle: true,
      backgroundColor: Get.theme.backgroundColor,
      actions: [
        GradientIcon(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/duplicate.svg",
            ),
            size: 40,
            gradient: ThemeService().stroke)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
