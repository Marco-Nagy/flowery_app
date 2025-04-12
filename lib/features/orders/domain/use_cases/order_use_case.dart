import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../../../track_order/domain/entities/track_order_entity.dart';
import '../contracts/order_repo.dart';

@injectable
class OrderUseCase {
  final OrderRepo _orderRepo;

  @factoryMethod
  OrderUseCase(this._orderRepo);

  Future<DataResult<List<TrackOrderEntity>>> call(
      {required String userId}) async {
    return _orderRepo.getOrderByUser(userId: userId);
  }
}
