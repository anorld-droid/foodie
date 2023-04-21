import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class TriceAppController extends GetxController {
  Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  late final SendMessageUseCase _messageUseCase;
  late final AuthenticateUser _authenticateUser;
  late final Rx<String> store;
  late ThemeHelper themeHelper;

  @override
  void onInit() async {
    super.onInit();
    _messageUseCase = SendMessageUseCase();
  }

  @override
  void onReady() {
    _authenticateUser = AuthenticateUser();
    themeHelper = Get.find();
    initTheme();
    _messageUseCase.pushNotification(({body, dataBody, dataTitle, title}) {
      if (title != null &&
          body != null &&
          dataTitle != null &&
          dataBody != null) {
        showSimpleNotification(
          Text(
            title,
            style: Get.textTheme.bodyLarge,
          ),
          subtitle: Text(body, style: Get.textTheme.bodySmall),
          background: Get.theme.colorScheme.background,
          duration: const Duration(seconds: 2),
        );
      }
    });

    super.onReady();
  }

  void initTheme() async {
    themeMode.value = await themeHelper.getThemeData();
  }
}
