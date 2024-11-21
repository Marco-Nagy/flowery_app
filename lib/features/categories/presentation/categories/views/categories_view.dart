import 'package:flowery_e_commerce/core/utils/widgets/base/base_view.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_search_categories.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: CustomScrollView(
        slivers: [SliverToBoxAdapter(child: CustomSearchCategories())],
      ),
    );
  }
}
