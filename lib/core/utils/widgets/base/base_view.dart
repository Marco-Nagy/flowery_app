import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/custom_app_bar.dart';
import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  const BaseView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.white,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 8),
          child: child,
        ));
  }
}
