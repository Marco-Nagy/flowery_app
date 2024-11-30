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

final class AddCarItemSuccess extends CartViewModelState {
 final bool visibility;

  const AddCarItemSuccess({required this.visibility });
  @override
  // TODO: implement props
  List<Object?> get props =>[visibility];
}
