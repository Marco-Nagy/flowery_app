import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/track_order/domain/entities/track_order_entity.dart';

abstract class TrackOrderRepo {
  Stream<DataResult<TrackOrderEntity>> getOrderByOrderId({required String userId, required String orderId});

}
