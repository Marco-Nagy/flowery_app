import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/localization/lang_keys.dart';
import '../../../../../core/utils/widgets/base/app_loader.dart';
import '../../../../../core/utils/widgets/spacing.dart';
import '../widget/no_products_widget.dart';
import '../../../../generic/presentation/widgets/tab_bar_widget.dart';
import '../viewModel/generic_item_action.dart';
import '../viewModel/generic_item_view_model_cubit.dart';
import '../widget/generic_builder_widget.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
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
        final items = cubit.items;
        final filteredProducts = state is FilteredProductsState
            ? state.filteredProducts
            : cubit.allProducts;
        switch (state) {
          case GetItemsSuccess():
          case GetProductSuccess():
          case FilteredProductsState():
            return DefaultTabController(
              length: items.length + 1,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    tabBarWidget(
                      tabs: [
                         Tab(text: context.translate(LangKeys.all),),
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
                              filteredProducts: filteredProducts,
                              onClick: onClick!,
                            ),
                    ),
                  ],
                ),
              ),
            );
          case FilteredItemsLoading():
          case GetItemsLoading():
          case GetProductLoading():
            return const Center(child: AppLoader());
          case GetItemsError():
          case GetProductError():
            break;
          case ErrorMessage():
            return Text(state.error.toString());
          case GetItemsInitial():
        }
        return const Center(child: NoProductsWidget());
      },
    );
  }
}
