part of 'cart_view_model_cubit.dart';

sealed class CartViewModelState extends Equatable {
  const CartViewModelState();
}

final class CartViewModelInitial extends CartViewModelState {
  @override
  List<Object> get props => [];
}

final class CartViewModelLoading extends CartViewModelState {
  @override
  List<Object> get props => [];
}

final class CartViewModelError extends CartViewModelState {
  final ErrorModel errorModel;

  const CartViewModelError({required this.errorModel});

  @override
  List<Object> get props => [errorModel];
}

final class AddProductToCartSuccess extends CartViewModelState {
  final bool visibility;
  final int numOfCartItems;

  const AddProductToCartSuccess(
     {required this.visibility, required this.numOfCartItems,});
  @override
  List<Object?> get props => [visibility, numOfCartItems];
}

final class GetUserCartDataSuccess extends CartViewModelState {
  final CartEntity cartData;

  const GetUserCartDataSuccess({required this.cartData});

  @override
  List<Object?> get props => [cartData];
}

final class UpdateCartProductQuantitySuccess extends CartViewModelState {
  final CartEntity cartData;

  const UpdateCartProductQuantitySuccess({required this.cartData});

  @override
  List<Object?> get props => [cartData];
}

final class RemoveProductFromCartSuccess extends CartViewModelState {
  final CartEntity cartData;
  const RemoveProductFromCartSuccess({required this.cartData});

  @override
  List<Object?> get props => [];
}

class ClearUserCartDataSuccess extends CartViewModelState {
  final String message;

  const ClearUserCartDataSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}
