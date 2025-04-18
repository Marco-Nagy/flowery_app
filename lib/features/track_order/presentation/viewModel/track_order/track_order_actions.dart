

sealed class TrackOrderActions {}

class GetOrderDetails extends TrackOrderActions {
  final String userId;
  final String orderId;

  GetOrderDetails({
    required this.orderId,
    required this.userId,
  });
}

class UpdateMapLocation extends TrackOrderActions {
  double driverLat = 0.0;
  double driverLng = 0.0;

  UpdateMapLocation({required this.driverLat, required this.driverLng});
}
