import 'package:auto_size_text/auto_size_text.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../generated/assets.dart';

class SectionNotificationMessage extends StatelessWidget {
  const SectionNotificationMessage(
      {super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageIcon(
                const AssetImage(Assets.imagesNotificationList),
                size: 20.sp,
              ),
              horizontalSpacing(12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      title,
                      style: MyFonts.styleMedium500_16.copyWith(
                        color: MyColors.baseColor,
                      ),
                    ),
                    verticalSpacing(4.h),
                    AutoSizeText(
                      body,
                      style: MyFonts.styleRegular400_12.copyWith(
                        color: MyColors.gray,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            height: 40,
          )
        ],
      ),
    );
  }
}
