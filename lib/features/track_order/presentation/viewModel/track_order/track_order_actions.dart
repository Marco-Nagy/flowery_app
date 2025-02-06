
sealed class TrackOrderActions {}



class GetOrderDetails extends TrackOrderActions {
  final String userId;
  final String orderId;

  GetOrderDetails({
    required this.orderId,
    required this.userId,
  });
}


