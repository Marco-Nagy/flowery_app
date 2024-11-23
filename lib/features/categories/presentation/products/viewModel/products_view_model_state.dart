part of 'products_view_model_cubit.dart';

@immutable
sealed class ProductsViewModelState {}

final class ProductsViewModelInitial extends ProductsViewModelState {}

final class GetProductsViewModelLoading extends ProductsViewModelState {}

final class GetProductsViewModelSuccess extends ProductsViewModelState {
  final GetAllProductsRsponseEntity data;

  GetProductsViewModelSuccess({required this.data});
}

final class GetProductsViewModelError extends ProductsViewModelState {
  final ErrorModel error;

  GetProductsViewModelError({required this.error});
}
