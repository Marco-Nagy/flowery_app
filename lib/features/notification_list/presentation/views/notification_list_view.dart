import 'package:flowery_e_commerce/features/notification_list/presentation/widgets/section_notification_message.dart';
import 'package:flowery_e_commerce/features/notification_list/presentation/widgets/sliver_list_notification_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/utils/widgets/base/base_view.dart';
import '../../../../core/utils/widgets/base/custom_app_bar.dart';
import '../../../../core/utils/widgets/spacing.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomAppBar(
                  appBarTxt: '${AppLocalizations.of(context)!.notification}',
                  showArrow: true,
                ),
                verticalSpacing(32.h),
              ],
            ),
          ),
          const SliverListNotificationMessage()
        ],
      ),
    );
  }
}
