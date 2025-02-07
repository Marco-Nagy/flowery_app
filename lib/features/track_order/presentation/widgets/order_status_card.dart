import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization/lang_keys.dart';

class OrderStatusCard extends StatelessWidget {
  final String status, orderId, date;
  const    OrderStatusCard({super.key, required this.status, required this.orderId, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.translate(LangKeys.estimatedArrival), style: MyFonts.styleMedium500_14.copyWith(color: MyColors.grey)),
          const SizedBox(height: 4),
          Text(date, style: MyFonts.styleMedium500_16),
          const Divider(
            color: MyColors.placeHolder,
          ),

        ],
      ),
    );
  }
}