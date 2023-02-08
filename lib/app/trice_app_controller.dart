import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.

class TriceAppController extends GetxController {
  late ThemeHelper themeHelper;
  Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  @override
  void onReady() {
    super.onReady();
    themeHelper = Get.find();
    initTheme();
  }
  void initTheme() async {
    themeMode.value =  await themeHelper.getThemeData();
  }
}
