import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';

Widget sectionHeader({required String title}) {
  return FadeInUp(
    duration: const Duration(milliseconds: 1600),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: MyFonts.styleMedium500_20
              .copyWith(color: MyColors.baseColor, fontSize: 18),
        ),
      ),
    ),
  );
}
