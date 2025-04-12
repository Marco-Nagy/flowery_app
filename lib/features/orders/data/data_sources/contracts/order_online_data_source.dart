import '../../../../../core/networking/common/api_result.dart';
import '../../../../track_order/domain/entities/track_order_entity.dart';

abstract class OrderOnlineDataSource {
  Future<DataResult<List<TrackOrderEntity>>> getOrderByUser({required String userId});

}