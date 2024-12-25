import 'package:flowery_e_commerce/features/notification_list/presentation/widgets/section_notification_message.dart';
import 'package:flutter/material.dart';

class SliverListNotificationMessage extends StatelessWidget {
  const SliverListNotificationMessage(
      {super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return SectionNotificationMessage(
            title: title,
            body: body,
          );
        });
  }
}
