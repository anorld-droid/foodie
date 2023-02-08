import 'package:shared_preferences/shared_preferences.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 11.01.2023.

class PrefHelper {
  final Future<SharedPreferences> preferences;

  PrefHelper({required this.preferences});

  Future<void> saveBoolValue(final String key, bool val) async {
    await preferences.then((value) => value.setBool(key, val));
  }

  Future<bool?> getBoolValue(final String key) async {
    return await preferences.then((value) => value.getBool(key));
  }
}
