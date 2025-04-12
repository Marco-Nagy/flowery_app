part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}
final class OrderLoading extends OrderState {}

final class OrderError extends OrderState {
  final ErrorModel error;
  OrderError({required this.error});
}

final class GetOrderByUserSuccess extends OrderState {
  final List<TrackOrderEntity> orders;

  GetOrderByUserSuccess(this.orders);
}




