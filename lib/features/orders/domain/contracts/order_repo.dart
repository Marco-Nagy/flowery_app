import '../../../../core/networking/common/api_result.dart';
import '../entities/order_response_entity.dart';

abstract class OrderRepo {
  Future<DataResult<OrderResponseEntity>> getOrders();
}