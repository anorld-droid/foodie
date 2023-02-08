import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.

class TriceAppController extends GetxController {
  late ThemeHelper _themeHelper;
  late OnboardingStatus _onboardingStatus;
  Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  @override
  void onReady() async {
    super.onReady();
    _themeHelper = Get.find();
    _onboardingStatus = OnboardingStatus();
    await initializeViews();
  }

  Future<void> initializeViews() async {
    themeMode.value = await _themeHelper.getThemeData();
    final bool done = await _onboardingStatus.done();
    Get.offAllNamed<void>(done ? Routes.root : Routes.signUp);
  }
}
