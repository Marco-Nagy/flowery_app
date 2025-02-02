import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../../domain/contracts/order_repo.dart';
import '../../domain/entities/order_response_entity.dart';
import '../data_sources/contracts/order_online_data_source.dart';

@Injectable(as: OrderRepo)
class OrderRepoImpl implements OrderRepo {
  final OrderOnlineDataSource _onlineDataSource;

  @factoryMethod
  OrderRepoImpl(this._onlineDataSource);

  @override
  Future<DataResult<OrderResponseEntity>> getOrders() async {
    var result = await _onlineDataSource.getOrders();
    return result;
  }
}
