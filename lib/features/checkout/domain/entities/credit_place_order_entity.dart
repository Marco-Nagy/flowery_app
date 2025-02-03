class CreditPlaceOrderEntity {
  final String orderId;
  final String userId;
  final String orderStatus;
  final String url;

  CreditPlaceOrderEntity({
    required this.userId,
    required this.orderId,
    required this.orderStatus,
    required this.url,
  });
}
