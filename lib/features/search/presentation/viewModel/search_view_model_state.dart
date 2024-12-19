part of 'search_view_model_cubit.dart';

@immutable
sealed class SearchViewModelState {}

final class SearchViewModelInitial extends SearchViewModelState {}

final class SearchViewModelLoading extends SearchViewModelState {}

final class SearchViewModelSuccess extends SearchViewModelState {
  final SearchResponseEntity result;

  SearchViewModelSuccess(this.result);
}

final class SearchViewModelFailure extends SearchViewModelState {
  final ErrorModel message;

  SearchViewModelFailure(this.message);
}
