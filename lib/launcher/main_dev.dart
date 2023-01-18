import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trice/firebase_options.dart';

import 'app_config.dart';
import 'trice_app.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 11.01.2023.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Config(appFlavor: Flavor.mRelease);
  runApp(const TriceApp());
}
