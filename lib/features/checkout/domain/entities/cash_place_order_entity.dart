class CashPlaceOrderEntity {
  final String orderId;
  final String userId;
  final String orderStatus;

  CashPlaceOrderEntity( {
    required this.userId,
    required this.orderId,
    required this.orderStatus,
  });
}
