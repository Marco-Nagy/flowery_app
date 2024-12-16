import 'package:flutter/material.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../generated/assets.dart';

class SectionNotificationMessage extends StatelessWidget {
  const SectionNotificationMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Image.asset("${Assets.imagesNotification}"),
        title: Text(
          'New Offer',
          style: MyFonts.styleMedium500_16.copyWith(color: MyColors.baseColor),
        ),
        subtitle: Text(
          'Lorem ipsum dolor sit amet consectetur. Tristique et mauris sem congue in felis id nec. Amet sed morbi bibendum vestibulum.',
          style: MyFonts.styleRegular400_12.copyWith(color: MyColors.gray),
        ),
      ),
    );
  }
}
