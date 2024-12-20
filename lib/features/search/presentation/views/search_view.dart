import 'package:flowery_e_commerce/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/features/search/presentation/viewModel/search_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/assets.dart';
import '../viewModel/search_action.dart';
import '../widgets/no_products_found_widget.dart';
import '../widgets/product_grid.dart';
import '../widgets/search_bar_section.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      body: Padding(
        padding: EdgeInsets.only(top: 50.h, left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarSection(
              onChanged: (value) {
                context
                    .read<SearchViewModelCubit>()
                    .doAction(SearchProductAction(keyword: value));
              },
            ),
            verticalSpacing(16.h),
            Expanded(
              child: BlocBuilder<SearchViewModelCubit, SearchViewModelState>(
                builder: (context, state) {
                  switch (state) {
                    case SearchViewModelInitial():
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Image.asset(Assets.imagesAnimatedSearch),
                        ),
                      );
                    case SearchViewModelLoading():
                      return const Center(
                        child: AppLoader(),
                      );
                    case SearchViewModelSuccess():
                      if (state.result.products == null ||
                          state.result.products!.isEmpty) {
                        return const Expanded(child: NoProductsFound());
                      }
                      return ProductGrid(products: state.result.products!);
                    case SearchViewModelFailure():
                      return Center(
                        child: Text(
                          state.message.toString(),
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
