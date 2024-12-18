part of 'checkout_view_model_cubit.dart';

@immutable
sealed class CheckoutViewModelState {}

final class CheckoutViewModelInitial extends CheckoutViewModelState {}

final class AddShippingAddress extends CheckoutViewModelState {


   AddShippingAddress();
}
