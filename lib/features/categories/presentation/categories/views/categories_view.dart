import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/utils/screens/no_network_screen.dart';
import 'package:flowery_e_commerce/core/utils/widgets/base/base_view.dart';
import 'package:flowery_e_commerce/features/categories/presentation/products/viewModel/products_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widgets/spacing.dart';
import '../../../../../di/di.dart';
import '../../products/viewModel/get_products_actions.dart';
import '../viewModel/categories_action.dart';
import '../viewModel/categories_view_model_cubit.dart';
import '../widgets/categories_tab_bar.dart';
import '../widgets/custom_filter_categories.dart';
import '../widgets/custom_search_categories.dart';
import '../widgets/filter_chip_button_widget.dart';
import '../widgets/products_grid.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  late final CategoriesViewModelCubit categoriesViewModelCubit;
  late final ProductsViewModelCubit productsViewModelCubit;
  String? selectedCategoryId;

  @override
  void initState() {
    super.initState();
    categoriesViewModelCubit = getIt.get<CategoriesViewModelCubit>();
    productsViewModelCubit = getIt.get<ProductsViewModelCubit>();

    // Load categories and products for 'All' initially
    categoriesViewModelCubit.doAction(GetCategoriesAction());
    productsViewModelCubit.doAction(GetProductsAction());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoriesViewModelCubit>(
            create: (context) => categoriesViewModelCubit),
        BlocProvider<ProductsViewModelCubit>(
            create: (context) => productsViewModelCubit),
      ],
      child: BlocBuilder<CategoriesViewModelCubit, CategoriesViewModelState>(
        builder: (context, state) {
          switch (state) {
            case GetCategoriesViewModelLoading loadingState:
              return const BaseView(
                  child: Center(
                      child: CircularProgressIndicator(
                          color: MyColors.baseColor)));
            case GetCategoriesViewModelSuccess successState:
              final categories = successState.categories ?? [];
              return DefaultTabController(
                length: categories.length + 1,
                child: BaseView(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                  flex: 3, child: CustomSearchCategories()),
                              horizontalSpacing(12),
                              const Expanded(
                                  flex: 1, child: CustomFilterCategories()),
                            ],
                          ),
                          verticalSpacing(16),
                          CategoriesTabBar(
                            categories: categories,
                            selectedCategoryId: (id) =>
                                setState(() => selectedCategoryId = id),
                          ),
                          verticalSpacing(16),
                          Expanded(
                            child: ProductsGrid(
                                selectedCategoryId: selectedCategoryId),
                          ),
                        ],
                      ),
                      FilterChipButtonWidget(
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              );
            case GetCategoriesViewModelError errorState:
              if (errorState.error.error ==
                      "No internet connection. Please check your settings." ||
                  errorState.error.error ==
                      "Connection timed out. Please check your internet connection." ||
                  errorState.error.error ==
                      "An unexpected error occurred. Please try again.") {
                return const NoNetworkScreen();
              }
              return BaseView(
                  child:
                      Center(child: Text(errorState.error.error.toString())));
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
