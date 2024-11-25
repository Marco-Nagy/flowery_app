import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/widgets/base/app_loader.dart';
import '../../../../../core/utils/widgets/spacing.dart';
import '../../../../../di/di.dart';
import '../widget/no_products_widget.dart';
import '../../../../generic/presentation/widgets/tab_bar_widget.dart';
import '../viewModel/generic_item_action.dart';
import '../viewModel/generic_item_view_model_cubit.dart';
import '../widget/generic_builder_widget.dart';

class GenericItemScreen extends StatelessWidget {
  const GenericItemScreen(
      {Key? key, required this.resourceName, required this.field})
      : super(key: key);
  final String resourceName, field;

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => getIt.get<GenericItemViewModelCubit>()
        ..doAction(GetItemAction(resourceName))
        ..doAction(GetProductAction()),
      child: BlocBuilder<GenericItemViewModelCubit, GenericItemViewModeState>(
        builder: (context, state) {
          final cubit = context.read<GenericItemViewModelCubit>();

          switch (state.runtimeType) {
            case GetProductError:
              final errorState = state as GetProductError;
              return Text(errorState.error.error.toString());

            case GetItemsLoading:
            case GetProductLoading:
              return Center(child: AppLoader());

            case GetItemsSuccess:
            case FilteredProductsState:
              final items = cubit.items;
              final filteredProducts = state is FilteredProductsState
                  ? state.filteredProducts
                  : cubit.allProducts;

              return DefaultTabController(
                length: items.length + 1,
                child: Expanded(
                  child: Column(
                    children: [
                      tabBarWidget(
                        tabs: [
                          const Tab(text: 'All'),
                          ...items.map((item) => Tab(text: item.name)).toList(),
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
                            filteredProducts: filteredProducts),
                      ),
                    ],
                  ),
                ),
              );

            default:
               return const SizedBox.shrink();

          }
        },
      ),
    );
  }
}
