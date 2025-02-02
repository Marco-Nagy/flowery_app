import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/orders/domain/entities/order_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/networking/api/api_manager.dart';
import '../../../../../core/networking/api_execute.dart';
import '../../mappers/order_mapper.dart';
import '../contracts/order_online_data_source.dart';

@Injectable(as: OrderOnlineDataSource)
class OrderOnlineDataSourceImpl extends OrderOnlineDataSource {
  final ApiManager _apiManager;
@factoryMethod
  OrderOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<OrderResponseEntity>> getOrders() async{
    return await executeApi(() async {
      var response = await _apiManager.getUserOrders();
      return OrderMapper.toEntity(response);
    });
  }
}