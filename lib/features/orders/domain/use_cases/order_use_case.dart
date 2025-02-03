import 'package:injectable/injectable.dart';
import '../../../../core/networking/common/api_result.dart';
import '../contracts/order_repo.dart';
import '../entities/order_response_entity.dart';

@injectable
class OrderUseCase {
  final OrderRepo _orderRepo;
  @factoryMethod

  OrderUseCase(this._orderRepo);

  Future<DataResult<OrderResponseEntity>> getOrders(
       ) async {
    return await _orderRepo.getOrders();
  }
}