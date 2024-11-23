import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseView extends StatelessWidget {
  const BaseView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 50.h, left: 16.w, right: 16.w),
          child: child,
        ));
  }
}
