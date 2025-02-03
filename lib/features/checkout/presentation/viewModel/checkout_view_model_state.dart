part of 'checkout_view_model_cubit.dart';

@immutable
sealed class CheckoutViewModelState {}

final class CheckoutViewModelInitial extends CheckoutViewModelState {}

final class AddShippingAddress extends CheckoutViewModelState {}
final class SelectPaymentOption extends CheckoutViewModelState {}
final class CheckoutLoading extends CheckoutViewModelState {}
final class CheckoutCashSuccess extends CheckoutViewModelState {
  final CashPlaceOrderEntity placeOrder;
  CheckoutCashSuccess({required this.placeOrder });
}

final class CheckoutCreditSuccess extends CheckoutViewModelState {
  final CreditPlaceOrderEntity placeOrder;
  CheckoutCreditSuccess({required this.placeOrder });
}
final class CheckoutError extends CheckoutViewModelState {
  final ErrorModel error;
  CheckoutError({required this.error });
}
