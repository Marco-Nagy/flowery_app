part of 'categories_view_model_cubit.dart';

sealed class CategoriesViewModelState {}

final class CategoriesViewModelInitial extends CategoriesViewModelState {}

final class GetCategoriesViewModelLoading extends CategoriesViewModelState {}

final class GetCategoriesViewModelSuccess extends CategoriesViewModelState {
  final List<GetAllCategoriesResponseCategoriesEntity?>? categories;

  GetCategoriesViewModelSuccess({required this.categories});
}

final class GetCategoriesViewModelError extends CategoriesViewModelState {
  final ErrorModel error;
  GetCategoriesViewModelError({required this.error});
}
