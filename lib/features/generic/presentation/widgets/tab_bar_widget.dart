import 'package:flutter/material.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';

Widget tabBarWidget({
  required List<Widget> tabs,
  required void Function(int)? onTap,
  TabAlignment? tabAlignment,
}) {
  return TabBar(
    isScrollable: true,
    tabAlignment: tabAlignment ?? TabAlignment.start,
    dividerColor: Colors.transparent,
    padding: EdgeInsets.zero,
    indicatorSize: TabBarIndicatorSize.label,
    indicatorPadding: EdgeInsets.zero,
    indicatorColor: MyColors.baseColor,
    labelColor: MyColors.baseColor,
    unselectedLabelColor: MyColors.white70,
    unselectedLabelStyle: MyFonts.styleRegular400_16,
    labelStyle: MyFonts.styleRegular400_16,
    tabs: tabs,
    onTap: onTap,

  );
}
