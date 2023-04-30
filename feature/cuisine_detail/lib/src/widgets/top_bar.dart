import 'package:common/common.dart';
import 'package:cuisine_detail/src/controller.dart';
import 'package:cuisine_detail/src/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DetailTopBar extends GetView<Controller> implements PreferredSizeWidget {
  const DetailTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<Controller>();
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
      leading: InkWell(
        onTap: Get.back,
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
      shadowColor: Get.theme.colorScheme.primaryContainer,
      backgroundColor: Get.theme.colorScheme.primaryContainer,
      actions: [
        PopupMenuButton<String>(
          onSelected: controller.moreOptions,
          padding: const EdgeInsets.all(0.0),
          position: PopupMenuPosition.under,
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          color: Get.theme.colorScheme.surface,
          child: Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Get.theme.colorScheme.surface),
            child: Icon(
              Icons.more_vert,
              color: Get.theme.colorScheme.onBackground,
            ),
          ),
          itemBuilder: (BuildContext context) {
            return Strings.menuOptions.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(
                  choice,
                  style: Get.textTheme.bodySmall,
                ),
              );
            }).toList();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
