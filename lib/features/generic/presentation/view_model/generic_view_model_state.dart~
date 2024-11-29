part of 'generic_view_model_cubit.dart';

@immutable
sealed class GenericViewModelState {}

final class GenericViewModelInitial extends GenericViewModelState {}

class CatalogLoadingState extends GenericViewModelState {}

class CatalogLoadedState extends GenericViewModelState {
  final List<Items> items;

  CatalogLoadedState(this.items);
}

class CatalogErrorState extends GenericViewModelState {
  final String message;

  CatalogErrorState(this.message);
}

class GenericItemSuccessState extends GenericViewModelState {
  final List<Items> items;

  GenericItemSuccessState(this.items);
}

class GenericItemErrorState extends GenericViewModelState {
  final ErrorModel message;

  GenericItemErrorState(this.message);
}

class GenericItemLoadedState extends GenericViewModelState {}
