import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/domain/theme.dart';

import 'gradient_icon.dart';

class TriceTopBar extends StatelessWidget implements PreferredSizeWidget {
  const TriceTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Strings str = Strings();
    return AppBar(
      leading: Container(
        padding: const EdgeInsets.only(left: 16),
        child: const CircleAvatar(
          backgroundColor: Colors.white38,
          radius: 48,
          backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1564166174574-a9666f590437?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
        ),
      ),
      leadingWidth: 64,
      title: Text(str.appName, style: Get.textTheme.displaySmall),
      centerTitle: true,
      backgroundColor: Get.theme.backgroundColor,
      actions: [
        GradientIcon(() {},
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
