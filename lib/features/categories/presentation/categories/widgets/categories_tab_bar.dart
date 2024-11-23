import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';

class CategoriesTabBar extends StatelessWidget {
  final List<dynamic> categories;
  final ValueChanged<String?> selectedCategoryId;

  const CategoriesTabBar({
    Key? key,
    required this.categories,
    required this.selectedCategoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      dividerColor: Colors.transparent,
      padding: EdgeInsets.zero,
      indicatorColor: MyColors.baseColor,
      labelColor: MyColors.baseColor,
      unselectedLabelColor: MyColors.white70,
      unselectedLabelStyle: MyFonts.styleRegular400_16,
      labelStyle: MyFonts.styleRegular400_16,
      onTap: (index) {
        if (index == 0) {
          selectedCategoryId(null);
        } else {
          selectedCategoryId(categories[index - 1]?.id);
        }
      },
      tabs: [
        const Tab(text: "All"),
        ...categories
            .map((category) => Tab(text: category?.name ?? ''))
            .toList(),
      ],
    );
  }
}
