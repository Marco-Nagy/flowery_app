import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/widgets/base/app_loader.dart';
import '../../../../../core/utils/widgets/spacing.dart';
import '../widget/no_products_widget.dart';
import '../../../../generic/presentation/widgets/tab_bar_widget.dart';
import '../viewModel/generic_item_action.dart';
import '../viewModel/generic_item_view_model_cubit.dart';
import '../widget/generic_builder_widget.dart';
import '../widget/no_products_widget.dart';

class GenericItemScreen extends StatelessWidget {
  const GenericItemScreen(
      {super.key, required this.resourceName, required this.field,  this.onClick});
  final String resourceName, field;
  final void Function(GlobalKey)? onClick;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericItemViewModelCubit, GenericItemViewModeState>(
      builder: (context, state) {
        final cubit = context.read<GenericItemViewModelCubit>();

        switch (state.runtimeType) {
          case const (GetProductError):
            final errorState = state as GetProductError;
            return Text(errorState.error.error.toString());

          case const (GetItemsLoading):
          case const (GetProductLoading):
            return const Center(child: AppLoader());

          case const ( GetItemsSuccess):
          case const (FilteredProductsState):
            final items = cubit.items;
            final filteredProducts = state is FilteredProductsState
                ? state.filteredProducts
                : cubit.allProducts;

              return DefaultTabController(
                length: items.length + 1,
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      tabBarWidget(
                        tabs: [
                          const Tab(text: 'All'),
                          ...items.map((item) => Tab(text: item.name)),
                      ],
                      onTap: (index) {
                        cubit.doAction(FilterProductsAction(
                          index,
                          field: field,
                        ));
                      },
                    ),
                    verticalSpacing(20),
                    Expanded(
                      child: filteredProducts.isEmpty
                          ? const NoProductsWidget()
                          : GenericBuilderWidget(
                          filteredProducts: filteredProducts, onClick: onClick!,),
                    ),
                  ],
                ),
              ),
            );

          default:
            return const AppLoader();

        }
      },
    );
  }
}
