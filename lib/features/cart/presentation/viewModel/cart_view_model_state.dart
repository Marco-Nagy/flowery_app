part of 'cart_view_model_cubit.dart';

sealed class CartViewModelState extends Equatable {
  const CartViewModelState();
}

final class CartViewModelInitial extends CartViewModelState {
  @override
  List<Object> get props => [];
}
