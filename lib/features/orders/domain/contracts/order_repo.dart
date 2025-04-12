import '../../../../core/networking/common/api_result.dart';
import '../../../track_order/domain/entities/track_order_entity.dart';

abstract class OrderRepo {
  Future<DataResult<List<TrackOrderEntity>>> getOrderByUser(
      {required String userId});
}
