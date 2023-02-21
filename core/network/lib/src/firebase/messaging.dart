import 'package:firebase_messaging/firebase_messaging.dart';

class Messaging {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> invoke() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      // TODO: handle the received notifications
    } else {
      print('User declined or has not accepted permission');
    }
  }
}
