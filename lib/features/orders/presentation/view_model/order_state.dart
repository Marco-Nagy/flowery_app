part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}
final class OrderLoading extends OrderState {}

final class OrderSuccess extends OrderState {
  final List<Orders>? orders;

  OrderSuccess({required this.orders});
}

final class OrderError extends OrderState {
  final ErrorModel error;
  OrderError({required this.error});
}
