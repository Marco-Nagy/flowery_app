import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flowery_store/core/localization/lang_keys.dart';
import 'package:flowery_store/core/utils/extension/media_query_values.dart';
import 'package:flowery_store/core/utils/widgets/base/snack_bar.dart';
import 'package:flowery_store/flowery_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

import 'firebase_server_token.dart';
import 'notification_navigation_helper.dart';

@LazySingleton()
class NotificationHelper {
  /// Singleton instance

  /// Firebase Messaging instance
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  /// ✅ استرجاع الـ `navigatorKey` بدلاً من إنشائه

  /// Initialize Firebase Messaging and Local Notifications
  static const String subscribeKey = "floweryStore";
  bool isPermissionNotification = false;
  ValueNotifier<bool> isNotificationSubscribed = ValueNotifier(false);

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

 Future<void> _requestPermissions() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      providesAppNotificationSettings: true,

    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      _subscribeToTopic(subscribeKey);
      isPermissionNotification = true;
      debugPrint('User accept Notification 🔔🔔 permission');
    } else {
      isPermissionNotification = false;
      isNotificationSubscribed.value = false;
      debugPrint('User permissions denied 🔕🔕 or has not accept permission');
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

  //* Subscribe Notification
  Future<void> _subscribeToTopic(String topic) async {
    await messaging.subscribeToTopic(topic);
    isNotificationSubscribed.value = true;
    debugPrint('🔔🔔 Subscribed to $topic🔔🔔');
  }

  //* Unsubscribe Notification
  Future<void> _unsubscribeFromTopic(String topic) async {
    await messaging.unsubscribeFromTopic(topic);
    isNotificationSubscribed.value = false;
    debugPrint('🔕🔕 Unsubscribed from $topic 🔕🔕 ');
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
        msg: message.notification!.title.toString() +
            "\n" +
            message.notification!.body.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.greenAccent,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<void> switchUserSubscribe() async {
    debugPrint(' isPermissionNotification $isPermissionNotification');
    debugPrint(' isNotificationSubscribed ${isNotificationSubscribed.value}');
    if (isPermissionNotification == false) {
      _requestPermissions();
    } else if (isNotificationSubscribed.value == false) {
      _subscribeToTopic(subscribeKey);
      aweSnackBar(
          title: 'Success',
          msg: navigatorKey
              .currentState!
              .context
              .translate(LangKeys.subscribedToNotifications),
          context: navigatorKey.currentState!.context,
          type: MessageTypeConst.success);
    } else {
      _unsubscribeFromTopic(subscribeKey);
      aweSnackBar(
          title: '',
          msg: navigatorKey
              .currentState!
              .context
              .translate(LangKeys.unsubscribedToNotifications),
          context: navigatorKey.currentState!.context,
          type: MessageTypeConst.warning);
    }
  }}
