import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flutter/cupertino.dart';

import '../../../di/di.dart';

class FirebaseCloudMessaging {
  factory FirebaseCloudMessaging() => _instance;
  static final FirebaseCloudMessaging _instance =
      FirebaseCloudMessaging._internal();
  static final GlobalKey<NavigatorState> navigatorKey =
      getIt<GlobalKey<NavigatorState>>();

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
    navigatorKey.currentState?.context.pushNamed(AppRoutes.notificationView);
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
