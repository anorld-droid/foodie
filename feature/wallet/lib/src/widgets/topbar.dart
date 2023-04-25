import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wallet/src/controller.dart';
import 'package:wallet/src/strings.dart';

class TopBar extends GetView<WalletController> implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Get.theme.colorScheme.primaryContainer,
        // Status bar brightness (optional)
        statusBarIconBrightness:
            Get.theme.colorScheme.brightness, // For Android (dark icons)
      ),
      leadingWidth: 56.0,
      centerTitle: true,
      flexibleSpace: Container(
        color: Get.theme.colorScheme.background,
      ),
      title: Text(
        Strings.appBarTitle,
        style: Get.textTheme.headlineSmall?.copyWith(fontSize: 20),
      ),
      leading: InkWell(
        onTap: Get.back<void>,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Get.theme.colorScheme.surface),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.arrow_back,
              color: Get.theme.colorScheme.onBackground,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
