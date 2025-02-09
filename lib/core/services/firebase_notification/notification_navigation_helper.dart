import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flowery_e_commerce/main.dart';
import 'package:flutter/material.dart';

import '../../../di/di.dart';
import 'local_notification_service.dart';

class NotificationNavigationHelper {
  static Future<void> forGroundHandler(RemoteMessage? message) async {
    if (message != null) {
      await LocalNotificationService.showNotification(
        title: message.notification!.title ?? '',
        body: message.notification!.body ?? '',
        payload: message.data,
      );
      navigate(message);
    }
  }

  // ✅ Wait for initialization before calling navigate
  static void backGroundHandler(RemoteMessage? message) {
    if (message != null) {
    //   Future.delayed(const Duration(milliseconds: 200), () {
        navigate(message);
      // });
    }
  }

  // ✅ Ensure `main()` completes before navigating
  static void terminatedHandler(RemoteMessage? message) {
    if (message != null && !appInitialized.isCompleted) {
      Future.delayed(const Duration(seconds: 5), () {
        navigate(message);
      });
    }
  }


  static void navigate(RemoteMessage message) {
    final Map<String, dynamic> data = message.data;

    final String? route = data['route'];
    final String? orderId = data['orderId'];
    final String? userId = data['userId'];

    debugPrint("Extracted userId: ${data['userId']}");
    debugPrint(
        "Navigating to: $route with orderId: $orderId and userId: $userId");

    final navigatorKey = getIt<GlobalKey<NavigatorState>>();

    if (orderId != null &&
        userId != null &&
        route != null &&
        navigatorKey.currentState != null) {
      navigatorKey.currentState!.pushNamed(
        route,
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
