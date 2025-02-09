sealed class MapActions {}


class GetOrderDetails extends MapActions {
  final String userId, orderId;


  GetOrderDetails( {
    required this.orderId,
    required this.userId,
  });
}