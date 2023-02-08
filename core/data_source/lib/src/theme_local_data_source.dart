import 'package:get/get.dart';
import 'package:preference/preference.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 11.01.2023.
class PrefLocalDataSource {
  final PrefHelper prefHelper = Get.find();

  Future<dynamic> saveBoolValue(final String key, bool value) async {
    prefHelper.saveBoolValue(key, value);
  }

  Future<bool?> getBoolValue(final String key) async {
    return prefHelper.getBoolValue(key);
  }
}
