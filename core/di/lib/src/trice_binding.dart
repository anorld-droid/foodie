import 'package:data_source/data_source.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:preference/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 12.01.2023.
class TriceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemePrefHelper>(() {
      final preferences = SharedPreferences.getInstance();
      return ThemePrefHelper(preferences: preferences);
    }, fenix: true);
    Get.lazyPut(() => ThemeHelper(), fenix: true);
    Get.lazyPut(() => ThemeLocalDataSource(), fenix: true);
    Get.lazyPut(() => AuthNetworkDataSource(), fenix: true);
    Get.lazyPut(() => StorageNetworkDataSource(), fenix: true);
    Get.lazyPut(() => ImageUseCase(), fenix: true);
  }
}
