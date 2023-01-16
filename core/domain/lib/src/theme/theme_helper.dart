import 'package:data_source/data_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 11.01.2023.
class ThemeHelper {
  final ThemeLocalDataSource _themeLocalDataSource = Get.find();

  void updateDarkThemeValue(bool value) async {
    _themeLocalDataSource.saveValueDarkTheme(value);
  }

  Future<ThemeMode> getThemeData() async {
    final bool? isDarkTheme =  await _themeLocalDataSource.getValueDarkTheme();
    final ThemeMode themeMode;
    if (isDarkTheme == null) {
      themeMode = ThemeMode.system;
    } else if (isDarkTheme == false) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    return  themeMode;
  }
}
