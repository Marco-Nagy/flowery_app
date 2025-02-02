import '../../../../../core/networking/common/api_result.dart';
import '../../../domain/entities/order_response_entity.dart';

abstract class OrderOnlineDataSource {
  Future<DataResult<OrderResponseEntity>> getOrders();
}