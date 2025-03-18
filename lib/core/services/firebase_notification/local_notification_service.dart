import 'dart:convert';

import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/flowery_ecommerce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> setupLocalNotifications() async {
    final AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high_importance_channel', // Channel ID
      'High Importance Notifications', // Channel Name
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
    );

    // Android initialization
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS initialization
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    // General initialization
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    // Create the notification channel for Android
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // Initialize the plugin
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        _handleNotificationTap(response.payload);
      },
    );
  }

  /// Function to handle notification taps
  static void _handleNotificationTap(String? payload) {
    debugPrint('🔔 Local Notification Clicked: $payload');

    if (payload != null) {
      try {
        final Map<String, dynamic> data = jsonDecode(payload);
        final String? route = data['route'];
        final String? orderId = data['orderId'];
        final String? userId = data['userId'];

        debugPrint("Extracted userId: $userId");

        if (orderId != null && userId != null && route != null) {
          navigatorKey.currentState?.context.pushNamed(
            route,
            arguments: {'orderId': orderId, 'userId': userId},
          );
        } else {
          debugPrint(
              "⚠️ Missing required parameters: orderId or userId is null");
        }
      } catch (e) {
        debugPrint("❌ Error parsing notification payload: $e");
      }
    }
  }

  /// Function to show a local notification
  static Future<void> showNotification({
    required String title,
    required String body,
    Map<String, dynamic>? payload,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      channelDescription: 'Channel for important notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload:
          payload != null ? jsonEncode(payload) : '{}', // Ensures valid JSON
    );
  }
}
