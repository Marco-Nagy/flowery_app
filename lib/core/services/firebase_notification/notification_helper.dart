// 📁 notification_helper.dart

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flowery_store/core/localization/lang_keys.dart';
import 'package:flowery_store/core/services/shared_preference/shared_pref_keys.dart';
import 'package:flowery_store/core/services/shared_preference/shared_preference_helper.dart';
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
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  static const String subscribeKey = "floweryStore";

  bool isPermissionNotification = false;
  ValueNotifier<bool> isNotificationSubscribed = ValueNotifier(false);

  /// Initialize notifications, permissions and message handlers
  Future<void> initialize() async {
    await _requestPermissions();
    await messaging.setAutoInitEnabled(true);

    final settings = await messaging.getNotificationSettings();
    isPermissionNotification = settings.authorizationStatus == AuthorizationStatus.authorized;

    final isSubscribed = await SharedPrefHelper().getBoolean(key: SharedPrefKeys.subscribedNotification);
    isNotificationSubscribed.value = isSubscribed ?? false;

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen(NotificationNavigationHelper.forGroundHandler);

    // Handle terminated state
    await messaging.getInitialMessage().then(NotificationNavigationHelper.terminatedHandler);

    // Handle background when app opens from notification
    FirebaseMessaging.onMessageOpenedApp.listen(NotificationNavigationHelper.backGroundHandler);

    // Token refresh
    messaging.onTokenRefresh.listen((newToken) {
      debugPrint('📲 New Device FCM Token: $newToken');
    });

    await getDeviceToken();
  }

  /// Request user permission for notifications
  Future<void> _requestPermissions() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      providesAppNotificationSettings: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      isPermissionNotification = true;
      debugPrint('✅ Notification permission granted');
    } else {
      isPermissionNotification = false;
      isNotificationSubscribed.value = false;
      debugPrint('❌ Notification permission denied');
    }
  }

  /// Subscribe to topic and update state
  Future<void> _subscribeToTopic(String topic) async {
    await messaging.subscribeToTopic(topic);
    isNotificationSubscribed.value = true;
    await SharedPrefHelper().setBoolean(key: SharedPrefKeys.subscribedNotification, boolValue: true);
    debugPrint('🔔 Subscribed to $topic');
  }

  /// Unsubscribe from topic and update state
  Future<void> _unsubscribeFromTopic(String topic) async {
    await messaging.unsubscribeFromTopic(topic);
    isNotificationSubscribed.value = false;
    await SharedPrefHelper().setBoolean(key: SharedPrefKeys.subscribedNotification, boolValue: false);
    debugPrint('🔕 Unsubscribed from $topic');
  }

  /// Subscribe to topic and update state
  Future<void> subscribeToTopic(String topic) async {
    await messaging.subscribeToTopic(topic);
    debugPrint('🔔 Subscribed to $topic');
  }

  /// Unsubscribe from topic and update state
  Future<void> unsubscribeFromTopic(String topic) async {
    await messaging.unsubscribeFromTopic(topic);
    debugPrint('🔕 Unsubscribed from $topic');
  }
  /// Toggle user subscription with UI feedback
  Future<void> switchUserSubscribe() async {
    debugPrint('isPermissionNotification: $isPermissionNotification');
    debugPrint('isNotificationSubscribed: ${isNotificationSubscribed.value}');

    if (!isPermissionNotification) {
      await _requestPermissions();
      if (!isPermissionNotification) return;
    }

    if (!isNotificationSubscribed.value) {
      await _subscribeToTopic(subscribeKey);
      aweSnackBar(
        title: 'Success',
        msg: navigatorKey.currentState!.context.translate(LangKeys.subscribedToNotifications),
        context: navigatorKey.currentState!.context,
        type: MessageTypeConst.success,
      );
    } else {
      await _unsubscribeFromTopic(subscribeKey);
      aweSnackBar(
        title: '',
        msg: navigatorKey.currentState!.context.translate(LangKeys.unsubscribedToNotifications),
        context: navigatorKey.currentState!.context,
        type: MessageTypeConst.warning,
      );
    }
  }

  /// Fetch device token for FCM
  Future<String?> getDeviceToken() async {
    final deviceToken = await messaging.getToken();
    debugPrint('📲 Device FCM Token: $deviceToken');
    return deviceToken;
  }

  /// Background handler for FCM
  @pragma('vm:entry-point')
  static Future<void> messageHandler(RemoteMessage message) async {
    log('background message ${message.notification?.body}');
    Fluttertoast.showToast(
      msg: "${message.notification?.title ?? ''}\n${message.notification?.body ?? ''}",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.greenAccent,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  /// Optional direct send (admin only)
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
        "notification": {"title": title, "body": body},
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
        debugPrint('✅ Notification sent: ${response.data}');
      } else {
        debugPrint('❌ Notification failed: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('❌ Notification error: ${e.toString()}');
    }
  }
}
