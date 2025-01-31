import 'package:flowery_e_commerce/features/notification_list/presentation/widgets/sliver_notification_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/utils/widgets/base/base_view.dart';
import '../../../../core/utils/widgets/base/custom_app_bar.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../model/notification_args.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key, required this.args});

  final NotificationArgs args;

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
          SliverNotificationList(
            title: args.title.toString(),
            body: args.body.toString(),
          )
        ],
      ),
    );
  }
}
