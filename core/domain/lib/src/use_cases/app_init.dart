import 'package:data_source/data_source.dart';
import 'package:flutter/material.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.

class AppInit {
  final TriceInit _triceInit = TriceInit();

  Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _triceInit.initializeApp();
  }
}
