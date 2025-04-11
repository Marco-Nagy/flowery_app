
import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/features/track_order/domain/entities/track_order_entity.dart';

abstract class TrackOrderOnlineDataSource {
  Stream<DataResult<TrackOrderEntity>> getOrderByOrderId({required String userId, required String orderId});
}
