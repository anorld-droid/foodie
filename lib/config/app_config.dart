import 'package:common/common.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
enum Flavor {
  // ignore: public_member_api_docs
  mDevelopment,
  // ignore: public_member_api_docs
  mRelease,
}

class Config {
  late final Flavor appFlavor;
  Config({required this.appFlavor});
  String get title {
    switch (appFlavor) {
      case Flavor.mRelease:
        return CommonStrings.appName;
      case Flavor.mDevelopment:
      default:
        return CommonStrings.appDev;
    }
  }

  bool get isDebug {
    switch (appFlavor) {
      case Flavor.mRelease:
        return false;
      case Flavor.mDevelopment:
      default:
        return true;
    }
  }
}
