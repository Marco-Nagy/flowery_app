import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> setupLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(

            '@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        debugPrint('🔔 Local Notification Clicked: ${response.payload}');

        if (response.payload != null) {
          final Map<String, dynamic> data = jsonDecode(response.payload!);
          final String? route = data['route'];
          final String? orderId = data['orderId'];
          final String? userId = data['userId'];
          debugPrint(
              "Extracted userId: ${data['userId']}"); // ✅ طباعة userId المستلمة

          debugPrint(
              "Navigating to: $route with orderId: $orderId and userId: $userId");

          if (orderId != null &&
              userId != null &&
              route != null ) {
            // NotificationNavigationHelper.navigate(navigatorKey.currentContext!,data, false);

          } else {
            debugPrint(
                "⚠️ Missing required parameters: orderId or userId is null");
          }
        }
      },
      onDidReceiveBackgroundNotificationResponse:  (NotificationResponse response) {
        debugPrint('🔔 Local Notification Clicked: ${response.payload}');

        if (response.payload != null) {
          final Map<String, dynamic> data = jsonDecode(response.payload!);

          final String? route = data['route'];
          final String? orderId = data['orderId'];
          final String? userId = data['userId'];
          debugPrint(
              "Extracted userId: ${data['userId']}"); // ✅ طباعة userId المستلمة

          debugPrint(
              "Navigating to: $route with orderId: $orderId and userId: $userId");

          // final navigatorKey = getIt<GlobalKey<NavigatorState>>();
          if (orderId != null &&
              userId != null &&
              route != null
             ) {

            // NotificationNavigationHelper.navigate(navigator.currentContext!,data, false);

          } else {
            debugPrint(
                "⚠️ Missing required parameters: orderId or userId is null");
          }
        }
      },

    );
  }

  static Future<void> showNotification({
    required String title,
    required String body,
    Map<String, dynamic>? payload, // ✅ تمرير بيانات الإشعار
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.show(
      0, title, body, platformChannelSpecifics,
      payload: payload != null
          ? payload.toString()
          : null, // ✅ تخزين البيانات كـ `String`
    );
  }
}
