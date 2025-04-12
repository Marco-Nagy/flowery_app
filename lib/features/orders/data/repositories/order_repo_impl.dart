import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../../../track_order/domain/entities/track_order_entity.dart';
import '../../domain/contracts/order_repo.dart';
import '../data_sources/contracts/order_online_data_source.dart';

@Injectable(as: OrderRepo)
class OrderRepoImpl implements OrderRepo {
  final OrderOnlineDataSource _onlineDataSource;

  @factoryMethod
  OrderRepoImpl(this._onlineDataSource);

  @override
  Future<DataResult<List<TrackOrderEntity>>> getOrderByUser({
    required String userId,
  }) {
    return _onlineDataSource.getOrderByUser(userId: userId);
  }
}
