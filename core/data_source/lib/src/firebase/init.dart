import 'package:network/network.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.01.2023.

class TriceInit {
  final TriceFirebaseInit _firebaseInit = TriceFirebaseInit();

  Future<void> initializeApp() async {
    await _firebaseInit.initializeApp();
  }
}
