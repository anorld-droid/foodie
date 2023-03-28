import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Messaging {
  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    debugPrint('Handling a background message: ${message.messageId}');
  }

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> invoke(
      void Function(
              {String? title,
              String? body,
              String? dataTitle,
              String? dataBody})
          listen) async {
    registerNotification(listen);
    checkForInitialMessage(listen);

    // For handling notification when the app is in background
    // but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      listen(
        title: message.notification?.title,
        body: message.notification?.body,
        dataTitle: message.data['title'] as String?,
        dataBody: message.data['body'] as String?,
      );
    });
  }

  Future<void> registerNotification(
      void Function(
              {String? title,
              String? body,
              String? dataTitle,
              String? dataBody})
          listen) async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Request permission
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // User granted permission
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        // Parse the message received
        if (message.notification != null) {
          listen(
            title: message.notification?.title,
            body: message.notification?.body,
            dataTitle: message.data['title'] as String?,
            dataBody: message.data['body'] as String?,
          );
        }
      });
    } else {
      debugPrint('User declined or has not accepted permission');
    }
  }

  // For handling notification when the app is in terminated state
  Future<void> checkForInitialMessage(
      void Function(
              {String? title,
              String? body,
              String? dataTitle,
              String? dataBody})
          listen) async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      listen(
        title: initialMessage.notification?.title,
        body: initialMessage.notification?.body,
        dataTitle: initialMessage.data['title'] as String,
        dataBody: initialMessage.data['body'] as String,
      );
    }
  }
}
