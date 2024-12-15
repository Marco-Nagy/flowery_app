import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class FirebaseCloudMessaging {
  factory FirebaseCloudMessaging() => _instance;
  static final FirebaseCloudMessaging _instance =
      FirebaseCloudMessaging._internal();

  FirebaseCloudMessaging._internal();

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    await _requestPermissions();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await getDeviceToken();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Message received: ${message.notification?.title}');
    });
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // Handle background messages here
    debugPrint("Handling a background message: ${message.notification}");
  }

  Future<NotificationSettings> _requestPermissions() async {
    return await messaging.requestPermission(
      badge: false,
    );
  }

  Future<String?>? getDeviceToken() async {
    final deviceToken = await messaging.getToken();
    debugPrint('FCM Token: $deviceToken');
    return deviceToken;
  }
}
