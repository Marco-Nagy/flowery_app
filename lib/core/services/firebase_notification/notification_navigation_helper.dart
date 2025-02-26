import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flowery_e_commerce/flowery_ecommerce.dart';
import 'package:flutter/material.dart';

import 'local_notification_service.dart';

class NotificationNavigationHelper {
  static Future<void> forGroundHandler(RemoteMessage? message) async {
    if (message != null) {
      await LocalNotificationService.showNotification(
        title: message.notification?.title ?? '',
        body: message.notification?.body ?? '',
        payload: message.data,
      );
      navigate(navigator.currentState!.context, message.data, false);
    }
  }

  static void backGroundHandler(RemoteMessage? message) {
    if (message != null) {
      navigate(navigator.currentState!.context, message.data, false);
    }
  }

  static void terminatedHandler(RemoteMessage? message) {
    if (message != null) {
      navigate(navigator.currentState!.context, message.data, true);
    }
  }
}

Future<void> navigate(
    BuildContext context, Map<String, dynamic> data, bool isTerminated) async {
  final String? route = data['route'];
  final String? orderId = data['orderId'];
  final String? userId = data['userId'];

  debugPrint("Extracted userId:${data['userId']}");
  debugPrint(
      "Navigating to: $route with orderId: $orderId and userId: $userId");

  if (orderId != null && userId != null && route != null) {
// final GlobalKey<NavigatorState> navigatorKey = getIt<GlobalKey<NavigatorState>>();

    if (isTerminated) {
// Ensure app is initialized before navigating
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushNamed(
          route,
          arguments: {
            'orderId': orderId,
            'userId': userId,
          },
        );
      });
    } else {
      Navigator.of(context).pushNamed(
        route,
        arguments: {
          'orderId': orderId,
          'userId': userId,
        },
      );
    }
  } else {
    debugPrint("⚠️ Missing required parameters: orderId or userId is null");
  }
}
