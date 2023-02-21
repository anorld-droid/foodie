import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:trice/app/trice_app.dart';

import 'app_config.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 11.01.2023.
void main() async {
  AppInit appInit = AppInit();
  await appInit.initializeApp();
  Config(appFlavor: Flavor.mRelease);
  runApp(const TriceApp());
}