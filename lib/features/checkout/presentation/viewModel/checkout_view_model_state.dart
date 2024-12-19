part of 'checkout_view_model_cubit.dart';

@immutable
sealed class CheckoutViewModelState {}

final class CheckoutViewModelInitial extends CheckoutViewModelState {}

final class AddShippingAddress extends CheckoutViewModelState {}
final class SelectPaymentOption extends CheckoutViewModelState {}
final class CheckoutLoading extends CheckoutViewModelState {}
final class CheckoutCashSuccess extends CheckoutViewModelState {
  final String successMessage;
  CheckoutCashSuccess({required this.successMessage });
}

final class CheckoutCreditSuccess extends CheckoutViewModelState {
  final String url;
  CheckoutCreditSuccess({required this.url });
}
final class CheckoutError extends CheckoutViewModelState {
  final ErrorModel error;
  CheckoutError({required this.error });
}
