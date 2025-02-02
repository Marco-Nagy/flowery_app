import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummary extends StatelessWidget {
  final int total;
  final String paymentMethod;

  const OrderSummary(
      {super.key, required this.total, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: MyColors.whiteBase,
          borderOnForeground: true,
          elevation: 4.sp,
          child: ListTile(
            title: Text('Total', style: MyFonts.styleMedium500_16),
            trailing: Text('EGP $total',
                style: MyFonts.styleMedium500_14.copyWith(color: MyColors.grey)),
          ),
        ),
    Card(
    color: MyColors.whiteBase,
    borderOnForeground: true,
    elevation: 4.sp,
          child: ListTile(
            title: Text('Payment method', style: MyFonts.styleMedium500_16),
            trailing: Text(paymentMethod, style: MyFonts.styleMedium500_14.copyWith(color: MyColors.grey)),
          ),
        ),
      ],
    );
  }
}
