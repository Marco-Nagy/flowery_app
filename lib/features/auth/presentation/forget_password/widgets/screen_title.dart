import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';


class ScreenTitle extends StatelessWidget {
  const ScreenTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: MyFonts.styleMedium500_18.copyWith(color: MyColors.black),
    );
  }
}
