import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flowery_e_commerce/core/routes/app_routes.dart';
import 'package:flowery_e_commerce/core/utils/extension/navigation.dart';
import 'package:flowery_e_commerce/features/notification_list/presentation/model/notification_args.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';

import '../../../di/di.dart';

class MessagingHelper {
  factory MessagingHelper() => _instance;
  static final MessagingHelper _instance =
      MessagingHelper._internal();
  static final GlobalKey<NavigatorState> navigatorKey =
      getIt<GlobalKey<NavigatorState>>();

  MessagingHelper._internal();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    await _requestPermissions();

    await _setupLocalNotifications();

    await FirebaseMessaging.instance.setAutoInitEnabled(true);

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Received a foreground message!');
      debugPrint('Message Data: ${message.data}');

      if (message.notification != null) {
        debugPrint(
            'Notification Title: ${message.notification?.title}, Body: ${message.notification?.body}');

        _showNotification(
          title: message.notification!.title ?? '',
          body: message.notification!.body ?? '',
        );
      }
    });

    await getDeviceToken();
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    final notificationArgs = NotificationArgs(
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
    );

    navigatorKey.currentState?.context.pushNamed(
      AppRoutes.notificationView,
      arguments: notificationArgs,
    );
    debugPrint("Handling background message: ${message.notification}");
  }

  Future<NotificationSettings> _requestPermissions() async {
    return await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  // Get the device token
  Future<String?> getDeviceToken() async {
    final deviceToken = await messaging.getToken();
    debugPrint('FCM Token: $deviceToken');
    return deviceToken;
  }

  Future<void> _setupLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (response.payload != null) {
          final payload = response.payload!.split('|');
          if(payload[1].toString().contains('order')){
            navigatorKey.currentState?.pushNamed(
              AppRoutes.notificationView,
              arguments: NotificationArgs(
                title: payload[0],
                // Use the first part of the payload as the title
                body: payload[1],
                // Use the second part of the payload as the body
              ),
            );
          }
          navigatorKey.currentState?.pushNamed(
            AppRoutes.notificationView,
            arguments: NotificationArgs(
              title: payload[0],
              // Use the first part of the payload as the title
              body: payload[1],
              // Use the second part of the payload as the body
            ),
          );
        }
      },
    );
  }

  Future<void> _showNotification(
      {required String title, required String body}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'flowery_id',
      'flowery',
      importance: Importance.max,
      priority: Priority.high,icon: '@mipmap/ic_launcher',
      ticker: 'ticker',
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: '$title|$body',
    );
  }
  //* Subscribe Notification
  Future<void> subscribeToTopic(String topic) async {
    await messaging.subscribeToTopic(topic);
    debugPrint('🔔🔔 Subscribed to $topic🔔🔔');
  }

  //* Unsubscribe Notification
  Future<void> unsubscribeFromTopic(String topic) async {
    await messaging.unsubscribeFromTopic(topic);
    debugPrint('🔕🔕 Unsubscribed from $topic 🔕🔕 ');
  }
}
