part of 'generic_item_view_model_cubit.dart';

@immutable
sealed class GenericItemViewModeState {}

final class GetItemsInitial extends GenericItemViewModeState {}

final class GetItemsLoading extends GenericItemViewModeState {}

final class GetItemsSuccess extends GenericItemViewModeState {
  final List<Items> items;

  GetItemsSuccess({required this.items});
}

final class GetItemsError extends GenericItemViewModeState {
  final ErrorModel error;
  GetItemsError({required this.error});
}

final class GetProductLoading extends GenericItemViewModeState {}

final class GetProductSuccess extends GenericItemViewModeState {
  final List<ProductEntity> products;

  GetProductSuccess({required this.products});
}

final class GetProductError extends GenericItemViewModeState {
  final ErrorModel error;

  GetProductError({required this.error});
}

class FilteredProductsState extends GenericItemViewModeState {
  final List<ProductEntity> filteredProducts;
  FilteredProductsState({required this.filteredProducts});
}

class FilteredItemsLoading extends GenericItemViewModeState {}
class errorMassage extends GenericItemViewModeState {
  final String error;
  errorMassage({required this.error});
}