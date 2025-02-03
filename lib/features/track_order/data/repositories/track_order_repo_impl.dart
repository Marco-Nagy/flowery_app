import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/track_order/data/data_sources/contracts/track_order_online_data_source.dart';
import 'package:flowery_e_commerce/features/track_order/domain/entities/track_order_entity.dart';
import 'package:flowery_e_commerce/features/track_order/domain/repositories/contract/track_order_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TrackOrderRepo)
class TrackOrderRepoImpl implements TrackOrderRepo {
  final TrackOrderOnlineDataSource _dataSource;

  @factoryMethod
  TrackOrderRepoImpl(this._dataSource);

  @override
  Stream<DataResult<TrackOrderEntity>> getOrderByOrderId({
    required String userId,
    required String orderId,
  }) {
    return _dataSource.getOrderByOrderId(userId: userId, orderId: orderId);
  }
}
