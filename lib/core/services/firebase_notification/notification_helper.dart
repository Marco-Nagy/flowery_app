import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'firebase_server_token.dart';
import 'notification_navigation_helper.dart';

@singleton
class NotificationHelper {
  /// Singleton instance

  /// Firebase Messaging instance
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  /// ✅ استرجاع الـ `navigatorKey` بدلاً من إنشائه

  /// Initialize Firebase Messaging and Local Notifications
  Future<void> initialize() async {
    await _requestPermissions();
    await messaging.setAutoInitEnabled(true);



    // for ground
    FirebaseMessaging.onMessage
        .listen(NotificationNavigationHelper.forGroundHandler);

    // terminated
    await FirebaseMessaging.instance
        .getInitialMessage()
        .then(NotificationNavigationHelper.terminatedHandler);

    // background
    FirebaseMessaging.onMessageOpenedApp
        .listen(NotificationNavigationHelper.backGroundHandler);

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


  @pragma('vm:entry-point')
  static Future<void> messageHandler(RemoteMessage message) async {
    log('background message ${message.notification!.body}');
     Fluttertoast.showToast(
          msg:  message.notification!.title.toString() + "\n" + message.notification!.body.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
           backgroundColor: Colors.greenAccent,
          textColor: Colors.white,
          fontSize: 16.0
      );
  }

}

