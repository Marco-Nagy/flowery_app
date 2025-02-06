import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import '../../../di/di.dart';
import 'firebase_server_token.dart';
import '../../../core/routes/app_routes.dart';
@singleton
class MessagingHelper {
  /// Singleton instance

  /// Firebase Messaging instance
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  /// ✅ استرجاع الـ `navigatorKey` بدلاً من إنشائه
  GlobalKey<NavigatorState> get navigatorKey => getIt<GlobalKey<NavigatorState>>();

  /// Initialize Firebase Messaging and Local Notifications
  Future<void> initialize() async {
    await _requestPermissions();
    await _setupLocalNotifications();
    await messaging.setAutoInitEnabled(true);

    // ✅ التعامل مع إشعار التطبيق في حالة terminated
    RemoteMessage? initialMessage = await messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleNavigation(navigatorKey.currentContext!,initialMessage);
    }

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationClick);

    messaging.onTokenRefresh.listen((newToken) {
      debugPrint('📲 New Device FCM Token: $newToken');
    });

    await getDeviceToken();
  }



  Future<NotificationSettings> _requestPermissions() async {
    return await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
  }

   Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    debugPrint("Handling background message: ${message.data}");
    debugPrint("Extracted userId: ${message.data['userId']}"); // ✅ طباعة userId المستلمة

    // تأكد من أن البيانات تحتوي على `route`, `orderId`, `userId`
    if (navigatorKey.currentContext != null &&message.data.containsKey('route') &&
        message.data.containsKey('orderId') &&
        message.data.containsKey('userId')) {
      _handleNavigation(navigatorKey.currentContext!,message);
    }
  }


  void _handleForegroundMessage(RemoteMessage message) {
    debugPrint('Received foreground notification: ${message.data}');
    debugPrint("Extracted userId: ${message.data['userId']}"); // ✅ طباعة userId المستلمة

    if (message.notification != null) {
      _showNotification(
        title: message.notification!.title ?? 'New Notification',
        body: message.notification!.body ?? '',
        payload: message.data, // ✅ تمرير البيانات إلى الإشعار المحلي
      );
    }

    // ✅ تنقل مباشر عند استقبال الإشعار في الـ foreground
    _handleNavigation(navigatorKey.currentContext!,message);
  }


  void _handleNotificationClick(RemoteMessage message) {
    debugPrint("Notification clicked: ${message.data}");
    debugPrint("Notification clicked: ${message.data}");
    debugPrint("Extracted userId: ${message.data['userId']}"); // ✅ طباعة userId المستلمة

    if (message.data.containsKey('route') &&
        message.data.containsKey('orderId') &&
        message.data.containsKey('userId')) {
      _handleNavigation(navigatorKey.currentContext!,message);
    }
  }

   void  _handleNavigation(BuildContext context, RemoteMessage message) {
    final Map<String, dynamic> data = message.data;


    final String? route = data['route'];
    final String? orderId = data['orderId'];
    final String? userId = data['userId'];
    debugPrint("Extracted userId: ${data['userId']}"); // ✅ طباعة userId المستلمة

    debugPrint("Navigating to: $route with orderId: $orderId and userId: $userId");

    if (route == "trackOrder") {
      // final navigatorKey = getIt<GlobalKey<NavigatorState>>();
      final context = navigatorKey.currentContext;
      if (orderId != null && userId != null &&context != null) {
        context.pushNamed(
          AppRoutes.trackOrder,
          arguments: {
            'orderId': orderId,
            'userId': userId,
          },
        );
      } else {
        debugPrint("⚠️ Missing required parameters: orderId or userId is null");
      }
    }
  }

  Future<void> subscribeToTopic(String topic) async {
    await messaging.subscribeToTopic(topic);
    debugPrint('✅ Subscribed to topic: $topic');
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await messaging.unsubscribeFromTopic(topic);
    debugPrint('❌ Unsubscribed from topic: $topic');
  }

  Future<void> sendNotification({
    String? topic,
    String? token,
    required String title,
    required String body,
    required Map<String, dynamic> data,
  }) async {
    final String serverToken = await FirebaseServerToken().getAccessToken();

    final Map<String, dynamic> notificationPayload = {
      "message": {
        if (topic != null) "topic": topic else "token": token,
        "notification": {
          "title": title,
          "body": body,
        },
        "data": data,
      },
    };

    try {
      final response = await Dio().post(
        dotenv.get('NOTIFICATION_BASE_URL'),
        options: Options(
          headers: {
            'Authorization': 'Bearer $serverToken',
            'Content-Type': 'application/json',
          },
        ),
        data: notificationPayload,
      );

      if (response.statusCode == 200) {
        debugPrint('✅ Notification sent successfully: ${response.data}');
      } else {
        debugPrint('❌ Failed to send notification: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('❌ Error sending notification: ${e.toString()}');
    }
  }

  Future<String?> getDeviceToken() async {
    final deviceToken = await messaging.getToken();
    debugPrint('📲 Device FCM Token: $deviceToken');
    return deviceToken;
  }

  Future<void> _setupLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

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
          final RemoteMessage message = RemoteMessage(data: data);
          _handleNavigation(navigatorKey.currentContext!,message);
        }
      },
    );
  }

  Future<void> _showNotification({
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
      payload: payload != null ? payload.toString() : null, // ✅ تخزين البيانات كـ `String`
    );
  }

}

