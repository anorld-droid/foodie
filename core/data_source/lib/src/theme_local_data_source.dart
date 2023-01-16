import 'package:get/get.dart';
import 'package:preference/preference.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 11.01.2023.
class ThemeLocalDataSource {
  final ThemePrefHelper prefHelper =  Get.find();

  Future<dynamic> saveValueDarkTheme(bool value) async {
    prefHelper.saveValueDarkTheme(value);
  }

  Future<bool?> getValueDarkTheme() async {
    return prefHelper.getValueDarkTheme();
  }
}
