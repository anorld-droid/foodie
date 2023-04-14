import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery/src/strings.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 13.04.2023.
class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: Get.theme.colorScheme.primaryContainer,
      child: InkWell(
        onTap: Get.back<void>,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Get.theme.colorScheme.background,
                const Color.fromARGB(181, 5, 52, 49),
                const Color.fromARGB(71, 5, 52, 49),
              ],
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.mode_of_travel_outlined,
                color: Get.theme.colorScheme.onBackground,
              ),
              const SizedBox(
                width: 4.0,
              ),
              Text(Strings.back, style: Get.textTheme.bodySmall)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
