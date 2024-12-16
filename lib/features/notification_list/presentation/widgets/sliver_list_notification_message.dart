import 'package:flowery_e_commerce/features/notification_list/presentation/widgets/section_notification_message.dart';
import 'package:flutter/material.dart';

class SliverListNotificationMessage extends StatelessWidget {
  const SliverListNotificationMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return const SectionNotificationMessage();
        });
  }
}
