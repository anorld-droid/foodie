import 'package:data_source/data_source.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 08.02.2023.
class OnboardingStatus {
  final PrefLocalDataSource _prefLocalDataSource = Get.find();
  static const onboarding = 'onboarding';
  Future<void> update(bool value) async {
    await _prefLocalDataSource.saveBoolValue(onboarding, value);
  }

  Future<bool> done() async {
    final bool? done = await _prefLocalDataSource.getBoolValue(onboarding);
    return done ?? false;
  }
}
