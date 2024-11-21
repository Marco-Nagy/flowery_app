import 'package:flowery_e_commerce/core/utils/widgets/base/base_view.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_filter_categories.dart';
import '../widgets/custom_search_categories.dart';
import '../widgets/custom_tab_bar.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: BaseView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: const CustomSearchCategories(),
                ),
                horizontalSpacing(12),
                Expanded(flex: 1, child: const CustomFilterCategories()),
              ],
            ),
            verticalSpacing(16),
            const CustomTabBar(),
          ],
        ),
      ),
    );
  }
}
