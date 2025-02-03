part of 'search_view_model_cubit.dart';

@immutable
sealed class SearchViewModelState {}

final class SearchViewModelInitial extends SearchViewModelState {}

final class SearchViewModelLoading extends SearchViewModelState {}

final class SearchViewModelSuccess extends SearchViewModelState {
  final ProductResponseEntity products;

  SearchViewModelSuccess(this.products);
}

final class SearchViewModelFailure extends SearchViewModelState {
  final ErrorModel message;

  SearchViewModelFailure(this.message);
}
