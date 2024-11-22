import 'package:flutter/material.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../view_model/generic_view_model_cubit.dart';

Widget tabBarWidget({
  required GenericViewModelCubit cubit,
}) {
  return TabBar(
    isScrollable: true,
    dividerColor: Colors.transparent,
    padding: EdgeInsets.zero,
    indicatorColor: MyColors.baseColor,
    labelColor: MyColors.baseColor,
    unselectedLabelColor: MyColors.white70,
    unselectedLabelStyle: MyFonts.styleRegular400_16,
    labelStyle: MyFonts.styleRegular400_16,
    tabs: cubit.categories.map((category) => Tab(text: category)).toList(),
    onTap: (index) {
      final selectedCategory = cubit.categories.elementAt(index);
      cubit.setCategory(selectedCategory);
    },
  );
}
