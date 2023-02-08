import 'package:data_source/data_source.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:preference/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 12.01.2023.
class TriceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrefHelper>(() {
      final preferences = SharedPreferences.getInstance();
      return PrefHelper(preferences: preferences);
    }, fenix: true);
    Get.lazyPut(() => ThemeHelper(), fenix: true);
    Get.lazyPut(() => PrefLocalDataSource(), fenix: true);
    Get.lazyPut(() => AuthNetworkDataSource(), fenix: true);
    Get.lazyPut(() => StorageNetworkDataSource(), fenix: true);
    Get.lazyPut(() => ImageUseCase(), fenix: true);
    Get.lazyPut(() => AuthenticateUser(), fenix: true);
    Get.lazyPut(() => CloudNetWorkDataSource(), fenix: true);
  }
}
