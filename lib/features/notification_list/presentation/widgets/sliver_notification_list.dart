import 'package:flowery_e_commerce/features/notification_list/presentation/widgets/notification_message_card.dart';
import 'package:flutter/material.dart';

class SliverNotificationList extends StatelessWidget {
  const SliverNotificationList(
      {super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return NotificationMessageCard(
            title: title,
            body: body,
          );
        });
  }
}
