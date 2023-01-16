import 'package:shared_preferences/shared_preferences.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 11.01.2023.

class ThemePrefHelper {
  final Future<SharedPreferences> preferences;

  ThemePrefHelper({required this.preferences});

  static const mTheme = "theme";

  Future<void> saveValueDarkTheme(bool theme) async {
    await preferences.then((value) => value.setBool(mTheme, theme));
  }

  Future<bool?> getValueDarkTheme() async {
    return await preferences.then((value) => value.getBool(mTheme));
  }
}
